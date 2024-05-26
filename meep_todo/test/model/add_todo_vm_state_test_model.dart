import 'dart:io';

import 'package:meep_todo/model/importance.dart';
import 'package:meep_todo/model/todo.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_view_model_state.dart';

import 'json_test_model.dart';

class AddTodoVMStateTestModel extends JsonTestModel<AddTodoViewModelState> {
  @override
  String get trainString =>
      File('test/jsons/add_todo_state.json').readAsStringSync();

  @override
  AddTodoViewModelState createModel() {
    return AddTodoViewModelState(
      todo: Todo(
        content: '1',
        importance: Importance.none,
        isCompleted: false,
      ),
    );
  }

  @override
  fromJson(Map<String, dynamic> json) => AddTodoViewModelState.fromJson(json);
}
