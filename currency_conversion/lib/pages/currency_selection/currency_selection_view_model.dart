import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/currency.dart';
import 'currency_selection_page.dart';

final onSelectCurrencyItem =
    Provider<OnSelectCurrencyItem>((ref) => throw UnimplementedError());

final currencySelectionList =
    Provider<List<Currency>>((ref) => throw UnimplementedError());
