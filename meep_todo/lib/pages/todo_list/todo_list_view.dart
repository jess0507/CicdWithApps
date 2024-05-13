import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/util/widget_key.dart';

import 'todo_list_page_view_model.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos =
        ref.watch(todoListPageViewmodel.select((value) => value.todos));
    Fimber.d('update todos, length: ${todos.length}');

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: Key('${WidgetKey.todoListItemPrefix}${todo.key}'),
          onDismissed: (direction) async {
            await ref.read(todoListPageViewmodel.notifier).delete(todo: todo);
          },
          background: Container(
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 16),
              ],
            ),
          ),
          child: ListTile(
            title: Text(todo.content),
            leading: IconButton(
              key: Key('${WidgetKey.todoIsCompleteIconPrefix}${todo.key}'),
              icon: Icon(todo.isCompleted
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              onPressed: () async {
                final bool isCompleteAfterPressed = !todo.isCompleted;
                final newTodo =
                    todo.copyWith(isCompleted: isCompleteAfterPressed);
                await ref
                    .read(todoListPageViewmodel.notifier)
                    .updateTodo(oldTodo: todo, newTodo: newTodo);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: isCompleteAfterPressed
                //         ? Text('Added to favorites.')
                //         : Text('Removed from favorites.'),
                //     duration: const Duration(seconds: 1),
                //   ),
                // );
              },
            ),
          ),
        );
      },
    );
  }
}
