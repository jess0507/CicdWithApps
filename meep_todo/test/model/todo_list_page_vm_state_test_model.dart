import 'dart:io';

import 'package:meep_todo/model/importance.dart';
import 'package:meep_todo/model/todo.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page_view_model_state.dart';

import 'json_test_model.dart';

class TodoListPageVMStateTestModel
    extends JsonTestModel<TodoListPageViewModelState> {
  @override
  String get trainString =>
      File('test/jsons/todo_list_state.json').readAsStringSync();

  @override
  TodoListPageViewModelState createModel() {
    return TodoListPageViewModelState(todos: [
      Todo(
        content: '1',
        importance: Importance.none,
        isCompleted: false,
      ),
      Todo(
        content: '2',
        importance: Importance.low,
        isCompleted: true,
      ),
    ]);
  }

  @override
  fromJson(String json) => TodoListPageViewModelState.fromJson(json);
}
