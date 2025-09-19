// part of '../imports/view_imports.dart';

// class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
//   ExpensesBloc() : super(ExpensesState.initial()) {
//     baseCrudUseCase = injector();
//     on<CurrencyEvent>((event, emit) => fetchCurrency(emit));
//     on<CategoryEvent>((event, emit) => getCategoriesForDropdown(emit));
//     on<AddCategoryEvent>((event, emit) => addcategory(event, emit));
//   }

//   late BaseCrudUseCase baseCrudUseCase;

//   Future<List<CurrencyEntity>> fetchCurrency(
//     Emitter<ExpensesState> emit,
//   ) async {
//     final result = await baseCrudUseCase.call<Map<String, dynamic>>(
//       CrudBaseParmas(
//         api: ApiConstants.currency,
//         httpRequestType: HttpRequestType.get,
//         mapper: (json) => json['rates'],
//       ),
//     );
//     result.when(
//       (cerruncy) {
//         final List<CurrencyEntity> currencies = [];
//         final keys = cerruncy.keys.toList();
//         final values = cerruncy.values.toList();
//         for (var i = 0; i < values.length; i++) {
//           final CurrencyEntity cerruncy = CurrencyEntity(
//             currencyTitle: keys[i],
//             currency: double.parse("${values[i]}"),
//           );
//           currencies.add(cerruncy);
//         }
//         emit(state.copyWith(currencies: currencies));
//       },
//       (error) {
//         emit(state.copyWith(currencies: []));
//       },
//     );
//     return state.currencies;
//   }

//   Future<List<CategoryEntity?>> getCategoriesForDropdown(
//     Emitter<ExpensesState> emit,
//   ) async {
//     final data = await HiveBoxesConstant.getCategories();
//     emit(state.copyWith(categories: data));
//     return state.categories;
//   }

//   Future<void> addcategory(
//     AddCategoryEvent event,
//     Emitter<ExpensesState> emit,
//   ) async {
//     if (!event.params.validateForm()) return;
//     event.params.btnKey.currentState!.animateForward();
//     await HiveBoxesConstant.putCategories(event.params.toModel());
//     event.expensesParams.categoryNotifier.value = event.params.toModel();
//     final updatedCategories = await HiveBoxesConstant.getCategories();
//     emit(state.copyWith(categories: List.from(updatedCategories)));
//     event.params.btnKey.currentState!.animateReverse();
//     MessageUtils.showSnackBar(LocaleKeys.addexpensesSuccefully);
//     Go.back();
//   }
// }
