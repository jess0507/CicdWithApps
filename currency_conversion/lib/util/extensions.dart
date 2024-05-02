import 'dart:math';

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension DoubleExtension on double {
  double truncateToDecimalPlaces(int decimal) =>
      (this * pow(10, decimal)).truncate() / pow(10, decimal);
}
