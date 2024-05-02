import 'package:curriculum/pages/teacher_list/teacher_list_view_model.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'teacher_list_item_view.dart';

class TeacherListPage extends ConsumerWidget {
  const TeacherListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tutors = ref.watch(teacherListViewmodel).teachers;

    return Scaffold(
      appBar: AppBar(title: const Text('導師列表')),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tutors.length,
        itemBuilder: (context, index) {
          Fimber.d(tutors[index].toJson());
          return TeacherListItemView(tutor: tutors[index]);
        },
      ),
    );
  }
}
