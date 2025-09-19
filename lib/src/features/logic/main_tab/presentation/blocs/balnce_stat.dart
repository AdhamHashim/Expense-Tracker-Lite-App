part of '../imports/view_imports.dart';

final class BalanceState extends Equatable {
  final BalanceEntity balanceEntity;

  const BalanceState({required this.balanceEntity});

  factory BalanceState.initial() {
    return BalanceState(
      balanceEntity: BalanceEntity.initial(),
    );
  }

  BalanceState copyWith({BalanceEntity? balanceEntity}) {
    return BalanceState(
      balanceEntity: balanceEntity ?? this.balanceEntity,
    );
  }

  @override
  List<Object?> get props => [balanceEntity];
}
