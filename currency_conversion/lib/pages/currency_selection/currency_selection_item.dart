import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/currency.dart';
import 'currency_selection_view_model.dart';

class CurrencySelectionItem extends ConsumerWidget {
  final Currency currency;

  const CurrencySelectionItem({
    super.key,
    required this.currency,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(onSelectCurrencyItem).call(currency),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.network(
              '${currency.currencyIcon}',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('${currency.currency}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
