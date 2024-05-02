import 'package:curriculum/pages/course/course_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/teacher.dart';

class TeacherListItemView extends HookConsumerWidget {
  final Teacher tutor;

  const TeacherListItemView({
    super.key,
    required this.tutor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final teacherTrailingIcon =
        useMemoized(() => isExpanded.value ? Icons.remove : Icons.add);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: (tutor.avatarUrl ?? '').isEmpty
              ? CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    (tutor.name ?? '').substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : CircleAvatar(child: Image.network(tutor.avatarUrl!)),
          trailing: Icon(teacherTrailingIcon),
          title: Text(
            tutor.title ?? '',
            style: const TextStyle(color: Colors.grey),
          ),
          subtitle: Text(tutor.name ?? ''),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(color: Colors.grey),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var course in tutor.courses ?? [])
                  ListTile(
                    title: Text(course.name),
                    subtitle: Text(course.displayTime),
                    leading: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoursePage(course: course)),
                      );
                    },
                  ),
              ],
            ),
          ],
          onExpansionChanged: (expanded) {
            isExpanded.value = expanded; // Update expansion state
          },
        ),
      ),
    );
  }
}
