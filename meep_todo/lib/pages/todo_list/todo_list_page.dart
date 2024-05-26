import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_dialog.dart';
import 'package:meep_todo/pages/todo_list/todo_list_view.dart';
import 'package:meep_todo/util/lokalise_key.dart';
import 'package:flutter/material.dart';
import 'package:meep_todo/util/widget_key.dart';

class TodoListPage extends ConsumerWidget {
  static const routeName = '/todo_list_page';

  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LokaliseKey.todoListPage),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: const TodoListView(),
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey(WidgetKey.addTodoFloatingButton),
        onPressed: () => AddTodoDialog.show(context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
