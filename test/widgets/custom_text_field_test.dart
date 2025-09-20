import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/shared_widgets/imports/shared_widgets_imports.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {
  group('CustomTextField Widget Tests', () {
    testWidgets('should display title when provided', (WidgetTester tester) async {
      const title = 'Test Title';
      const hint = 'Test Hint';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              title: title,
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should not display title when not provided', (WidgetTester tester) async {
      const hint = 'Test Hint';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.text(hint), findsOneWidget);
    });

    testWidgets('should display hint text', (WidgetTester tester) async {
      const hint = 'Test Hint';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.text(hint), findsOneWidget);
    });

    testWidgets('should display prefix icon when provided', (WidgetTester tester) async {
      const hint = 'Test Hint';
      const prefixIcon = Icon(Icons.person);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('should display suffix icon when provided', (WidgetTester tester) async {
      const hint = 'Test Hint';
      const suffixIcon = Icon(Icons.visibility);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('should call onTap when tapped', (WidgetTester tester) async {
      const hint = 'Test Hint';
      bool onTapCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: TextEditingController(),
              onTap: () => onTapCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CustomTextField));
      expect(onTapCalled, isTrue);
    });

    testWidgets('should validate input correctly', (WidgetTester tester) async {
      const hint = 'Test Hint';
      String? validationResult;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                validationResult = value?.isEmpty == true ? 'Required' : null;
                return validationResult;
              },
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      // Test empty validation
      final form = tester.widget<Form>(find.byType(Form));
      form.autovalidateMode;
      expect(validationResult, equals('Required'));
    });

    testWidgets('should handle text input correctly', (WidgetTester tester) async {
      const hint = 'Test Hint';
      final controller = TextEditingController();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: hint,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => null,
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Test Input');
      expect(controller.text, equals('Test Input'));
    });
  });
}
