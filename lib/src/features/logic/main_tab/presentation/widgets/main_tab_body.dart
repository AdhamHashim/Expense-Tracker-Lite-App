part of '../imports/view_imports.dart';

class _MainTabBody extends StatefulWidget {
  const _MainTabBody();

  @override
  State<_MainTabBody> createState() => _MainTabBodyState();
}

class _MainTabBodyState extends State<_MainTabBody> {
  @override
  void initState() {
    final bloc = context.read<BalanceBloc>();
    bloc.add(FetchBalanceEvent());
    super.initState();
  }

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
