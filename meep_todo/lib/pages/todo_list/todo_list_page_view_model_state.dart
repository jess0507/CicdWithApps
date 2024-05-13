import 'dart:convert';

import '../../model/todo.dart';

class TodoListPageViewModelState {
  final List<Todo> todos;

  TodoListPageViewModelState._({
    required this.todos,
  });

  factory TodoListPageViewModelState.empty() =>
      TodoListPageViewModelState._(todos: const []);

  TodoListPageViewModelState copyWith({
    List<Todo>? todos,
  }) =>
      TodoListPageViewModelState._(
        todos: todos ?? this.todos,
      );

  factory TodoListPageViewModelState.fromJson(String str) =>
      TodoListPageViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoListPageViewModelState.fromMap(Map<String, dynamic> json) =>
      TodoListPageViewModelState._(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
      };
}
