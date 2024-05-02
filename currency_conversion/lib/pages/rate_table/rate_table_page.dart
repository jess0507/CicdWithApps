import 'package:currency_conversion/pages/rate_table/currency_conversion_button.dart';
import 'package:currency_conversion/pages/rate_table/rate_table_category_view.dart';
import 'package:currency_conversion/pages/rate_table/rate_table_page_view_model.dart';
import 'package:currency_conversion/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'rate_table_item.dart';

class RateTablePage extends ConsumerWidget {
  const RateTablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyList = ref.watch(rateTablePageViewmodel).currencyList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.rateTablePageTitle),
        centerTitle: true,
      ),
      body: currencyList.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                const RateTableCategoryView(),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: currencyList.length,
                    itemBuilder: (context, index) {
                      return RateTableItem(currency: currencyList[index]);
                    },
                  ),
                ),
                const Divider(),
                const CurrencyConversionButton(),
              ],
            ),
    );
  }
}
