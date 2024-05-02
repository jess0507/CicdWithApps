import 'package:currency_conversion/pages/currency_conversion/conversion_button.dart';
import 'package:currency_conversion/pages/currency_conversion/conversion_hint_view.dart';
import 'package:currency_conversion/pages/currency_conversion/currency_conversion_page_view_model.dart';
import 'package:currency_conversion/util/constants.dart';
import 'package:currency_conversion/view/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'currency_item.dart';

class CurrencyConversionPage extends ConsumerWidget {
  const CurrencyConversionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const BackAppBar(title: Constants.rateConversionPageTitle),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  // 轉換前貨幣
                  Consumer(
                    builder: (context, ref, child) {
                      final currency = ref.watch(currencyConversionPageViewmodel
                          .select((value) => value.firstCurrency));
                      if (currency == null) {
                        return const SizedBox.shrink();
                      }
                      return CurrencyItem(
                        currency: currency,
                        onCurrencyChange: (currency) {
                          ref
                              .read(currencyConversionPageViewmodel.notifier)
                              .updateState(firstCurrency: currency);
                          Navigator.pop(context);
                        },
                        onAmountEntered: (value) {
                          ref
                              .read(currencyConversionPageViewmodel.notifier)
                              .updateState(firstAmount: value);
                        },
                      );
                    },
                  ),
                  // 中間分隔區
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(child: Divider()),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: ConversionButton(),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox.shrink(),
                            ),
                          ],
                        ),
                        // 換匯率顯示
                        Positioned(
                          right: 20,
                          top: 0,
                          child: ConversionHintView(),
                        ),
                      ],
                    ),
                  ),
                  // 轉換後貨幣
                  Consumer(
                    builder: (context, ref, child) {
                      final currency = ref.watch(currencyConversionPageViewmodel
                          .select((value) => value.secondCurrency));
                      final amount = ref.watch(currencyConversionPageViewmodel
                          .select((value) => value.secondAmount));
                      if (currency == null) {
                        return const SizedBox.shrink();
                      }
                      return CurrencyItem(
                        currency: currency,
                        amount: amount,
                        onCurrencyChange: (currency) {
                          ref
                              .read(currencyConversionPageViewmodel.notifier)
                              .updateState(secondCurrency: currency);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
