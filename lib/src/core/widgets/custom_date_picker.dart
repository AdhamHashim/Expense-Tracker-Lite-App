import 'package:flutter/material.dart';
import '../../config/language/languages.dart';
import '../../config/res/config_imports.dart';
import '../navigation/navigator.dart';

Future<DateTime?> showCustomDatePicker({
  required TextEditingController controller,
  String? dateFormat,
}) async {
  final DateTime? pickedDate = await showDatePicker(
    locale: Languages.currentLanguage.locale,
    context: Go.context,
    initialDate: DateTime.now(),
    firstDate: DateTime(
      DateTime.now().year,
      DateTime.now().month,
    ),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    lastDate: DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.softBlue,
            onPrimary: AppColors.black,
            onSurface: AppColors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.black,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  if (pickedDate != null) {
    controller.text = pickedDate.toString();
  }
  return pickedDate;
}
