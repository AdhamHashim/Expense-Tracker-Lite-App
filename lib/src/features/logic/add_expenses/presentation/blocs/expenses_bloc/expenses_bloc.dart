part of '../../imports/view_imports.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesBloc() : super(ExpensesState.initial()) {
    baseCrudUseCase = injector();
    on<AddExpensesEvent>((event, emit) => addExpense(event, emit));
  }

  late BaseCrudUseCase baseCrudUseCase;

  Future<void> addExpense(
    AddExpensesEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    try {
      if (!event.params.validateForm()) return;
      emit(state.copyWith(baseStatus: BaseStatus.loading));
      event.params.btnKey.currentState!.animateForward();
      await HiveBoxesConstant.putBalance(event.params);
      event.params.btnKey.currentState!.animateReverse();
      MessageUtils.showSnackBar(LocaleKeys.addexpensesSuccefully);
      emit(state.copyWith(baseStatus: BaseStatus.success));
      Go.offAll(const HomeScreen());
    } catch (e) {
      event.params.btnKey.currentState!.animateReverse();
      emit(state.copyWith(baseStatus: BaseStatus.error));

      MessageUtils.showSnackBar(LocaleKeys.exceptionError);
    }
  }
}
