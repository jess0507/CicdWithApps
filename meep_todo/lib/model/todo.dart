import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:meep_todo/hive/config/hive_type_id.dart';
import 'package:meep_todo/model/data_model.dart';

import 'importance.dart';

part 'todo.g.dart';

@HiveType(typeId: HiveTypeId.todo)
@JsonSerializable()
class Todo extends HiveObject with DataModelMixin {
  @HiveField(1)
  final String content;
  @HiveField(2)
  final Importance importance;
  @HiveField(3)
  final bool isCompleted;

  Todo({
    this.content = '',
    this.importance = Importance.none,
    this.isCompleted = false,
  });

  Todo copyWith({
    String? content,
    Importance? importance,
    bool? isCompleted,
  }) =>
      Todo(
        content: content ?? this.content,
        importance: importance ?? this.importance,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
