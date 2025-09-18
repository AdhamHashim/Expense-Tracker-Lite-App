part of '../imports/view_imports.dart';

class _AddExpensesFormWidget extends StatelessWidget {
  const _AddExpensesFormWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppMargin.mH10,
      children: [
        DefaultDropDownField<DropDownModel>(
          label: LocaleKeys.categories,
          hint: "${LocaleKeys.select} ${LocaleKeys.categories}",
          borderRadius: BorderRadius.circular(AppCircular.r15),
          fillColor: AppColors.fill,
          validator: (value) => Validators.validateDropDown(
            value,
            fieldTitle: LocaleKeys.categories,
          ),
          selectedItem: null,
          asyncItems: (value) async => [
            DropDownModel(id: 1, name: "name"),
            DropDownModel(id: 1, name: "name"),
          ],
          itemAsString: (value) => value!.name,
        ),
        CustomTextFiled(
          hint: "${LocaleKeys.enter} ${LocaleKeys.amount}",
          title: LocaleKeys.amount,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: (value) => Validators.validateEmpty(
            value,
            fieldTitle: LocaleKeys.amount,
          ),
          controller: TextEditingController(),
        ),
        CustomTextFiled(
          hint: "${LocaleKeys.enter} ${LocaleKeys.date}",
          title: LocaleKeys.date,
          textInputType: TextInputType.datetime,
          textInputAction: TextInputAction.none,
          onTap: () {},
          suffixIcon: AppAssets.icons.calendar
              .image(width: AppSize.sH12)
              .paddingAll(AppPadding.pH10),
          validator: (value) => Validators.validateEmpty(
            value,
            fieldTitle: LocaleKeys.date,
          ),
          controller: TextEditingController(),
        ),
        CustomTextFiled(
          hint: "${LocaleKeys.enter} ${LocaleKeys.uploadImage}",
          title: LocaleKeys.uploadImage,
          textInputType: TextInputType.datetime,
          textInputAction: TextInputAction.none,
          onTap: () {},
          suffixIcon: AppAssets.icons.camera
              .image(width: AppSize.sH12)
              .paddingAll(AppPadding.pH10),
          validator: (value) => Validators.validateEmpty(
            value,
            fieldTitle: LocaleKeys.uploadImage,
          ),
          controller: TextEditingController(),
        ),
        DefaultDropDownField<DropDownModel>(
          label: LocaleKeys.currency,
          hint: "${LocaleKeys.select} ${LocaleKeys.currency}",
          borderRadius: BorderRadius.circular(AppCircular.r15),
          fillColor: AppColors.fill,
          validator: (value) => Validators.validateDropDown(
            value,
            fieldTitle: LocaleKeys.currency,
          ),
          selectedItem: null,
          asyncItems: (value) async => [
            DropDownModel(id: 1, name: "dollar"),
            DropDownModel(id: 2, name: "Sar"),
          ],
          itemAsString: (value) => value!.name,
        ),
      ],
    );
  }
}
