part of '../../imports/view_imports.dart';

Future<dynamic> addCategoryModelSheet(
  CategoryBloc categoryBloc,
  AddExpensesParams params,
) {
  return showDefaultBottomSheet(
    child: BlocProvider.value(
      value: categoryBloc,
      child: AddCategoryModelSheetBody(params),
    ),
  );
}

class AddCategoryModelSheetBody extends StatefulWidget {
  final AddExpensesParams expensesParams;
  const AddCategoryModelSheetBody(this.expensesParams, {super.key});

  @override
  State<AddCategoryModelSheetBody> createState() =>
      _AddCategoryModelSheetBodyState();
}

class _AddCategoryModelSheetBodyState extends State<AddCategoryModelSheetBody> {
  final AddCategoryParams params = AddCategoryParams();

  @override
  void dispose() {
    params.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CategoryBloc>();
    return Form(
      key: params.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH10,
        children: [
          CustomTextFiled(
            controller: params.titleController,
            hint: "${LocaleKeys.enter} ${LocaleKeys.title}",
            title: LocaleKeys.title,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.title,
            ),
          ),
          CustomTextFiled(
            controller: params.imageController,
            hint: LocaleKeys.uploadImage,
            title: LocaleKeys.uploadImage,
            textInputType: TextInputType.none,
            textInputAction: TextInputAction.none,
            onTap: () => params.uploadImage(),
            suffixIcon: AppAssets.icons.camera
                .image(width: AppSize.sH12)
                .paddingAll(AppPadding.pH10),
            validator: (value) => Validators.validateEmpty(
              value,
              fieldTitle: LocaleKeys.uploadImage,
            ),
          ),
          LoadingButton(
            title: LocaleKeys.save,
            btnKey: params.btnKey,
            onTap: () async =>
                bloc.add(AddCategoryEvent(params, widget.expensesParams)),
          ),
        ],
      ),
    );
  }
}
