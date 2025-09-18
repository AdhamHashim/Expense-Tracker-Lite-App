part of '../imports/view_imports.dart';

class _ViewAllExpnsesBody extends StatelessWidget {
  const _ViewAllExpnsesBody();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.pH12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ExpensesCardWidget();
      },
    );
  }
}
