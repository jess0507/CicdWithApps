import 'dart:convert';

import '../../model/data_model.dart';
import '../../model/todo.dart';

class AddTodoViewModelState with DataModelMixin {
  final Todo todo;

  AddTodoViewModelState({
    required this.todo,
  });

  factory AddTodoViewModelState.empty() => AddTodoViewModelState(todo: Todo());

  AddTodoViewModelState copyWith({
    Todo? todo,
  }) =>
      AddTodoViewModelState(
        todo: todo ?? this.todo,
      );

  factory AddTodoViewModelState.fromJson(String str) =>
      AddTodoViewModelState.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory AddTodoViewModelState.fromMap(Map<String, dynamic> json) =>
      AddTodoViewModelState(
        todo: Todo.fromMap(json["todo"]),
      );

  @override
  Map<String, dynamic> toMap() => {
        "todo": todo.toMap(),
      };
}
