import 'package:curriculum/curriculum_app.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: CurriculumApp(),
    );
  }
}
