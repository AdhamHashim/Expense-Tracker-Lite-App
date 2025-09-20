part of '../imports/view_imports.dart';

class _MainTabBody extends StatefulWidget {
  const _MainTabBody();

  @override
  State<_MainTabBody> createState() => _MainTabBodyState();
}

class _MainTabBodyState extends State<_MainTabBody> {
  @override
  void initState() {
    final bloc = context.read<BalanceBloc>();
    bloc.add(FetchBalanceEvent(
      page: 0,
      pageSize: ConstantManager.paginationPageSize,
    ));
    super.initState();
  }

  @override
  void didUpdateWidget(_MainTabBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Refresh data when widget is updated
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
    return BlocListener<BalanceBloc, BalanceState>(
      listener: (context, state) {
        // This will be triggered when data is refreshed
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppMargin.mH20,
        children: const [
          _HeaderWidget(),
          _ExpensesElementsWidget(),
        ],
      ),
    );
  }
}
