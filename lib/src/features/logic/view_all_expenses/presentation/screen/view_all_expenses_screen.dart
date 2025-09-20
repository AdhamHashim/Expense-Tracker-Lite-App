part of '../imports/view_imports.dart';

class ViewAllExpensesScreen extends StatefulWidget {
  const ViewAllExpensesScreen({super.key});

  @override
  State<ViewAllExpensesScreen> createState() => _ViewAllExpensesScreenState();
}

class _ViewAllExpensesScreenState extends State<ViewAllExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BalanceBloc>(
      create: (context) => BalanceBloc()
        ..add(
          FetchBalanceEvent(
            page: 0,
            pageSize: ConstantManager.paginationPageSize,
          ),
        ),
      child: const _ViewAllExpnsesBody(),
    );
  }
}
