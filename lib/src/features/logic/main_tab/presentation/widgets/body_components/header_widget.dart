part of '../../imports/view_imports.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        const _CardWithCircleBGWidget(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: AppMargin.mH10,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _UserInfoWidget(),
                _CurrencyDropDownWidget(),
              ],
            ).marginOnly(
              top: context.height * .08,
              right: AppMargin.mW8,
              left: AppMargin.mW8,
            ),
            const _BalanceCarWidget(),
          ],
        ),
      ],
    );
  }
}
