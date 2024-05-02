import 'package:curriculum/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class CurriculumApp extends StatelessWidget {
  const CurriculumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
