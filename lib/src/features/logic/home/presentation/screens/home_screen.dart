part of '../imports/presentation_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavBarDataModel params = NavBarDataModel();

  @override
  void initState() {
    params.navBarItemsFunc();
    super.initState();
  }

  @override
  void dispose() {
    params.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      body: const _HomeBody(),
      bottomNavigationBar: _BottomNavigationBarWidget(params),
    );
  }
}
