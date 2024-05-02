import 'dart:convert';

import 'package:currency_conversion/model/currency.dart';

class CurrencyConversionPageViewModelState {
  final List<Currency> currencyList;
  final Currency? firstCurrency;
  final Currency? secondCurrency;
  final double firstAmount;
  final double secondAmount;
  final double conversionRate;

  CurrencyConversionPageViewModelState({
    this.currencyList = const [],
    this.firstCurrency,
    this.secondCurrency,
    this.firstAmount = 0.0,
    this.secondAmount = 0.0,
    this.conversionRate = 0.0,
  });

  CurrencyConversionPageViewModelState copyWith({
    List<Currency>? currencyList,
    Currency? firstCurrency,
    Currency? secondCurrency,
    double? firstAmount,
    double? secondAmount,
    double? conversionRate,
  }) =>
      CurrencyConversionPageViewModelState(
        currencyList: currencyList ?? this.currencyList,
        firstCurrency: firstCurrency ?? this.firstCurrency,
        secondCurrency: secondCurrency ?? this.secondCurrency,
        firstAmount: firstAmount ?? this.firstAmount,
        secondAmount: secondAmount ?? this.secondAmount,
        conversionRate: conversionRate ?? this.conversionRate,
      );

  factory CurrencyConversionPageViewModelState.fromJson(String str) =>
      CurrencyConversionPageViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyConversionPageViewModelState.fromMap(
          Map<String, dynamic> json) =>
      CurrencyConversionPageViewModelState(
        currencyList: List<Currency>.from(
            json["currencyList"].map((x) => Currency.fromMap(x))),
        firstCurrency: json["firstCurrency"] == null
            ? null
            : Currency.fromMap(json["firstCurrency"]),
        secondCurrency: json["secondCurrency"] == null
            ? null
            : Currency.fromMap(json["secondCurrency"]),
        firstAmount: json["firstAmount"]?.toDouble(),
        secondAmount: json["secondAmount"]?.toDouble(),
        conversionRate: json["conversionRate"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "currencyList": List<dynamic>.from(currencyList.map((x) => x.toMap())),
        "firstCurrency": firstCurrency?.toMap(),
        "secondCurrency": secondCurrency?.toMap(),
        "firstAmount": firstAmount,
        "secondAmount": secondAmount,
        "conversionRate": conversionRate,
      };
}
