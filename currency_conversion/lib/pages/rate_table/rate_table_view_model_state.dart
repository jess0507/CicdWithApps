import 'dart:convert';

import 'package:currency_conversion/model/currency.dart';

class RateTableViewModelState {
  final List<Currency> currencyList;

  RateTableViewModelState._({
    required this.currencyList,
  });

  factory RateTableViewModelState.empty() =>
      RateTableViewModelState._(currencyList: const []);

  RateTableViewModelState copyWith({
    List<Currency>? currencyList,
  }) =>
      RateTableViewModelState._(
        currencyList: currencyList ?? this.currencyList,
      );

  factory RateTableViewModelState.fromJson(String str) =>
      RateTableViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RateTableViewModelState.fromMap(Map<String, dynamic> json) =>
      RateTableViewModelState._(
        currencyList: List<Currency>.from(
            json["currencyList"].map((x) => Currency.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "currencyList": List<dynamic>.from(currencyList.map((x) => x.toMap())),
      };
}
