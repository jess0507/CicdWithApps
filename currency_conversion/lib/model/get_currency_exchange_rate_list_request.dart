import 'package:dio/dio.dart';

import 'currency.dart';
import 'requset.dart';

class GetCurrencyExchangeRateListRequest extends Request<List<Currency>> {
  GetCurrencyExchangeRateListRequest() {
    path = "/pairs";
    method = "GET";
  }

  @override
  List<Currency> deserialize(Response response) {
    List<Currency> courses = [];
    for (final currencyJson in response.data) {
      courses.add(Currency.fromMap(currencyJson));
    }
    return courses;
  }
}
