part of '../imports/view_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start from right edge
      end: const Offset(0.0, 0.0), // End at center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(LoadSplashEvent());
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SlideTransition(
          position: _logoAnimation,
          child: AppAssets.icons.logoColored
              .svg(color: AppColors.main)
              .paddingAll(context.width * .09),
        ),
      ),
    );
  }
}
