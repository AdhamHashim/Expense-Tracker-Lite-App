part of '../../imports/view_imports.dart';

class ExpensesCardWidget extends StatefulWidget {
  final ExpensesEntity expense;
  const ExpensesCardWidget(this.expense, {super.key});

  @override
  State<ExpensesCardWidget> createState() => _ExpensesCardWidgetState();
}

class _ExpensesCardWidgetState extends State<ExpensesCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: context.width,
        margin: EdgeInsets.symmetric(vertical: AppMargin.mH4),
        padding: EdgeInsets.all(AppPadding.pH8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppCircular.r10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.0),
              offset: const Offset(-2, 0),
              blurRadius: 30,
              spreadRadius: -6,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(2, 0),
              blurRadius: 30,
              spreadRadius: -6,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(0, 2),
              blurRadius: 35,
              spreadRadius: -7,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: AppMargin.mW8,
                children: [
                  CategoryElementWidget(
                    categoryEntity: widget.expense.category,
                    shoWTitle: false,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppMargin.mH2,
                    children: [
                      Text(
                        widget.expense.category.title,
                        style: const TextStyle().setBlackColor.s16.semiBold,
                      ),
                      Text(
                        LocaleKeys.manally,
                        style: const TextStyle().setGreyColor.s13.medium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: AppMargin.mH2,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "-",
                        style: const TextStyle().setBlackColor.s16.semiBold,
                      ),
                      AppAssets.icons.dollar.image(
                        width: AppSize.sW12,
                        height: AppSize.sH12,
                      ),
                      Flexible(
                        child: Text(
                          "${widget.expense.amountAfterConvertToDollar}",
                          style: const TextStyle()
                              .setBlackColor
                              .s16
                              .semiBold
                              .ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.expense.dateAgo,
                    style: const TextStyle().setBlackColor.s12.medium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
