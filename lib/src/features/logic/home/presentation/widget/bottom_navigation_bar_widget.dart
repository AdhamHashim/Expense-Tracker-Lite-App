part of '../imports/presentation_imports.dart';

class _BottomNavigationBarWidget extends StatelessWidget {
  final NavBarDataModel params;
  const _BottomNavigationBarWidget(this.params);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: params.selectedHomeTab,
      builder: (context, int selectedValue, child) {
        final items = params.navBarItemsFunc();
        return BottomNavigationBar(
          currentIndex: selectedValue,
          backgroundColor: AppColors.white,
          onTap: (value) => params.updatCurrentTab(value),
          items: items
              .map(
                (e) => BottomNavigationBarItem(
                  label: ConstantManager.emptyText,
                  backgroundColor: AppColors.white,
                  icon: e.image,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
