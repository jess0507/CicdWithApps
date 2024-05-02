import 'package:fimber/fimber.dart';
import 'package:flutter_test/flutter_test.dart';

import '../model/get_currency_exchange_rate_list_request.dart';
import '../model/http_response.dart';

void testRateTable() {
  test('- Get rate table list.', () async {
    // Action
    HttpResponse? response;
    try {
      response = await GetCurrencyExchangeRateListRequest().request();
    } catch (e) {
      Fimber.d('Fail to request: $e, UI needs display error.');
    }
    // Assert
    if (response?.statusCode == 200) {
      final list = response?.deserializedData;
      expect(list.length, 25);
      expect(list[0].id, isNotEmpty);
      expect(list[0].currency, isNotEmpty);
      expect(list[0].currencyIcon, isNotEmpty);
      expect(list[0].twdPrice, 37081.21);
      expect(list[0].amountDecimal, '7');
    }
  });
}
