import 'package:flutter/material.dart';

class RateTableCategoryView extends StatelessWidget {
  const RateTableCategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: const Row(
        children: [
          SizedBox(width: 52),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Currency'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Price'),
            ),
          ),
        ],
      ),
    );
  }
}
