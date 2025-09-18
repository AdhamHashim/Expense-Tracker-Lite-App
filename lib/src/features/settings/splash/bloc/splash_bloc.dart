part of '../imports/view_imports.dart';

class SplashBloc extends Bloc<LoadSplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<LoadSplashEvent>(
      (event, emit) => initApp(),
    );
  }

  void initApp() async {
    Future.delayed(
      const Duration(milliseconds: ConstantManager.splashTimer),
      () async =>  Go.offAll(const HomeScreen()),
    );
  }
}
