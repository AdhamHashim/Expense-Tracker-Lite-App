part of '../../imports/view_imports.dart';

class _ViewAllExpensesWidget extends StatelessWidget {
  const _ViewAllExpensesWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.recentExpenses,
          style: const TextStyle().setBlackColor.s18.semiBold,
        ),
        GestureDetector(
          onTap: () => Go.to(const ViewAllExpensesScren()),
          child: Text(
            LocaleKeys.seeAll,
            style: const TextStyle().setBlackColor.s14.medium,
          ),
        ),
      ],
    ).marginSymmetric(
      vertical: AppMargin.mH2,
      horizontal: AppMargin.mW14,
    );
  }
}
