import 'dart:convert';

import '../../model/todo.dart';

class AddTodoViewModelState {
  final Todo todo;

  AddTodoViewModelState._({
    required this.todo,
  });

  factory AddTodoViewModelState.empty() =>
      AddTodoViewModelState._(todo: Todo());

  AddTodoViewModelState copyWith({
    Todo? todo,
  }) =>
      AddTodoViewModelState._(
        todo: todo ?? this.todo,
      );

  factory AddTodoViewModelState.fromJson(String str) =>
      AddTodoViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddTodoViewModelState.fromMap(Map<String, dynamic> json) =>
      AddTodoViewModelState._(
        todo: Todo.fromJson(json["todo"]),
      );

  Map<String, dynamic> toMap() => {
        "todo": todo.toJson(),
      };
}
