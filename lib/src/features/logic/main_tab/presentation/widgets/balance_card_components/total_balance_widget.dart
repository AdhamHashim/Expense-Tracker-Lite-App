part of '../../imports/view_imports.dart';

class _TotalBalanceWidget extends StatefulWidget {
  final String totalBalance;
  const _TotalBalanceWidget(this.totalBalance);

  @override
  State<_TotalBalanceWidget> createState() => _TotalBalanceWidgetState();
}

class _TotalBalanceWidgetState extends State<_TotalBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppMargin.mH10,
      children: [
        _BalanceWidget(widget.totalBalance),
        AppAssets.icons.more.image(
          width: AppSize.sW20,
          height: AppSize.sH20,
          color: AppColors.white,
        ),
      ],
    );
  }
}

class _BalanceWidget extends StatefulWidget {
  final String totalBalance;
  const _BalanceWidget(this.totalBalance);

  @override
  State<_BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<_BalanceWidget> {
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
              widget.totalBalance,
              style: const TextStyle().setWhiteColor.s22.bold,
            ),
          ],
        ),
      ],
    );
  }
}
