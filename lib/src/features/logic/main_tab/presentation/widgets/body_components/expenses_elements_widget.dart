part of '../../imports/view_imports.dart';

class _ExpensesElementsWidget extends StatelessWidget {
  const _ExpensesElementsWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH2,
        children: [
          const _ViewAllExpensesWidget(),
          BlocSelector<BalanceBloc, BalanceState, BalanceEntity>(
            selector: (state) => state.balanceEntity,
            builder: (context, state) {
              return Flexible(
                child: Visibility(
                  visible: state.expenses.isNotEmpty,
                  replacement: const NotContainData(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.pH12),
                    itemCount:
                        state.expenses.length > 3 ? 3 : state.expenses.length,
                    itemBuilder: (context, index) {
                      return ExpensesCardWidget(state.expenses[index]);
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
