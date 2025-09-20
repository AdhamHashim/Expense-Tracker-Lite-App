import 'package:flutter_base/src/config/res/config_imports.dart';
import 'package:flutter_base/src/features/logic/add_expenses/models/category_entity.dart';
import 'package:flutter_base/src/features/logic/main_tab/models/balance_entity.dart';
import 'package:flutter_base/src/features/logic/main_tab/models/expenses_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BalanceEntity Unit Tests', () {
    late BalanceEntity balanceEntity;
    late List<ExpensesEntity> expensesList;

    setUp(() {
      final categoryEntity = const CategoryEntity(
        id: 1,
        title: 'Test Category',
        icon: 'test_icon',
      );

      expensesList = [
        ExpensesEntity(
          id: 1,
          amount: 100.0,
          date: '2024-01-01',
          dateAgo: '1 day ago',
          amountAfterConvertToDollar: 100.0,
          currencyValueToDollar: 1.0,
          currency: 'USD',
          category: categoryEntity,
        ),
        ExpensesEntity(
          id: 2,
          amount: 50.0,
          date: '2024-01-02',
          dateAgo: '2 days ago',
          amountAfterConvertToDollar: 50.0,
          currencyValueToDollar: 1.0,
          currency: 'USD',
          category: categoryEntity,
        ),
      ];

      balanceEntity = BalanceEntity(
        totalBalance: 1000.0,
        incomeBalance: 1200.0,
        expensesBalance: 200.0,
        expenses: expensesList,
      );
    });

    group('Constructor', () {
      test('should create BalanceEntity with all required fields', () {
        expect(balanceEntity.totalBalance, equals(1000.0));
        expect(balanceEntity.incomeBalance, equals(1200.0));
        expect(balanceEntity.expensesBalance, equals(200.0));
        expect(balanceEntity.expenses, equals(expensesList));
        expect(balanceEntity.expenses.length, equals(2));
      });
    });

    group('initial factory', () {
      test('should create initial BalanceEntity with default values', () {
        final initialEntity = BalanceEntity.initial();

        expect(initialEntity.totalBalance, equals(0.0));
        expect(initialEntity.incomeBalance, equals(0.0));
        expect(initialEntity.expensesBalance, equals(0.0));
        expect(initialEntity.expenses, isEmpty);
      });
    });

    group('Equality', () {
      test('should support equality comparison', () {
        final balanceEntity2 = BalanceEntity(
          totalBalance: 1000.0,
          incomeBalance: 1200.0,
          expensesBalance: 200.0,
          expenses: expensesList,
        );

        expect(balanceEntity, equals(balanceEntity2));
      });

      test('should not be equal when fields differ', () {
        final balanceEntity2 = BalanceEntity(
          totalBalance: 2000.0, // Different total balance
          incomeBalance: 1200.0,
          expensesBalance: 200.0,
          expenses: expensesList,
        );

        expect(balanceEntity, isNot(equals(balanceEntity2)));
      });
    });

    group('JSON serialization', () {
      test('should convert to JSON correctly', () {
        final json = balanceEntity.toJson();

        expect(json['totalBalance'], equals(1000.0));
        expect(json['incomeBalnce'], equals(1200.0));
        expect(json['expensesBalance'], equals(200.0));
        expect(json['expenses'], isA<List>());
        expect(json['expenses'].length, equals(2));
      });

      test('should create from JSON correctly', () {
        final json = {
          'totalBalance': 1000.0,
          'incomeBalnce': 1200.0,
          'expensesBalance': 200.0,
          'expenses': [
            {
              'id': 1,
              'amount': 100.0,
              'date': '2024-01-01',
              'dateAgo': '1 day ago',
              'amountAfterConvertToDollar': 100.0,
              'currencyValueToDollar': 1.0,
              'currency': 'USD',
              'category': {
                'id': 1,
                'title': 'Test Category',
                'icon': 'test_icon',
                'color': 'FF0000',
              },
            },
          ],
        };

        final entity = BalanceEntity.fromJson(json);

        expect(entity.totalBalance, equals(1000.0));
        expect(entity.incomeBalance, equals(1200.0));
        expect(entity.expensesBalance, equals(200.0));
        expect(entity.expenses.length, equals(1));
      });
    });

    group('BalanceEntityAdapter', () {
      test('should have correct typeId', () {
        final adapter = BalanceEntityAdapter();
        expect(adapter.typeId, equals(HiveBoxesConstant.balanceTypeID));
      });
    });
  });
}
