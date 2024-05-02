import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../test_data/teacher_data.dart';
import 'teacher_list_view_model_state.dart';

final teacherListViewmodel =
    StateNotifierProvider<TeacherListViewmodel, TeacherListViewModelState>(
        (ref) => TeacherListViewmodel());

class TeacherListViewmodel extends StateNotifier<TeacherListViewModelState> {
  TeacherListViewmodel() : super(TeacherListViewModelState.empty()) {
    final newState = fetchTeachers();
    state = newState;
  }

  TeacherListViewModelState fetchTeachers() {
    return TeacherListViewModelState.fromJson(teacherData);
  }
}
