part of '../imports/view_imports.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceState.initial()) {
    on<FetchBalanceData>(
      (event, emit) {},
    );
  }
}
