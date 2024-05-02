import 'package:flutter/material.dart';

import '../../model/currency.dart';

class RateTableItem extends StatelessWidget {
  final Currency currency;

  const RateTableItem({
    super.key,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Text('${currency.currency}/TWD'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('${currency.twdPrice}'),
            ),
          ),
        ],
      ),
    );
  }
}
