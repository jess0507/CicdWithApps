import 'package:currency_conversion/pages/currency_conversion/currency_conversion_page.dart';
import 'package:currency_conversion/pages/currency_conversion/currency_conversion_page_view_model.dart';
import 'package:currency_conversion/pages/rate_table/rate_table_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencyConversionButton extends ConsumerWidget {
  const CurrencyConversionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: const Text(
            'Currency Conversion',
            style: TextStyle(fontSize: 20),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              final currencyList =
                  ref.watch(rateTablePageViewmodel).currencyList;
              return ProviderScope(
                overrides: [
                  currencyConversionPageViewmodel
                      .overrideWith((ref) => CurrencyConversionPageViewmodel(
                            ref: ref,
                            currencyList: currencyList,
                          )),
                ],
                child: const CurrencyConversionPage(),
              );
            }),
          );
        },
      ),
    );
  }
}
