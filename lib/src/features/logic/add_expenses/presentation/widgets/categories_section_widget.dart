part of '../imports/view_imports.dart';

class _CategoriesSectionWidget extends StatelessWidget {
  const _CategoriesSectionWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .4,
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
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (categories.length / 4).round(),
                crossAxisSpacing: AppMargin.mH6,
                mainAxisSpacing: AppMargin.mH6,
                mainAxisExtent: AppSize.sH70,
                childAspectRatio: 1.5,
              ),
              children: categories,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryElementWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const _CategoryElementWidget(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            color: AppColors.softBlue.withAlpha(60),
          ),
          child: Center(
            child: Image.asset(
              categoryModel.image,
              width: AppSize.sH30,
              height: AppSize.sH30,
            ),
          ),
        ),
        Text(
          categoryModel.title,
          style: const TextStyle().setBlackColor.s12.medium,
        ),
      ],
    );
  }
}

List<Widget> categories = [
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.cart.path,
      title: "Shopping",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.refuel.path,
      title: "gas",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.paper.path,
      title: "paper",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.rent.path,
      title: "Rent",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.bag.path,
      title: "bag",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.cart.path,
      title: "Shopping",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.refuel.path,
      title: "gas",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.paper.path,
      title: "paper",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.rent.path,
      title: "Rent",
    ),
  ),
  _CategoryElementWidget(
    CategoryModel(
      id: 0,
      image: AppAssets.icons.bag.path,
      title: "bag",
    ),
  ),
];
