import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import 'currency_conversion.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CurrencyConversionApp();
  }
}
