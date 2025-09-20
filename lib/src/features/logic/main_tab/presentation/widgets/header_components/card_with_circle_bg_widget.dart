part of '../../imports/view_imports.dart';

class _CardWithCircleBGWidget extends StatelessWidget {
  final double? width, height;
  final Color? bgColor;
  final BorderRadiusGeometry? borderRadius;
  const _CardWithCircleBGWidget({
    this.width,
    this.height,
    this.bgColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width,
      height: height ?? context.height * .36,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.main,
        borderRadius: borderRadius ??
            BorderRadius.only(
              bottomLeft: Radius.circular(AppCircular.r10),
              bottomRight: Radius.circular(AppCircular.r10),
            ),
      ),
      child: AppAssets.icons.circle.image(
        width: context.width * .7,
        height: context.height * .3,
        fit: BoxFit.cover,
        color: AppColors.white.withAlpha(20),
      ),
    );
  }
}
