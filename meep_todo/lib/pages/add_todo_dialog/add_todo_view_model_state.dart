import 'package:json_annotation/json_annotation.dart';

import '../../model/data_model.dart';
import '../../model/todo.dart';

part 'add_todo_view_model_state.g.dart';

@JsonSerializable()
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

  factory AddTodoViewModelState.fromJson(Map<String, dynamic> json) =>
      _$AddTodoViewModelStateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddTodoViewModelStateToJson(this);
}
