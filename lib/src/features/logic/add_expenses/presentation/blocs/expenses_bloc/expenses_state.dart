// part of '../imports/view_imports.dart';

// final class ExpensesState extends Equatable {
//   final List<CurrencyEntity> currencies;
//   final List<CategoryEntity> categories;
//   final BaseStatus baseStatus;
//   final String errorMessage;
//   const ExpensesState({
//     required this.baseStatus,
//     required this.currencies,
//     required this.categories,
//     required this.errorMessage,
//   });

//   factory ExpensesState.initial() {
//     return const ExpensesState(
//       baseStatus: BaseStatus.initial,
//       currencies: [],
//       categories: [],
//       errorMessage: ConstantManager.emptyText,
//     );
//   }

//   ExpensesState copyWith({
//     BaseStatus? baseStatus,
//     List<CurrencyEntity>? currencies,
//     List<CategoryEntity>? categories,
//     String? errorMessage,
//   }) {
//     return ExpensesState(
//       baseStatus: baseStatus ?? this.baseStatus,
//       currencies: currencies ?? this.currencies,
//       categories: categories ?? this.categories,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         baseStatus,
//         currencies,
//         categories,
//         errorMessage,
//       ];
// }
