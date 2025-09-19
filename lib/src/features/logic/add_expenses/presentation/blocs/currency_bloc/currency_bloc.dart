part of '../../imports/view_imports.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyState.initial()) {
    baseCrudUseCase = injector();
    on<CurrencyEvent>((event, emit) => fetchCurrency(emit));
  }

  late BaseCrudUseCase baseCrudUseCase;

  List<CurrencyEntity> convertData(Map<String, dynamic> currency) {
    final List<CurrencyEntity> currencies = [];
    final keys = currency.keys.toList();
    final values = currency.values.toList();
    for (var i = 0; i < values.length; i++) {
      final CurrencyEntity cerruncy = CurrencyEntity(
        currencyTitle: keys[i],
        currency: double.parse("${values[i]}"),
      );
      currencies.add(cerruncy);
    }
    return currencies;
  }

  Future<List<CurrencyEntity>> fetchCurrency(
      Emitter<CurrencyState> emit) async {
    final result = await baseCrudUseCase.call<Map<String, dynamic>>(
      CrudBaseParmas(
        api: ApiConstants.currency,
        httpRequestType: HttpRequestType.get,
        mapper: (json) => json['rates'],
      ),
    );
    result.when(
      (cerrency) {
        final currencies = convertData(cerrency);
        emit(state.copyWith(currencies: currencies));
      },
      (error) {
        emit(state.copyWith(currencies: []));
      },
    );
    return state.currencies;
  }
}
