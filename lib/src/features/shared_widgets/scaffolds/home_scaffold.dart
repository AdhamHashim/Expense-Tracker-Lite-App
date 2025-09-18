part of '../imports/shared_widgets_imports.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  const HomeScaffold({
    super.key,
    required this.body,
    required this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.scaffoldBackground,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
