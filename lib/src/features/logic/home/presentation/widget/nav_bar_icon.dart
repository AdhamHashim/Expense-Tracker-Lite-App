part of '../imports/presentation_imports.dart';

class NavBaricon extends StatelessWidget {
  final String iconPath;
  final bool selected;
  const NavBaricon({
    super.key,
    required this.iconPath,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      height: AppSize.sW25,
      color: selected ? AppColors.main : AppColors.hintText,
    );
  }
}
