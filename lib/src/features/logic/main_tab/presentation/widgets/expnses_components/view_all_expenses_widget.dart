part of '../../imports/view_imports.dart';

class _ViewAllExpensesWidget extends StatefulWidget {
  const _ViewAllExpensesWidget();

  @override
  State<_ViewAllExpensesWidget> createState() => _ViewAllExpensesWidgetState();
}

class _ViewAllExpensesWidgetState extends State<_ViewAllExpensesWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<BalanceBloc>();
      bloc.add(FetchBalanceEvent(
        page: 0,
        pageSize: ConstantManager.paginationPageSize,
      ));
    });
  }

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
          onTap: () => Go.to(
            BlocProvider.value(
              value: context.read<BalanceBloc>(),
              child: const ViewAllExpensesScreen(),
            ),
          ),
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
