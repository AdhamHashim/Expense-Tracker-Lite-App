part of '../imports/view_imports.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) => BalanceBloc()..add(FetchBalanceEvent()),
    child: const _MainTabBody(),
    );
  }
}
