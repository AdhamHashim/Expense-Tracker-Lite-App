import 'package:flutter_base/src/config/res/config_imports.dart';
import 'package:flutter_base/src/features/logic/add_expenses/models/category_entity.dart';
import 'package:flutter_base/src/features/logic/main_tab/models/expenses_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensesEntity Unit Tests', () {
    late ExpensesEntity expensesEntity;
    late CategoryEntity categoryEntity;

    setUp(() {
      categoryEntity = const CategoryEntity(
        id: 1,
        title: 'Test Category',
        icon: 'test_icon',
      );

      expensesEntity = ExpensesEntity(
        id: 1,
        amount: 100.0,
        date: '2024-01-01',
        dateAgo: '1 day ago',
        amountAfterConvertToDollar: 100.0,
        currencyValueToDollar: 1.0,
        currency: 'USD',
        category: categoryEntity,
      );
    });

    group('Constructor', () {
      test('should create ExpensesEntity with all required fields', () {
        expect(expensesEntity.id, equals(1));
        expect(expensesEntity.amount, equals(100.0));
        expect(expensesEntity.date, equals('2024-01-01'));
        expect(expensesEntity.dateAgo, equals('1 day ago'));
        expect(expensesEntity.amountAfterConvertToDollar, equals(100.0));
        expect(expensesEntity.currencyValueToDollar, equals(1.0));
        expect(expensesEntity.currency, equals('USD'));
        expect(expensesEntity.category, equals(categoryEntity));
      });
    });

    group('fromJson', () {
      test('should create ExpensesEntity from valid JSON', () {
        final json = {
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
        };

        final entity = ExpensesEntity.fromJson(json);

        expect(entity.id, equals(1));
        expect(entity.amount, equals(100.0));
        expect(entity.date, equals('2024-01-01'));
        expect(entity.dateAgo, equals('1 day ago'));
        expect(entity.amountAfterConvertToDollar, equals(100.0));
        expect(entity.currencyValueToDollar, equals(1.0));
        expect(entity.currency, equals('USD'));
        expect(entity.category.id, equals(1));
        expect(entity.category.title, equals('Test Category'));
      });
    });

    group('toJson', () {
      test('should convert ExpensesEntity to JSON', () {
        final json = expensesEntity.toJson();

        expect(json['id'], equals(1));
        expect(json['amount'], equals(100.0));
        expect(json['date'], equals('2024-01-01'));
        expect(json['dateAgo'], equals('1 day ago'));
        expect(json['amountAfterConvertToDollar'], equals(100.0));
        expect(json['currencyValueToDollar'], equals(1.0));
        expect(json['currency'], equals('USD'));
        expect(json['category'], isA<Map<String, dynamic>>());
      });
    });

    group('Equality', () {
      test('should support equality comparison', () {
        final expensesEntity2 = ExpensesEntity(
          id: 1,
          amount: 100.0,
          date: '2024-01-01',
          dateAgo: '1 day ago',
          amountAfterConvertToDollar: 100.0,
          currencyValueToDollar: 1.0,
          currency: 'USD',
          category: categoryEntity,
        );

        expect(expensesEntity, equals(expensesEntity2));
      });

      test('should not be equal when fields differ', () {
        final expensesEntity2 = ExpensesEntity(
          id: 2, // Different id
          amount: 100.0,
          date: '2024-01-01',
          dateAgo: '1 day ago',
          amountAfterConvertToDollar: 100.0,
          currencyValueToDollar: 1.0,
          currency: 'USD',
          category: categoryEntity,
        );

        expect(expensesEntity, isNot(equals(expensesEntity2)));
      });
    });

    group('ExpensesEntityAdapter', () {
      test('should have correct typeId', () {
        final adapter = ExpensesEntityAdapter();
        expect(adapter.typeId, equals(HiveBoxesConstant.expensesTypeID));
      });
    });
  });
}
