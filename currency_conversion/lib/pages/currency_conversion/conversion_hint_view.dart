import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'currency_conversion_page_view_model.dart';

class ConversionHintView extends ConsumerWidget {
  const ConversionHintView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final firstCurrency = ref.watch(currencyConversionPageViewmodel
            .select((value) => value.firstCurrency));
        final secondCurrency = ref.watch(currencyConversionPageViewmodel
            .select((value) => value.secondCurrency));

        if (firstCurrency == null || secondCurrency == null) {
          return const SizedBox.shrink();
        }

        final conversionRate = ref.watch(currencyConversionPageViewmodel
            .select((value) => value.conversionRate));
        return Text(
          '1${firstCurrency.currency} ≈ $conversionRate${secondCurrency.currency}',
          style: const TextStyle(fontSize: 16),
        );
      },
    );
  }
}
