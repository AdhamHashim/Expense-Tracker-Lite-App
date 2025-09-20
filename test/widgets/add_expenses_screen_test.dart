import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/logic/add_expenses/presentation/imports/view_imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() {
  group('AddExpensesScreen Widget Tests', () {
    testWidgets('should render AddExpensesScreen with all required blocs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(),
            child: BlocProvider<CurrencyBloc>(
              create: (context) => CurrencyBloc(),
              child: BlocProvider<ExpensesBloc>(
                create: (context) => ExpensesBloc(),
                child: const AddExpensesScreen(),
              ),
            ),
          ),
        ),
      );

      // Verify that the screen is rendered
      expect(find.byType(AddExpensesScreen), findsOneWidget);
    });

    testWidgets('should have proper scaffold structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(),
            child: BlocProvider<CurrencyBloc>(
              create: (context) => CurrencyBloc(),
              child: BlocProvider<ExpensesBloc>(
                create: (context) => ExpensesBloc(),
                child: const AddExpensesScreen(),
              ),
            ),
          ),
        ),
      );

      // Verify scaffold is present
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should initialize all blocs correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(),
            child: BlocProvider<CurrencyBloc>(
              create: (context) => CurrencyBloc(),
              child: BlocProvider<ExpensesBloc>(
                create: (context) => ExpensesBloc(),
                child: const AddExpensesScreen(),
              ),
            ),
          ),
        ),
      );

      // Verify all blocs are created
      expect(find.byType(CategoryBloc), findsOneWidget);
      expect(find.byType(CurrencyBloc), findsOneWidget);
      expect(find.byType(ExpensesBloc), findsOneWidget);
    });
  });
}
