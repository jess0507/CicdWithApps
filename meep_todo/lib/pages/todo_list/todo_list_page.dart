import 'package:fimber/fimber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_dialog.dart';
import 'package:meep_todo/pages/todo_list/todo_list_view.dart';
import 'package:meep_todo/util/lokalise_key.dart';
import 'package:flutter/material.dart';
import 'package:meep_todo/util/widget_key.dart';

import '../../model/todo.dart';
import 'todo_list_page_view_model.dart';

class TodoListPage extends ConsumerWidget {
  static const routeName = '/todo_list_page';

  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addTodo() async {
      final Todo? newTodo = await AddTodoDialog.show(context: context);
      Fimber.d('add todo: ${newTodo?.toJson()}');
      if (newTodo == null) return;

      ref.read(todoListPageViewmodel.notifier).addTodo(newTodo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(LokaliseKey.todoListPage),
      ),
      body: const TodoListView(),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey(WidgetKey.addTodoFloatingButton),
        onPressed: () {
          addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
