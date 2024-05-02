import 'dart:convert';

import 'package:currency_conversion/util/extensions.dart';

class Currency {
  final String? currency;
  final String? currencyIcon;
  final double? twdPrice;
  final String? amountDecimal;
  final String? id;

  Currency({
    this.currency,
    this.currencyIcon,
    this.twdPrice,
    this.amountDecimal,
    this.id,
  });

  Currency copyWith({
    String? currency,
    String? currencyIcon,
    double? twdPrice,
    String? amountDecimal,
    String? id,
  }) =>
      Currency(
        currency: currency ?? this.currency,
        currencyIcon: currencyIcon ?? this.currencyIcon,
        twdPrice: twdPrice ?? this.twdPrice,
        amountDecimal: amountDecimal ?? this.amountDecimal,
        id: id ?? this.id,
      );

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        currency: json["currency"],
        currencyIcon: json["currency_icon"],
        twdPrice: json["twd_price"]?.toDouble(),
        amountDecimal: json["amount_decimal"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "currency": currency,
        "currency_icon": currencyIcon,
        "twd_price": twdPrice,
        "amount_decimal": amountDecimal,
        "id": id,
      };

  int get amountDecimalInteger => int.tryParse(amountDecimal ?? '0') ?? 0;

  static double calculateExchangeRate(
      Currency firstCurrency, Currency sencondCurrency) {
    if (firstCurrency.twdPrice == null || sencondCurrency.twdPrice == null) {
      return 0;
    }
    final rate = (firstCurrency.twdPrice! / sencondCurrency.twdPrice!)
        .truncateToDecimalPlaces(sencondCurrency.amountDecimalInteger);
    return rate;
  }
}
