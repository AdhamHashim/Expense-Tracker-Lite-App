part of '../imports/view_imports.dart';

class _AddExpensesBody extends StatefulWidget {
  const _AddExpensesBody();

  @override
  State<_AddExpensesBody> createState() => _AddExpensesBodyState();
}

class _AddExpensesBodyState extends State<_AddExpensesBody> {
  final AddExpensesParams params = AddExpensesParams();

  @override
  void dispose() {
    params.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(AppPadding.pH12),
            children: [
              _AddExpensesFormWidget(params),
              _CategoriesSectionWidget(params),
            ].joinWith(AppSize.sH20.szH),
          ),
        ),
        BlocBuilder<ExpensesBloc, ExpensesState>(
          builder: (context, state) {
            return LoadingButton(
              title: LocaleKeys.save,
              btnKey: params.btnKey,
              margin: EdgeInsets.symmetric(
                vertical: AppMargin.mH6,
                horizontal: AppMargin.mW20,
              ),
              onTap: () async => context.read<ExpensesBloc>().add(AddExpensesEvent(params)),
            );
          },
        ),
      ],
    );
  }
}
