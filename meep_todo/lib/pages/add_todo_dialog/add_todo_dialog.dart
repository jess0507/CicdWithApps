import 'package:flutter/material.dart';
import 'package:meep_todo/model/todo.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_view.dart';

class AddTodoDialog {
  static Future<Todo?> show({required BuildContext context}) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddTodoView();
      },
    );
    return result;
  }
}
