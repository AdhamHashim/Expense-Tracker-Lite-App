part of '../imports/shared_widgets_imports.dart';

class DefaultScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final void Function()? onTap;

  const DefaultScaffold({
    super.key,
    this.title,
    this.onTap,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.pH4,
                  horizontal: AppPadding.pH12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTap ?? () => Go.back(),
                      child: AppAssets.icons.back.image(
                        height: AppSize.sH16,
                        width: AppSize.sH20,
                      ),
                    ),
                    Text(
                      title ?? ConstantManager.emptyText,
                      style: const TextStyle().setBlackColor.s18.bold,
                    ),
                    SizedBox(width: AppSize.sH20),
                  ],
                ),
              ),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
