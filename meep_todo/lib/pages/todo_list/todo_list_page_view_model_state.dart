import 'package:json_annotation/json_annotation.dart';

import '../../model/data_model.dart';
import '../../model/todo.dart';

part 'todo_list_page_view_model_state.g.dart';

@JsonSerializable()
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

  factory TodoListPageViewModelState.fromJson(Map<String, dynamic> json) =>
      _$TodoListPageViewModelStateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoListPageViewModelStateToJson(this);
}
