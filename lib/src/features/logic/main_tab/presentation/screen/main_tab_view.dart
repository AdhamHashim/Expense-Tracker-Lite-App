part of '../imports/view_imports.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
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
    return BlocProvider(
      create: (context) => BalanceBloc()..add(FetchBalanceEvent(
        page: 0,
        pageSize: ConstantManager.paginationPageSize,
      )),
      child: const _MainTabBody(),
    );
  }
}
