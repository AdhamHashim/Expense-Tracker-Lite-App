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
    if (!event.params.validateForm()) return;
    event.params.btnKey.currentState!.animateForward();
    await HiveBoxesConstant.putBalance(event.params);
    event.params.btnKey.currentState!.animateReverse();
    MessageUtils.showSnackBar(LocaleKeys.addexpensesSuccefully);
    Go.offAll(const HomeScreen());
  }
}
