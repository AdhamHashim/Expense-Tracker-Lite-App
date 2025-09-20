part of '../imports/view_imports.dart';

class _CategoriesSectionWidget extends StatefulWidget {
  final AddExpensesParams params;
  const _CategoriesSectionWidget(this.params);

  @override
  State<_CategoriesSectionWidget> createState() =>
      _CategoriesSectionWidgetState();
}

class _CategoriesSectionWidgetState extends State<_CategoriesSectionWidget> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CategoryBloc>();
    bloc.add(FetchCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppMargin.mH10,
            children: [
              Text(
                LocaleKeys.categories,
                style: const TextStyle().setBlackColor.s16.semiBold,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: widget.params.categoryNotifier,
                  builder: (context, value, child) {
                    return Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.start,
                      runSpacing: AppMargin.mH14,
                      spacing: AppMargin.mH14,
                      children: [
                        ...state.categories.map(
                          (e) => CategoryElementWidget(
                            categoryEntity: e,
                            selected: value != null ? value.id == e.id : false,
                            onTap: () =>
                                widget.params.categoryNotifier.value = e,
                          ),
                        ),
                        _AddCategoryElementWidget(widget.params),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CategoryElementWidget extends StatefulWidget {
  final CategoryEntity categoryEntity;
  final bool selected;
  final bool shoWTitle;
  final void Function()? onTap;
  const CategoryElementWidget({
    super.key,
    required this.categoryEntity,
    this.selected = false,
    this.shoWTitle = true,
    this.onTap,
  });

  @override
  State<CategoryElementWidget> createState() => _CategoryElementWidgetState();
}

class _CategoryElementWidgetState extends State<CategoryElementWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: AppMargin.mH4,
        children: [
          Container(
            width: AppSize.sH55,
            height: AppSize.sH55,
            padding: EdgeInsets.all(AppPadding.pH8),
            decoration: BoxDecoration(
              border: widget.selected
                  ? Border.all(color: AppColors.main, width: 2)
                  : null,
              shape: BoxShape.circle,
              color: AppColors.softBlue.withAlpha(60),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppCircular.infinity),
              child: Image.file(
                File(widget.categoryEntity.icon),
                fit: BoxFit.cover,
                width: AppSize.sH30,
                height: AppSize.sH30,
              ),
            ),
          ),
          Offstage(
            offstage: !widget.shoWTitle,
            child: SizedBox(
              width: AppSize.sH55,
              child: Text(
                widget.categoryEntity.title,
                textAlign: TextAlign.center,
                style: const TextStyle().setBlackColor.s12.medium.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCategoryElementWidget extends StatefulWidget {
  final AddExpensesParams params;
  const _AddCategoryElementWidget(this.params);

  @override
  State<_AddCategoryElementWidget> createState() =>
      _AddCategoryElementWidgetState();
}

class _AddCategoryElementWidgetState extends State<_AddCategoryElementWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CategoryBloc>();
    return GestureDetector(
      onTap: () => addCategoryModelSheet(bloc, widget.params),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: AppMargin.mH4,
        children: [
          Container(
            width: AppSize.sH45,
            height: AppSize.sH45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.main,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: AppSize.sH25,
                color: AppColors.main,
              ),
            ),
          ),
          Text(
            LocaleKeys.addCategory,
            style: const TextStyle().setBlackColor.s12.medium,
          ),
        ],
      ),
    );
  }
}
