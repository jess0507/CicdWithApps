import 'package:currency_conversion/model/currency.dart';
import 'package:currency_conversion/model/get_currency_exchange_rate_list_request.dart';
import 'package:fimber/fimber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'rate_table_view_model_state.dart';

final rateTablePageViewmodel =
    StateNotifierProvider<RateTablePageViewmodel, RateTableViewModelState>(
        (ref) => throw UnimplementedError());

class RateTablePageViewmodel extends StateNotifier<RateTableViewModelState> {
  RateTablePageViewmodel() : super(RateTableViewModelState.empty()) {
    fetchCurrencyList();
  }

  Future<void> fetchCurrencyList() async {
    try {
      final res = await GetCurrencyExchangeRateListRequest().request();
      List<Currency> list = res.deserializedData;
      state = state.copyWith(currencyList: list);
    } catch (e) {
      Fimber.d('Error to fetchCurrencyList, e: $e');
    }
  }
}
