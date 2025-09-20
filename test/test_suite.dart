import 'package:flutter_test/flutter_test.dart';

// Widget Tests
import 'widgets/custom_text_field_test.dart' as custom_text_field_test;
import 'widgets/add_expenses_screen_test.dart' as add_expenses_screen_test;
import 'widgets/home_screen_test.dart' as home_screen_test;
import 'widgets/splash_screen_test.dart' as splash_screen_test;

// Unit Tests
import 'unit/blocs/balance_bloc_test.dart' as balance_bloc_test;
import 'unit/models/expenses_entity_test.dart' as expenses_entity_test;
import 'unit/models/balance_entity_test.dart' as balance_entity_test;

void main() {
  group('Expense Tracker Lite App - Complete Test Suite', () {
    group('Widget Tests', () {
      custom_text_field_test.main();
      add_expenses_screen_test.main();
      home_screen_test.main();
      splash_screen_test.main();
    });

    group('Unit Tests', () {
      balance_bloc_test.main();
      expenses_entity_test.main();
      balance_entity_test.main();
    });
  });
}
