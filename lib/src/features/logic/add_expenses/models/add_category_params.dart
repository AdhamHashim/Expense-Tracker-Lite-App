import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../config/language/locale_keys.g.dart';
import '../../../../config/res/config_imports.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/buttons/custom_animated_button.dart';
import '../../../../core/widgets/custom_messages.dart';
import 'category_entity.dart';

class AddCategoryParams {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);

  bool validateForm() => formKey.currentState!.validate();

  void dispose() {
    imageController.dispose();
    imageNotifier.dispose();
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
}

extension ConvertCaregoryParamsToModel on AddCategoryParams {
  CategoryEntity toModel() {
    return CategoryEntity(
      id: HiveBoxesConstant.generateRandomId(),
      icon: imageNotifier.value!.path,
      title: titleController.text,
    );
  }
}
