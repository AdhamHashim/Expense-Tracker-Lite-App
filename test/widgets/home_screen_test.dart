import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/logic/home/presentation/imports/presentation_imports.dart';
import 'package:flutter_base/src/features/logic/main_tab/presentation/imports/view_imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should render HomeScreen with BalanceBloc', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<BalanceBloc>(
            create: (context) => BalanceBloc(),
            child: const HomeScreen(),
          ),
        ),
      );

      // Verify that the screen is rendered
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('should initialize BalanceBloc correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<BalanceBloc>(
            create: (context) => BalanceBloc(),
            child: const HomeScreen(),
          ),
        ),
      );

      // Verify BalanceBloc is created
      expect(find.byType(BalanceBloc), findsOneWidget);
    });

    testWidgets('should have proper scaffold structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<BalanceBloc>(
            create: (context) => BalanceBloc(),
            child: const HomeScreen(),
          ),
        ),
      );

      // Verify scaffold is present
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should call initState and dispose properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<BalanceBloc>(
            create: (context) => BalanceBloc(),
            child: const HomeScreen(),
          ),
        ),
      );

      // Verify the widget is built
      expect(find.byType(HomeScreen), findsOneWidget);

      // Dispose the widget
      await tester.pumpWidget(const SizedBox.shrink());
      
      // Verify disposal works without errors
      expect(tester.takeException(), isNull);
    });
  });
}
