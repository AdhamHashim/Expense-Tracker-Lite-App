part of '../../imports/view_imports.dart';

sealed class CurrencyEvent {}

class FetchCurrencyEvent extends CurrencyEvent {
  FetchCurrencyEvent();
}
