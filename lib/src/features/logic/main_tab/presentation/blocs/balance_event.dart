part of '../imports/view_imports.dart';

sealed class BalanceEvent {}

class FetchBalanceEvent extends BalanceEvent {
  final DropDownModel? filter;
  final int page;
  final int pageSize;
  FetchBalanceEvent({
    this.filter  ,
    this.page = 0,
    this.pageSize = 5,
  });
}

class InitInitialBalanceEvent extends BalanceEvent {}
