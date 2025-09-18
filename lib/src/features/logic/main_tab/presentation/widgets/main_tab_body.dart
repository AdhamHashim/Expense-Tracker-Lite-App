part of '../imports/view_imports.dart';

class _MainTabBody extends StatelessWidget {
  const _MainTabBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppMargin.mH20,
      children: const [
        _HeaderWidget(),
        _ExpensesElementsWidget(),
      ],
    );
  }
}
