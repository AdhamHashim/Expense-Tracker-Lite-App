part of '../imports/view_imports.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceState.initial()) {
    on<InitInitialBalanceEvent>(_onInitInitialBalance);
    on<FetchBalanceEvent>(_onFetchBalance);
  }

  Future<void> _onInitInitialBalance(
      InitInitialBalanceEvent event, Emitter<BalanceState> emit) async {
    final balanceEntity = await HiveBoxesConstant.getBalance();
    final initialValue = balanceEntity ?? BalanceEntity.initial();

    if (balanceEntity == null) {
      await HiveBoxesConstant.getBalanceBox.put(
        HiveBoxesConstant.balanceObject,
        initialValue,
      );
    }

    emit(state.copyWith(
      balanceEntity: initialValue,
      baseStatus: BaseStatus.success,
      page: 0,
      hasReachedMax: false,
    ));
  }

  Future<void> _onFetchBalance(
      FetchBalanceEvent event, Emitter<BalanceState> emit) async {
    final isFirstPage = event.page == 0;

    // Loading state
    if (isFirstPage) {
      emit(state.copyWith(baseStatus: BaseStatus.loading, hasReachedMax: false));
    } else {
      emit(state.copyWith(baseStatus: BaseStatus.loadingMore));
    }

    try {
      await Future.delayed(const Duration(seconds: 1)); // simulate loading

      final data = await HiveBoxesConstant.getBalance(
        filter: event.filter?.id ?? 0,
        page: event.page,
        pageSize: event.pageSize,
      );

      if (data == null) {
        emit(state.copyWith(baseStatus: BaseStatus.error));
        return;
      }

      // Merge for pagination, replace for first page
      final allExpenses = isFirstPage
          ? [...data.expenses]
          : [...state.balanceEntity.expenses, ...data.expenses];

      final uniqueExpenses = {for (var e in allExpenses) e.id: e}.values.toList();

      final updatedValue = BalanceEntity(
        totalBalance: data.totalBalance,
        incomeBalance: data.incomeBalance,
        expensesBalance: data.expensesBalance,
        expenses: uniqueExpenses,
      );

      final hasReachedMax = data.expenses.length < event.pageSize;

      emit(state.copyWith(
        balanceEntity: updatedValue,
        baseStatus: BaseStatus.success,
        filter: event.filter,
        page: event.page,
        hasReachedMax: hasReachedMax,
      ));
    } catch (_) {
      emit(state.copyWith(baseStatus: BaseStatus.error));
    }
  }
}
