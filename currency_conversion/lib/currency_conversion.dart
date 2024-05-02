import 'package:currency_conversion/pages/rate_table/rate_table_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/rate_table/rate_table_page.dart';

class CurrencyConversionApp extends StatelessWidget {
  const CurrencyConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderScope(
        overrides: [
          rateTablePageViewmodel.overrideWith((ref) => RateTablePageViewmodel())
        ],
        child: const RateTablePage(),
      ),
    );
  }
}
