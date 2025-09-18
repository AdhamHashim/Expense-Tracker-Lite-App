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
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.pH12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ExpensesCardWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
