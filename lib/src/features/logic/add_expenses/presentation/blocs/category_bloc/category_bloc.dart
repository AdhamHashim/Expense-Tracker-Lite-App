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
    await HiveBoxesConstant.putCategories(event.params.toModel());
    event.expensesParams.categoryNotifier.value = event.params.toModel();
    final updatedCategories = await HiveBoxesConstant.getCategories();
    emit(state.copyWith(categories: List.from(updatedCategories)));
    event.params.btnKey.currentState!.animateReverse();
    MessageUtils.showSnackBar(LocaleKeys.addexpensesSuccefully);
    Go.back();
  }
}
