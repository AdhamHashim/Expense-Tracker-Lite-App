part of '../../imports/view_imports.dart';

class _IncomeWithExpensesWidget extends StatelessWidget {
  final String income, expenses;
  const _IncomeWithExpensesWidget({
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppMargin.mH10,
      children: [
        _IncomeBalanceWidget(income),
        _ExpensesBalanceWidget(expenses),
      ],
    );
  }
}

class _IncomeBalanceWidget extends StatelessWidget {
  final String incomeBalance;
  const _IncomeBalanceWidget(this.incomeBalance);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: AppMargin.mH4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppMargin.mW6,
            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.pW4),
                decoration: const BoxDecoration(
                  color: AppColors.softBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_upward,
                    size: AppSize.sH14,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                LocaleKeys.income,
                style: const TextStyle().setWhiteColor.s14.medium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppMargin.mW6,
            children: [
              AppAssets.icons.dollar.image(
                width: AppSize.sW25,
                height: AppSize.sH25,
                color: AppColors.white,
              ),
              Flexible(
                child: Text(
                  incomeBalance,
                  style: const TextStyle().setWhiteColor.s22.bold.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExpensesBalanceWidget extends StatelessWidget {
  final String expensesBalance;
  const _ExpensesBalanceWidget(this.expensesBalance);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: AppMargin.mH4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppMargin.mW6,
            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.pW4),
                decoration: const BoxDecoration(
                  color: AppColors.softBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_downward,
                    size: AppSize.sH14,
                    color: AppColors.white,
                  ),
                ),
              ),
              Text(
                LocaleKeys.expenses,
                style: const TextStyle().setWhiteColor.s14.medium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppMargin.mW6,
            children: [
              AppAssets.icons.dollar.image(
                width: AppSize.sW25,
                height: AppSize.sH25,
                color: AppColors.white,
              ),
              Flexible(
                child: Text(
                  expensesBalance,
                  style: const TextStyle().setWhiteColor.s22.bold.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
