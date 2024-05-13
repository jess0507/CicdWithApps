import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_view_model.dart';
import 'package:meep_todo/pages/add_todo_dialog/importance_choice.dart';
import 'package:meep_todo/util/widget_key.dart';

import '../../util/lokalise_key.dart';

class AddTodoView extends ConsumerWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(LokaliseKey.cancel),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final todo = ref
                        .watch(addTodoViewmodel.select((value) => value.todo));
                    return TextButton(
                      key: const Key(WidgetKey.addTodoButton),
                      onPressed: todo.content.isEmpty
                          ? null
                          : () {
                              Navigator.of(context).pop(todo);
                            },
                      child: const Text(LokaliseKey.add),
                    );
                  },
                ),
              ],
            ),
            TextField(
              key: const ValueKey(WidgetKey.contentTextField),
              onChanged: (value) {
                ref.read(addTodoViewmodel.notifier).updateTodo(content: value);
              },
              decoration:
                  const InputDecoration(labelText: LokaliseKey.todoContent),
            ),
            const SizedBox(height: 32),
            const Text(LokaliseKey.importance, style: TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ImportanceChoices(
                    key: const ValueKey(WidgetKey.importanceChoices),
                    onChoicePressed: (importance) {
                      ref
                          .read(addTodoViewmodel.notifier)
                          .updateTodo(importance: importance);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
