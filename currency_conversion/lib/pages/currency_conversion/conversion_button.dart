import 'package:currency_conversion/pages/currency_conversion/currency_conversion_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConversionButton extends ConsumerWidget {
  const ConversionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.black,
        shape: CircleBorder(),
      ),
      child: IconButton(
          icon: const Icon(
            Icons.keyboard_double_arrow_down,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            ref
                .read(currencyConversionPageViewmodel.notifier)
                .conversionCurrency();
          }),
    );
  }
}
