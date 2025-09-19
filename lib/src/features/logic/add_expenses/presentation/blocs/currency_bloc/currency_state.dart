part of '../../imports/view_imports.dart';

final class CurrencyState extends Equatable {
  final List<CurrencyEntity> currencies;
  const CurrencyState({required this.currencies});

  factory CurrencyState.initial() {
    return const CurrencyState(currencies: []);
  }

  CurrencyState copyWith({
    List<CurrencyEntity>? currencies,
  }) {
    return CurrencyState(
      currencies: currencies ?? this.currencies,
    );
  }

  @override
  List<Object?> get props => [currencies];
}
