part of '../../imports/view_imports.dart';

class _UserInfoWidget extends StatefulWidget {
  const _UserInfoWidget();

  @override
  State<_UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<_UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mW10,
        children: [
          AppAssets.icons.boy.image(
            width: AppSize.sW50,
            height: AppSize.sH50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: AppMargin.mH2,
            children: [
              Text(
                LocaleKeys.goodMorning,
                style: const TextStyle().setWhiteColor.s13.regular,
              ),
              Text(
                LocaleKeys.myName,
                style: const TextStyle().setWhiteColor.s15.semiBold,
              )
            ],
          ),
        ],
      ),
    );
  }
}
