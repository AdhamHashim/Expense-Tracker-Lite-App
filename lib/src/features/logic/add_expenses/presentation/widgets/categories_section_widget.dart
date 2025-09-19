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
        return SizedBox(
          height: state.categories.isNotEmpty
              ? state.categories.length > 10
                  ? state.categories.length * AppSize.sH35
                  : state.categories.length * AppSize.sH50
              : AppSize.sH50,
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
                          (e) => _CategoryElementWidget(
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

class _CategoryElementWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;
  final bool selected;
  final void Function()? onTap;
  const _CategoryElementWidget({
    required this.categoryEntity,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              border:
                  selected ? Border.all(color: AppColors.main, width: 2) : null,
              shape: BoxShape.circle,
              color: AppColors.softBlue.withAlpha(60),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppCircular.infinity),
              child: Image.asset(
                categoryEntity.icon,
                fit: BoxFit.cover,
                width: AppSize.sH30,
                height: AppSize.sH30,
              ),
            ),
          ),
          SizedBox(
            width: AppSize.sH55,
            child: Text(
              categoryEntity.title,
              textAlign: TextAlign.center,
              style: const TextStyle().setBlackColor.s12.medium.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCategoryElementWidget extends StatelessWidget {
  final AddExpensesParams params;
  const _AddCategoryElementWidget(this.params);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CategoryBloc>();
    return GestureDetector(
      onTap: () => addCategoryModelSheet(bloc, params),
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
