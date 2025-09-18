part of '../imports/view_imports.dart';

class _AddExpensesBody extends StatelessWidget {
  const _AddExpensesBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(AppPadding.pH12),
            children: [
              const _AddExpensesFormWidget(),
              const _CategoriesSectionWidget(),
            ].joinWith(AppSize.sH20.szH),
          ),
        ),
        LoadingButton(
          title: LocaleKeys.save,
          margin: EdgeInsets.symmetric(
            vertical: AppMargin.mH6,
            horizontal: AppMargin.mW12,
          ),
          onTap: () {},
          btnKey: GlobalKey<CustomButtonState>(),
        ),
      ],
    );
  }
}
