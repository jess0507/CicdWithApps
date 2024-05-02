import 'package:currency_conversion/model/currency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'currency_conversion_page_view_model_state.dart';

final currencyConversionPageViewmodel = StateNotifierProvider<
    CurrencyConversionPageViewmodel,
    CurrencyConversionPageViewModelState>((ref) => throw UnimplementedError());

class CurrencyConversionPageViewmodel
    extends StateNotifier<CurrencyConversionPageViewModelState> {
  Ref ref;

  CurrencyConversionPageViewmodel({
    required this.ref,
    required List<Currency> currencyList,
  }) : super(CurrencyConversionPageViewModelState()) {
    // initial state
    if (currencyList.length < 2) return;
    updateState(
      currencyList: currencyList,
      firstCurrency: currencyList[0],
      secondCurrency: currencyList[1],
    );
  }

  void updateState({
    List<Currency>? currencyList,
    Currency? firstCurrency,
    Currency? secondCurrency,
    double? firstAmount,
    double? secondAmount,
    double? conversionRate,
  }) {
    final newFirstCurrency = firstCurrency ?? state.firstCurrency;
    final newSecondCurrency = secondCurrency ?? state.secondCurrency;
    state = state.copyWith(
      currencyList: currencyList,
      firstCurrency: newFirstCurrency,
      secondCurrency: newSecondCurrency,
      firstAmount: firstAmount,
      secondAmount: secondAmount,
      conversionRate: (newFirstCurrency == null || newSecondCurrency == null)
          ? null
          : Currency.calculateExchangeRate(newFirstCurrency, newSecondCurrency),
    );
  }

  void conversionCurrency() {
    updateState(secondAmount: state.firstAmount * state.conversionRate);
  }
}
