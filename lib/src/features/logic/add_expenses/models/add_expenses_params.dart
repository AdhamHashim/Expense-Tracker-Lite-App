import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../config/language/locale_keys.g.dart';
import '../../../../config/res/config_imports.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/widgets/buttons/custom_animated_button.dart';
import '../../../../core/widgets/custom_date_picker.dart';
import '../../../../core/widgets/custom_messages.dart';
import '../../main_tab/models/expenses_entity.dart';
import 'category_entity.dart';
import 'currency_entity.dart';

class AddExpensesParams {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);
  final ValueNotifier<CategoryEntity?> categoryNotifier =
      ValueNotifier<CategoryEntity?>(
    null,
  );
  CurrencyEntity? currency;

  DateTime date = DateTime.now();

  void updateDateTime(DateTime value) => date = value;

  bool validateForm() => formKey.currentState!.validate();

  void updateCategory(CategoryEntity? value) {
    categoryNotifier.value = value;
  }

  void dispose() {
    amountController.dispose();
    dateController.dispose();
    imageController.dispose();
    imageNotifier.dispose();
    categoryNotifier.dispose();
    btnKey.currentState?.dispose();
  }

  void uploadImage() async {
    final result = await Helpers.getImageFromCameraOrDevice();
    if (result != null) {
      imageController.text = LocaleKeys.imageUploadSuccefully;
      imageNotifier.value = result;
    } else {
      MessageUtils.showSnackBar(
        LocaleKeys.exceptionError,
      );
    }
  }

  void selectDate() async {
    final currentDate = await showCustomDatePicker(
      controller: dateController,
    );
    date = currentDate ?? DateTime.now();
  }

  Future<void> addExpense() async {
    if (!validateForm()) return;
    btnKey.currentState!.animateForward();
    await HiveBoxesConstant.getBalance();
    btnKey.currentState!.animateReverse();
    MessageUtils.showSnackBar(LocaleKeys.addexpensesSuccefully);
    Go.back();
  }
}

extension ConverExpnsesParamsToModel on AddExpensesParams {
  ExpensesEntity toModel() {
    final double amount = double.parse(amountController.text);
    final double amountAfterConvertToDollar =
        (amount / currency!.currency).round().toDouble();

    return ExpensesEntity(
      id: HiveBoxesConstant.generateRandomId(),
      currency: currency!.currencyTitle,
      currencyValueToDollar: currency!.currency,
      date: dateController.text,
      dateAgo: timeago.format(date),
      amount: amount,
      amountAfterConvertToDollar: amountAfterConvertToDollar,
      category: categoryNotifier.value!,
    );
  }
}
