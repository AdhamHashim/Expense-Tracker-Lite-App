part of '../../imports/view_imports.dart';

class _ExpensesElementsWidget extends StatefulWidget {
  const _ExpensesElementsWidget();

  @override
  State<_ExpensesElementsWidget> createState() =>
      _ExpensesElementsWidgetState();
}

class _ExpensesElementsWidgetState extends State<_ExpensesElementsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH2,
        children: [
          const _ViewAllExpensesWidget(),
          BlocBuilder<BalanceBloc, BalanceState>(
            builder: (context, state) {
              if (state.baseStatus == BaseStatus.loading && state.page == 0) {
                return const Flexible(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }
              return Flexible(
                child: Visibility(
                  visible: state.balanceEntity.expenses.isNotEmpty,
                  replacement: const NotContainData(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.pH12),
                    itemCount: state.balanceEntity.expenses.length > 3
                        ? 3
                        : state.balanceEntity.expenses.length,
                    itemBuilder: (context, index) {
                      return ExpensesCardWidget(
                        state.balanceEntity.expenses[index],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
