import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/assets.gen.dart';
import '../../config/res/config_imports.dart';
import '../extensions/margin_extention.dart';
import '../extensions/padding_extension.dart';
import '../extensions/sized_box_helper.dart';
import '../extensions/text_style_extensions.dart';
import '../helpers/validators.dart';
import 'image_widgets/cached_image.dart';

enum DropDownType {
  menu,
  bottomsheet;
}

class DefaultDropDownField<T> extends StatelessWidget {
  final String Function(T?) itemAsString;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final T? selectedItem;
  final String? hint;
  final Color? fillColor;
  final String? label;
  final Future<List<T>> Function(String)? asyncItems;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget Function(BuildContext, T?)? dropdownBuilder;
  final DropDownType dropDownType;
  final BorderRadius? borderRadius;
  final String Function(T)? itemImage;
  final EdgeInsetsGeometry? contentPadding;

  const DefaultDropDownField({
    super.key,
    required this.itemAsString,
    this.asyncItems,
    this.validator,
    this.onChanged,
    this.hint,
    this.fillColor,
    this.contentPadding,
    this.selectedItem,
    this.label,
    this.prefixIcon,
    this.dropdownBuilder,
    this.dropDownType = DropDownType.bottomsheet,
    this.itemImage,
    this.borderRadius,
    this.suffixIcon,
  });

  PopupProps<T> _buildPopUpFromType(DropDownType type) {
    switch (type) {
      case DropDownType.menu:
        return PopupProps.menu(
          title: label != null
              ? Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: const TextStyle().setPrimaryColor.s14.semiBold,
                ).marginSymmetric(vertical: AppMargin.mH10)
              : null,
          showSearchBox: true,
          constraints: BoxConstraints(
            maxHeight: 300.h,
            maxWidth: 400.w,
            minWidth: 350.w,
          ),
          showSelectedItems: true,
          loadingBuilder: (context, _) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          },
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              title: Text(
                itemAsString(item),
                style: const TextStyle().setPrimaryColor.s13.semiBold,
              ),
              leading: isSelected
                  ? const Icon(
                      Icons.check,
                      color: AppColors.primary,
                    )
                  : const SizedBox.shrink(),
            );
          },
          searchFieldProps: fieldProp(),
          menuProps: const MenuProps(
            backgroundColor: AppColors.white,
          ),
        );
      case DropDownType.bottomsheet:
        return PopupProps.bottomSheet(
          title: label != null
              ? Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: const TextStyle().setPrimaryColor.s13.bold,
                ).marginSymmetric(vertical: AppMargin.mH10)
              : null,
          showSearchBox: true,
          constraints: BoxConstraints(
            maxHeight: 300.h,
            maxWidth: 400.w,
            minWidth: 350.w,
          ),
          showSelectedItems: true,
          loadingBuilder: (context, searchEntry) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          },
          itemBuilder: (context, item, isSelected) {
            return ListTile(
              title: Text(
                itemAsString(item),
                style: const TextStyle().setPrimaryColor.s13.semiBold,
              ),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected)
                    const Icon(
                      Icons.check,
                      color: AppColors.primary,
                    )
                  else
                    25.szW,
                  10.szW,
                  if (itemImage != null)
                    CachedImage(
                      url: itemImage!(item),
                      height: 20.h,
                      width: 30.w,
                      borderRadius: BorderRadius.circular(3),
                      fit: BoxFit.fill,
                    ).paddingSymmetric(horizontal: 2.w),
                ],
              ),
            );
          },
          searchFieldProps: fieldProp(),
          bottomSheetProps:
              const BottomSheetProps(backgroundColor: AppColors.black),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle().setBlackColor.s13.bold,
          ),
        DropdownSearch<T>(
          validator: validator ?? Validators.validateDropDown,
          onChanged: onChanged,
          selectedItem: selectedItem,
          clearButtonProps: const ClearButtonProps(
            color: AppColors.main,
            isVisible: false,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          dropdownDecoratorProps: dropDecoration(
            prefixIcon,
            hint,
            fillColor,
            contentPadding,
          ),
          dropdownBuilder: dropdownBuilder,
          compareFn: (item, selectedItem) => item == selectedItem,
          dropdownButtonProps: DropdownButtonProps(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle().setBlackColor.s13.bold),
            ),
            padding: EdgeInsets.zero,
            icon: AppAssets.icons.down.image(
              height: AppSize.sH14,
            ),
            visualDensity: const VisualDensity(
              horizontal: 0,
              vertical: 0,
            ),
          ),
          autoValidateMode: AutovalidateMode.onUserInteraction,
          itemAsString: itemAsString,
          popupProps: _buildPopUpFromType(dropDownType),
          asyncItems: asyncItems,
        ).paddingTop(AppMargin.mH6),
      ],
    );
  }
}

TextFieldProps fieldProp() {
  return TextFieldProps(
    style: const TextStyle().setPrimaryColor.s12.medium,
    decoration: InputDecoration(
      hintText: LocaleKeys.search,
      hintStyle: const TextStyle().setHintColor.s13.medium,
      fillColor: AppColors.black,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r5),
        borderSide: const BorderSide(color: AppColors.softBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r5),
        borderSide: const BorderSide(color: AppColors.softBlue),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r5),
        borderSide: const BorderSide(color: AppColors.softBlue),
      ),
      suffixIcon: AppAssets.icons.search
          .image(height: AppSize.sH14)
          .paddingAll(AppPadding.pH14),
    ),
  );
}

DropDownDecoratorProps dropDecoration(
  Widget? prefixIcon,
  String? hint,
  Color? fillColor,
  EdgeInsetsGeometry? contentPadding,
) {
  return DropDownDecoratorProps(
    baseStyle: const TextStyle().setBlackColor.s12.medium.ellipsis,
    dropdownSearchDecoration: InputDecoration(
      prefixIcon: prefixIcon,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: AppPadding.pW10,
            vertical: AppPadding.pH12,
          ),
      hintText: hint ?? 'Select an option', // Default hint if null
      hintStyle: const TextStyle().setHintColor.s13.regular,
      fillColor: fillColor ?? AppColors.white,
      filled: true, // Enable the fill color
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r8),
        borderSide: const BorderSide(color: AppColors.border), // Visible border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r8),
        borderSide: const BorderSide(color: AppColors.border), // Visible border
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppCircular.r8),
        borderSide: const BorderSide(color: AppColors.border), // Visible border
      ),
    ),
  );
}
