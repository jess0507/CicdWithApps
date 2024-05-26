// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_page_view_model_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListPageViewModelState _$TodoListPageViewModelStateFromJson(
        Map<String, dynamic> json) =>
    TodoListPageViewModelState(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodoListPageViewModelStateToJson(
        TodoListPageViewModelState instance) =>
    <String, dynamic>{
      'todos': instance.todos,
    };
