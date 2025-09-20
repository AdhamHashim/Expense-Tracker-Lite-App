part of '../../imports/view_imports.dart';

class _BalanceCarWidget extends StatelessWidget {
  const _BalanceCarWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        _CardWithCircleBGWidget(
          width: context.width * .9,
          height: context.height * .25,
          bgColor: AppColors.mediumBlue,
          borderRadius: BorderRadius.circular(AppCircular.r15),
        ),
        BlocSelector<BalanceBloc, BalanceState, BalanceEntity>(
          selector: (state) => state.balanceEntity,
          builder: (context, state) {
            return SizedBox(
              height: context.height * .2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.pW30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _TotalBalanceWidget("${state.totalBalance}"),
                    _IncomeWithExpensesWidget(
                      income: "${state.incomeBalance}",
                      expenses: "${state.expensesBalance}",
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
