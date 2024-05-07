import 'package:maio_photos/pages/first/first_page.dart';
import 'package:flutter/material.dart';

class MaioPhotosApp extends StatelessWidget {
  const MaioPhotosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}
