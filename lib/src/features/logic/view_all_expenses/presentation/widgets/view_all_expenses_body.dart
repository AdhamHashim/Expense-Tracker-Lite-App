part of '../imports/view_imports.dart';

class _ViewAllExpnsesBody extends StatelessWidget {
  const _ViewAllExpnsesBody();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: LocaleKeys.allExpenses,
      body: BlocBuilder<BalanceBloc, BalanceState>(
        builder: (context, state) {
          if (state.baseStatus == BaseStatus.loading && state.page == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.balanceEntity.expenses.isEmpty) {
            return const NotContainData();
          }
          return Visibility(
            visible: state.balanceEntity.expenses.isNotEmpty,
            replacement: const NotContainData(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  final bloc = context.read<BalanceBloc>();
                  bloc.add(
                    FetchBalanceEvent(
                      filter: bloc.state.filter != null
                          ? bloc.state.filter!
                          : DropDownModel.initial(),
                      page: bloc.state.page + 1,
                      pageSize: 5,
                    ),
                  );
                }
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: AppPadding.pH12),
                itemCount: state.balanceEntity.expenses.length,
                itemBuilder: (context, index) {
                  if (index < state.balanceEntity.expenses.length) {
                    return ExpensesCardWidget(
                      state.balanceEntity.expenses[index],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator())
                        .paddingAll(AppPadding.pH10);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
