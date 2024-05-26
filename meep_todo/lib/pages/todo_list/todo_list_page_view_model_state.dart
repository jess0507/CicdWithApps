import 'dart:convert';

import '../../model/data_model.dart';
import '../../model/todo.dart';

class TodoListPageViewModelState with DataModelMixin {
  final List<Todo> todos;

  TodoListPageViewModelState({
    required this.todos,
  });

  factory TodoListPageViewModelState.empty() =>
      TodoListPageViewModelState(todos: const []);

  TodoListPageViewModelState copyWith({
    List<Todo>? todos,
  }) =>
      TodoListPageViewModelState(
        todos: todos ?? this.todos,
      );

  factory TodoListPageViewModelState.fromJson(String str) =>
      TodoListPageViewModelState.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory TodoListPageViewModelState.fromMap(Map<String, dynamic> json) =>
      TodoListPageViewModelState(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toMap())),
      };
}
