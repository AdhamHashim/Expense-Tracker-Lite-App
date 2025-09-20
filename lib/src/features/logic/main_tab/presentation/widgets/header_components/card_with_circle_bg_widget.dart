part of '../../imports/view_imports.dart';

class _CardWithCircleBGWidget extends StatefulWidget {
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
  State<_CardWithCircleBGWidget> createState() =>
      _CardWithCircleBGWidgetState();
}

class _CardWithCircleBGWidgetState extends State<_CardWithCircleBGWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? context.width,
      height: widget.height ?? context.height * .36,
      decoration: BoxDecoration(
        color: widget.bgColor ?? AppColors.main,
        borderRadius: widget.borderRadius ??
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
