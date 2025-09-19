part of '../../imports/view_imports.dart';

sealed class ExpensesEvent {}

class AddExpensesEvent extends ExpensesEvent {
  final AddExpensesParams params;
  AddExpensesEvent(this.params);
}
