part of '../../imports/view_imports.dart';

sealed class CategoryEvent {}

class FetchCategoryEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final AddCategoryParams params;
  final AddExpensesParams expensesParams;
  AddCategoryEvent(this.params, this.expensesParams);
}
