// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_view_model_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTodoViewModelState _$AddTodoViewModelStateFromJson(
        Map<String, dynamic> json) =>
    AddTodoViewModelState(
      todo: Todo.fromJson(json['todo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddTodoViewModelStateToJson(
        AddTodoViewModelState instance) =>
    <String, dynamic>{
      'todo': instance.todo,
    };
