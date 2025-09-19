class CurrencyEntity {
  final String currencyTitle;
  final double currency;

  const CurrencyEntity({
    required this.currencyTitle,
    required this.currency,
  });

  factory CurrencyEntity.fromJson({
    required String title,
    required double value,
  }) {
    return CurrencyEntity(
      currencyTitle: title,
      currency: value,
    );
  }
}
