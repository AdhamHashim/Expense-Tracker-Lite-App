part of '../imports/view_imports.dart';

class _AddExpensesFormWidget extends StatelessWidget {
  final AddExpensesParams params;
  const _AddExpensesFormWidget(this.params);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: params.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH10,
        children: [
          _CategoryDropDown(params),
          _CurrencyDropDown(params),
          CustomTextFiled(
            controller: params.amountController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            hint: "${LocaleKeys.enter} ${LocaleKeys.amount}",
            title: LocaleKeys.amount,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.amount,
            ),
          ),
          CustomTextFiled(
            controller: params.dateController,
            hint: "${LocaleKeys.enter} ${LocaleKeys.date}",
            title: LocaleKeys.date,
            textInputType: TextInputType.datetime,
            textInputAction: TextInputAction.none,
            onTap: () => params.selectDate(),
            suffixIcon: AppAssets.icons.calendar
                .image(width: AppSize.sH12)
                .paddingAll(AppPadding.pH10),
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.date,
            ),
          ),
          CustomTextFiled(
            controller: params.imageController,
            hint: LocaleKeys.uploadImage,
            title: LocaleKeys.uploadImage,
            textInputType: TextInputType.none,
            textInputAction: TextInputAction.none,
            onTap: () => params.uploadImage(),
            suffixIcon: AppAssets.icons.camera
                .image(width: AppSize.sH12)
                .paddingAll(AppPadding.pH10),
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.uploadImage,
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyDropDown extends StatelessWidget {
  final AddExpensesParams params;
  const _CurrencyDropDown(this.params);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrencyBloc>()..add(FetchCurrencyEvent());
    return DefaultDropDownField<CurrencyEntity>(
      label: LocaleKeys.currency,
      hint: "${LocaleKeys.select} ${LocaleKeys.currency}",
      borderRadius: BorderRadius.circular(AppCircular.r15),
      fillColor: AppColors.fill,
      validator: (value) => Validators.validateDropDown(
        value,
        fieldTitle: LocaleKeys.currency,
      ),
      selectedItem: params.currency,
      onChanged: (value) => params.currency = value,
      asyncItems: (searchValue) async {
        final currencies = bloc.state.currencies;
        return currencies;
      },
      itemAsString: (value) => value!.currencyTitle,
    );
  }
}

class _CategoryDropDown extends StatelessWidget {
  final AddExpensesParams params;
  const _CategoryDropDown(this.params);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final bloc = context.read<CategoryBloc>()..add(FetchCategoryEvent());
        return BlocSelector<CategoryBloc, CategoryState, List<CategoryEntity>>(
          bloc: bloc,
          selector: (state) => state.categories,
          builder: (context, state) {
            return DefaultDropDownField<CategoryEntity>(
              label: LocaleKeys.categories,
              hint: "${LocaleKeys.select} ${LocaleKeys.categories}",
              borderRadius: BorderRadius.circular(AppCircular.r15),
              fillColor: AppColors.fill,
              validator: (value) => Validators.validateDropDown(
                value,
                fieldTitle: LocaleKeys.categories,
              ),
              selectedItem: params.categoryNotifier.value,
              onChanged: (value) => params.categoryNotifier.value = value,
              asyncItems: (searchValue) async => state,
              itemAsString: (value) => value!.title,
            );
          },
        );
      },
    );
  }
}
