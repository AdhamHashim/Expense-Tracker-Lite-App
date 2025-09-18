import 'package:flutter/material.dart';
import '../../../../config/res/assets.gen.dart';
import '../../../../core/navigation/navigator.dart';
import '../../add_expenses/presentation/imports/view_imports.dart';
import '../presentation/imports/presentation_imports.dart';

class NavBarItem {
  final Widget image;
  final int tabId;

  const NavBarItem({
    required this.tabId,
    required this.image,
  });
}

class NavBarDataModel {
  final ValueNotifier<int> selectedHomeTab = ValueNotifier<int>(0);

  void updatCurrentTab(int newValue) {
    selectedHomeTab.value = newValue;
    navBarItemsFunc();

    if (newValue == 2) {
      Go.to(const AddExpensesScreen());
    }
  }

  void dispose() {
    selectedHomeTab.dispose();
  }

  List<NavBarItem> navBarItemsFunc() => [
        NavBarItem(
          tabId: 0,
          image: NavBaricon(
            iconPath: AppAssets.icons.home.path,
            selected: selectedHomeTab.value == 0,
          ),
        ),
        NavBarItem(
          tabId: 1,
          image: NavBaricon(
            iconPath: AppAssets.icons.graphic.path,
            selected: selectedHomeTab.value == 1,
          ),
        ),
        const NavBarItem(
          tabId: 2,
          image: AddiconWidget(),
        ),
        NavBarItem(
          tabId: 3,
          image: NavBaricon(
            iconPath: AppAssets.icons.wallet.path,
            selected: selectedHomeTab.value == 3,
          ),
        ),
        NavBarItem(
          tabId: 4,
          image: NavBaricon(
            iconPath: AppAssets.icons.user.path,
            selected: selectedHomeTab.value == 4,
          ),
        ),
      ];
}
