import 'package:hive/hive.dart';
import 'dart:convert';

import 'package:meep_todo/hive/config/hive_type_id.dart';

import 'importance.dart';

part 'todo.g.dart';

@HiveType(typeId: HiveTypeId.todo)
class Todo extends HiveObject {
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

  factory Todo.fromJson(String str) => Todo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        content: json["content"],
        importance: Importance.fromString(json["importance"]),
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toMap() => {
        "content": content,
        "importance": importance.name,
        "isCompleted": isCompleted,
      };
}
