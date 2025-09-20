part of '../imports/view_imports.dart';

class _AddExpensesFormWidget extends StatefulWidget {
  final AddExpensesParams params;
  const _AddExpensesFormWidget(this.params);

  @override
  State<_AddExpensesFormWidget> createState() => _AddExpensesFormWidgetState();
}

class _AddExpensesFormWidgetState extends State<_AddExpensesFormWidget> {


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.params.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH10,
        children: [
          _CategoryDropDown(widget.params),
          _CurrencyDropDown(widget.params),
          CustomTextField(
            controller: widget.params.amountController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hint: "${LocaleKeys.enter} ${LocaleKeys.amount}",
            title: LocaleKeys.amount,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.amount,
            ),
          ),
          CustomTextField(
            controller: widget.params.dateController,
            hint: "${LocaleKeys.enter} ${LocaleKeys.date}",
            title: LocaleKeys.date,
            textInputType: TextInputType.datetime,
            textInputAction: TextInputAction.none,
            onTap: () => widget.params.selectDate(),
            suffixIcon: AppAssets.icons.calendar
                .image(width: AppSize.sH12)
                .paddingAll(AppPadding.pH10),
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.date,
            ),
          ),
          CustomTextField(
            controller: widget.params.imageController,
            hint: LocaleKeys.uploadImage,
            title: LocaleKeys.uploadImage,
            textInputType: TextInputType.none,
            textInputAction: TextInputAction.none,
            onTap: () => widget.params.uploadImage(),
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

class _CurrencyDropDown extends StatefulWidget {
  final AddExpensesParams params;
  const _CurrencyDropDown(this.params);

  @override
  State<_CurrencyDropDown> createState() => _CurrencyDropDownState();
}

class _CurrencyDropDownState extends State<_CurrencyDropDown> {
  @override
  void initState() {
    final bloc = context.read<CurrencyBloc>();
    bloc.add(FetchCurrencyEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CurrencyBloc, CurrencyState, List<CurrencyEntity>>(
      selector: (state) => state.currencies,
      builder: (context, state) {
        return DefaultDropDownField<CurrencyEntity>(
          label: LocaleKeys.currency,
          hint: "${LocaleKeys.select} ${LocaleKeys.currency}",
          borderRadius: BorderRadius.circular(AppCircular.r15),
          itemAsString: (value) => value!.currencyTitle,
          fillColor: AppColors.fill,
          selectedItem: widget.params.currency,
          onChanged: (value) => widget.params.currency = value,
          asyncItems: (searchValue) async => state,
          validator: (value) => Validators.validateDropDown(
            value,
            fieldTitle: LocaleKeys.currency,
          ),
        );
      },
    );
  }
}

class _CategoryDropDown extends StatefulWidget {
  final AddExpensesParams params;
  const _CategoryDropDown(this.params);

  @override
  State<_CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<_CategoryDropDown> {
  @override
  void initState() {
    final bloc = context.read<CategoryBloc>();
    bloc.add(FetchCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryBloc, CategoryState, List<CategoryEntity>>(
      selector: (state) => state.categories,
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: widget.params.categoryNotifier,
          builder: (context, value, child) {
            return DefaultDropDownField<CategoryEntity>(
              label: LocaleKeys.categories,
              hint: "${LocaleKeys.select} ${LocaleKeys.categories}",
              borderRadius: BorderRadius.circular(AppCircular.r15),
              fillColor: AppColors.fill,
              selectedItem: value,
              onChanged: (value) => widget.params.updateCategory(value),
              asyncItems: (searchValue) async => state,
              itemAsString: (value) => value!.title,
              validator: (value) => Validators.validateDropDown(
                value,
                fieldTitle: LocaleKeys.categories,
              ),
            );
          },
        );
      },
    );
  }
}
