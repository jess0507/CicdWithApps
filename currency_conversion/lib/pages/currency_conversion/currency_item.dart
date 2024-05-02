import 'package:currency_conversion/pages/currency_conversion/currency_conversion_page_view_model.dart';
import 'package:currency_conversion/pages/currency_selection/currency_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/currency.dart';
import '../currency_selection/currency_selection_view_model.dart';

class CurrencyItem extends ConsumerWidget {
  final Currency currency;
  final double amount;
  final Function(Currency) onCurrencyChange;
  final ValueChanged<double>? onAmountEntered;

  const CurrencyItem({
    super.key,
    required this.currency,
    this.amount = 0.0,
    required this.onCurrencyChange,
    this.onAmountEntered,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController(text: amount.toString());

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      final currencyList = ref
                          .read(currencyConversionPageViewmodel)
                          .currencyList;
                      return ProviderScope(
                        overrides: [
                          currencySelectionList.overrideWithValue(currencyList),
                          onSelectCurrencyItem
                              .overrideWithValue(onCurrencyChange),
                        ],
                        child: const CurrencySelectionPage(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      '${currency.currencyIcon}',
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      '${currency.currency}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 1,
            child: TextField(
              controller: controller,
              enabled: onAmountEntered != null,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                onAmountEntered?.call(double.tryParse(value) ?? 0.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
