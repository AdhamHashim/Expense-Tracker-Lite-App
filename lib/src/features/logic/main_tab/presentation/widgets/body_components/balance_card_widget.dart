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
        SizedBox(
          height: context.height * .2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.pW30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _TotalBalanceWidget("10,0000"),
                _IncomeWithExpensesWidget(
                  income: "2,000",
                  expenses: "8,000",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
