import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: TodoListPage(),
      ),
    );
  }
}
