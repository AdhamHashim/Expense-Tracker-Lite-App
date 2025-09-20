import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/settings/splash/imports/view_imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() {
  group('SplashScreen Widget Tests', () {
    testWidgets('should render SplashScreen with SplashBloc', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ),
      );

      // Verify that the screen is rendered
      expect(find.byType(SplashScreen), findsOneWidget);
    });

    testWidgets('should initialize SplashBloc correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ),
      );

      // Verify SplashBloc is created
      expect(find.byType(SplashBloc), findsOneWidget);
    });

    testWidgets('should have proper scaffold structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ),
      );

      // Verify scaffold is present
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should have centered logo', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ),
      );

      // Verify center widget is present
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('should handle animation lifecycle correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
        ),
      );

      // Verify the widget is built
      expect(find.byType(SplashScreen), findsOneWidget);

      // Wait for animation to complete
      await tester.pumpAndSettle();

      // Verify disposal works without errors
      await tester.pumpWidget(const SizedBox.shrink());
      expect(tester.takeException(), isNull);
    });
  });
}
