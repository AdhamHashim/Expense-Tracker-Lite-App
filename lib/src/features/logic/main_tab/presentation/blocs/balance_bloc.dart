part of '../imports/view_imports.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceState.initial()) {
    on<FetchBalanceEvent>(
      (event, emit) => getBalance(emit, event),
    );
    on<InitInitialBalanceEvent>(
      (event, emit) => initInitialBalanceEvent(),
    );
  }

  Future<void> initInitialBalanceEvent() async {
    final balanceEntity = await HiveBoxesConstant.getBalance();
    if (balanceEntity == null) {
      await HiveBoxesConstant.getBalanceBox.put(
        HiveBoxesConstant.balanceObject,
        BalanceEntity.initial(),
      );
    }
    emit(state.copyWith(balanceEntity: balanceEntity));
  }

  Future<void> getBalance(
    Emitter<BalanceState> emit,
    FetchBalanceEvent event,
  ) async {
    emit(state.copyWith(baseStatus: BaseStatus.loading));

    final data = await HiveBoxesConstant.getBalance(
      filter: event.filter != null ? event.filter!.id : 0,
      page: event.page,
      pageSize: event.pageSize,
    );

    if (data != null) {
      List<ExpensesEntity> allExpenses;

      // Check if filter changed
      if (event.filter?.id == state.filter?.id) {
        // Same filter → append next page
        allExpenses = [...state.balanceEntity.expenses, ...data.expenses];
      } else {
        // New filter → start fresh
        allExpenses = [...data.expenses];
      }

      // Remove duplicates by id
      final uniqueExpenses =
          {for (var e in allExpenses) e.id: e}.values.toList();

      final updatedValue = BalanceEntity(
        totalBalance: data.totalBalance,
        incomeBalnce: data.incomeBalnce,
        expensesBalance: data.expensesBalance,
        expenses: uniqueExpenses,
      );

      emit(state.copyWith(
        balanceEntity: updatedValue,
        baseStatus: BaseStatus.success,
        filter: event.filter, // remember current filter
        page: event.page,
      ));
    } else {
      emit(state.copyWith(baseStatus: BaseStatus.error));
    }
  }
}
