import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/course.dart';

class CoursePage extends ConsumerWidget {
  final Course course;

  const CoursePage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('課程內容頁')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.name ?? ''),
            Text(course.displayTime),
          ],
        ),
      ),
    );
  }
}
