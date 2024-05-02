import 'package:currency_conversion/pages/currency_selection/currency_selection_item.dart';
import 'package:currency_conversion/pages/currency_selection/currency_selection_view_model.dart';
import 'package:currency_conversion/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/currency.dart';
import '../../view/back_app_bar.dart';

typedef OnSelectCurrencyItem = void Function(Currency);

class CurrencySelectionPage extends ConsumerWidget {
  const CurrencySelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyList = ref.watch(currencySelectionList);

    return Scaffold(
      appBar: const BackAppBar(title: Constants.currencySelectionPageTitle),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CurrencySelectionItem(
            currency: currencyList[index],
          );
        },
      ),
    );
  }
}
