part of '../../imports/view_imports.dart';

class _TotalBalanceWidget extends StatelessWidget {
  final String totalBalance;
  const _TotalBalanceWidget(this.totalBalance);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppMargin.mH10,
      children: [
        _BalanceWidget(totalBalance),
        AppAssets.icons.more.image(
          width: AppSize.sW20,
          height: AppSize.sH20,
          color: AppColors.white,
        ),
      ],
    );
  }
}

class _BalanceWidget extends StatelessWidget {
  final String totalBalance;
  const _BalanceWidget(this.totalBalance);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: AppMargin.mH4,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppMargin.mW6,
          children: [
            Text(
              LocaleKeys.totalBalance,
              style: const TextStyle().setWhiteColor.s14.medium,
            ),
            AppAssets.icons.upload.image(
              width: AppSize.sW12,
              height: AppSize.sH10,
              color: AppColors.white,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppMargin.mW6,
          children: [
            AppAssets.icons.dollar.image(
              width: AppSize.sW25,
              height: AppSize.sH25,
              color: AppColors.white,
            ),
            Text(
              totalBalance,
              style: const TextStyle().setWhiteColor.s22.bold,
            ),
          ],
        ),
      ],
    );
  }
}
