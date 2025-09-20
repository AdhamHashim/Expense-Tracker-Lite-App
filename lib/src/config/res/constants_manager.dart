part of 'config_imports.dart';

final GetIt injector = GetIt.instance;

class ConstantManager {
  static const String bundleId = 'com.flutter.app_name';
  static const String appName = 'INOVOLA Expense Tracker Lite App';
  static const String fontFamily = 'IBM';
  static const String token = 'token';
  static const String projectName = 'Flutter_base';
  static const int splashTimer = 3000;
  static const String baseUrl = '';
  static const int paginationFirstPage = 1;
  static const int paginationPageSize = 10;
  static const String emptyText = '';
  static const int zero = 0;
  static const double zeroAsDouble = 0.0;
  static const int pinCodeFieldsCount = 4;
  static const int maxLines = 4;
  static const double snackbarElevation = 4;
  static const int snackbarDuration = 2;
  static const int connectTimeoutDuration = 180;
  static const int recieveTimeoutDuration = 180;
  static const double customImageSliderAsepctRatio = 3;
  static const String ar = 'ar';
  static const String en = 'en';
  static const String arabic = 'العربية';
  static const String english = 'English';
  static String saudiArabCountryCode =
      Languages.currentLanguage.languageCode == 'ar' ? '966+' : '+966';
  static const int pgSize = 10;
  static String platform = Platform.isAndroid ? 'android' : 'ios';
  static const int pgFirst = 1;
  static const double cardElevation = 1;
  static const int rateCount = 5;
  static const double minRateCount = 1;
}

class HiveBoxesConstant {
  static const String balanceBox = "Balance_Box";
  static const String categoryBox = "Category_Box";

  static const String balanceObject = "Balance_Object";
  static const String categoryList = "Category_List";

  static const int categoryTypeID = 0;
  static const int expensesTypeID = 1;
  static const int balanceTypeID = 2;

  static final getBalanceBox = Hive.box(balanceBox);
  static final getCategoryBox = Hive.box(
    categoryBox,
  );

  static int generateRandomId() {
    final random = Random();
    return random.nextInt(1000000); // توليد رقم من 0 إلى 999999
  }

  static Future<BalanceEntity?> getBalance({
    int page = ConstantManager.zero,
    int pageSize = ConstantManager.paginationPageSize,
    bool fetchAllData = false,
    int filter = 0,
  }) async {
    final BalanceEntity? data = getBalanceBox.get(balanceObject);
    if (data != null) {
      if (fetchAllData) {
        return data;
      } else {
        BalanceEntity filtered;
        switch (filter) {
          case 3:
            filtered = BalanceEntity(
              totalBalance: data.totalBalance,
              incomeBalance: data.incomeBalance,
              expensesBalance: data.expensesBalance,
              expenses: data.thisMonth(),
            );
            break;
          case 2:
            filtered = BalanceEntity(
              totalBalance: data.totalBalance,
              incomeBalance: data.incomeBalance,
              expensesBalance: data.expensesBalance,
              expenses: data.last7Days(),
            );
            break;
          case 1:
            filtered = BalanceEntity(
              totalBalance: data.totalBalance,
              incomeBalance: data.incomeBalance,
              expensesBalance: data.expensesBalance,
              expenses: data.lastDay(),
            );
            break;
          default:
            filtered = data;
        }
        
        return data.paginate(filtered, page, pageSize);
      }
    }
    return null;
  }

  static Future<List<CategoryEntity>> getCategories() async {
    final data = await getCategoryBox.get(categoryList);
    if (data != null && data.isNotEmpty) {
      return (data as List).cast<CategoryEntity>();
    }
    return [];
  }

  static Future<void> putBalance(
    AddExpensesParams params,
  ) async {
    final balanceEntity = await getBalance(fetchAllData: true);

    if (balanceEntity != null) {
      final newExpnse = params.toModel();

      final updatedExpenses = List<ExpensesEntity>.from(balanceEntity.expenses)
        ..insert(0, newExpnse);

      final incomeBalance =
          balanceEntity.totalBalance - newExpnse.amountAfterConvertToDollar;

      final expensesBalance =
          balanceEntity.expensesBalance + newExpnse.amountAfterConvertToDollar;

      final updatedBalance = BalanceEntity(
        totalBalance: balanceEntity.totalBalance,
        incomeBalance: incomeBalance,
        expensesBalance: expensesBalance,
        expenses: updatedExpenses,
      );

      await getBalanceBox.put(balanceObject, updatedBalance);
    }
  }

  static Future<void> putCategories(CategoryEntity? category) async {
    final List<CategoryEntity> items = await getCategories();
    if (category != null) {
      items.add(category);
    }
    await getCategoryBox.put(categoryList, items);
  }
}

extension BalanceEntityExtensions on BalanceEntity {
  /// Filter expenses by a date range
  List<ExpensesEntity> filterByDateRange(DateTime start, DateTime end) {
    return expenses.where((e) {
      final expDate = DateTime.parse(e.date);
      return expDate.isAfter(start.subtract(const Duration(days: 1))) &&
          expDate.isBefore(end.add(const Duration(days: 1)));
    }).toList();
  }

  /// Pagination (page starts at 0)
  BalanceEntity? paginate(
    BalanceEntity? source,
    int page,
    int pageSize,
  ) {
    if (source == null) return null;
    
    // If pageSize is 0, return all data
    if (pageSize == 0) {
      return source;
    }
    
    final startIndex = page * pageSize;
    
    if (startIndex >= source.expenses.length) {
      return BalanceEntity(
        totalBalance: source.totalBalance,
        incomeBalance: source.incomeBalance,
        expensesBalance: source.expensesBalance,
        expenses: [],
      );
    }
    
    final endIndex = (startIndex + pageSize).clamp(0, source.expenses.length);
    final paginatedExpenses = source.expenses.sublist(startIndex, endIndex);
    
    return BalanceEntity(
      totalBalance: source.totalBalance,
      incomeBalance: source.incomeBalance,
      expensesBalance: source.expensesBalance,
      expenses: paginatedExpenses,
    );
  }

  /// Filter by last 1 day
  List<ExpensesEntity> lastDay() {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 1));
    return filterByDateRange(sevenDaysAgo, now);
  }

  /// Filter by last 7 days
  List<ExpensesEntity> last7Days() {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));
    return filterByDateRange(sevenDaysAgo, now);
  }

  /// Filter by this month
  List<ExpensesEntity> thisMonth() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    return filterByDateRange(startOfMonth, endOfMonth);
  }
}
