import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maio_photos/pages/first/first_page.dart';
import 'package:flutter/material.dart';

class PhotosApp extends StatelessWidget {
  const PhotosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: FirstPage(),
      ),
    );
  }
}
