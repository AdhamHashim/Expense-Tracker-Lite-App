part of '../../imports/view_imports.dart';

final class ExpensesState extends Equatable {
  final BaseStatus baseStatus;
  final String? errorMessage;
  final bool isSuccess;

  const ExpensesState({
    required this.baseStatus,
    this.errorMessage,
    this.isSuccess = false,
  });

  factory ExpensesState.initial() {
    return const ExpensesState(
      baseStatus: BaseStatus.initial,
      isSuccess: false,
    );
  }

  ExpensesState copyWith({
    BaseStatus? baseStatus,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ExpensesState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [baseStatus, errorMessage, isSuccess];
}
