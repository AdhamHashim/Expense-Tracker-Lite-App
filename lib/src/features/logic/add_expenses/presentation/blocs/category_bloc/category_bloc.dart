part of '../../imports/view_imports.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState.initial()) {
    on<FetchCategoryEvent>((event, emit) => getCategoriesForDropdown(emit));
    on<AddCategoryEvent>((event, emit) => addcategory(event, emit));
  }

  Future<List<CategoryEntity?>> getCategoriesForDropdown(
    Emitter<CategoryState> emit,
  ) async {
    final data = await HiveBoxesConstant.getCategories();
    emit(state.copyWith(categories: data));
    return state.categories;
  }

  Future<void> addcategory(
    AddCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    if (!event.params.validateForm()) return;
    event.params.btnKey.currentState!.animateForward();
    final categoryEntitiy = event.params.toModel();
    await HiveBoxesConstant.putCategories(categoryEntitiy);
    final updatedCategories = await HiveBoxesConstant.getCategories();
    emit(state.copyWith(categories: List.from(updatedCategories)));
    event.params.btnKey.currentState!.animateReverse();
    event.expensesParams.categoryNotifier.value = categoryEntitiy;

    MessageUtils.showSnackBar(LocaleKeys.addCategorySuccefully);
    Go.back();
  }
}
