import 'dart:io';

import 'package:meep_todo/model/importance.dart';
import 'package:meep_todo/model/todo.dart';

import 'json_test_model.dart';

class TodoTestModel extends JsonTestModel<Todo> {
  @override
  String get trainString => File('test/jsons/todo.json').readAsStringSync();

  @override
  createModel() {
    return Todo(
      content: '1',
      importance: Importance.none,
      isCompleted: false,
    );
  }

  @override
  fromJson(String trainString) => Todo.fromJson(trainString);
}
