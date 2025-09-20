part of '../imports/view_imports.dart';

final class BalanceState extends Equatable {
  final BalanceEntity balanceEntity;
  final BaseStatus baseStatus;
  final DropDownModel? filter;
  final int page;
  final bool hasReachedMax;
  
  const BalanceState({
    required this.balanceEntity,
    required this.baseStatus,
    this.filter,
    this.page = 0,
    this.hasReachedMax = false,
  });

  factory BalanceState.initial() {
    return BalanceState(
      balanceEntity: BalanceEntity.initial(),
      baseStatus: BaseStatus.initial,
    );
  }

  BalanceState copyWith({
    BalanceEntity? balanceEntity,
    BaseStatus? baseStatus,
    DropDownModel? filter,
    int? page,
    bool? hasReachedMax,
  }) {
    return BalanceState(
      baseStatus: baseStatus ?? this.baseStatus,
      balanceEntity: balanceEntity ?? this.balanceEntity,
      page: page ?? this.page,
      filter: filter ?? this.filter,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        baseStatus,
        balanceEntity,
        filter,
        page,
        hasReachedMax,
      ];
}
