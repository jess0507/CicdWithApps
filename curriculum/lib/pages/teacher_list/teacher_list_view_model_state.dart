import 'dart:convert';

import '../../model/teacher.dart';

class TeacherListViewModelState {
  final List<Teacher> teachers;

  TeacherListViewModelState._({
    required this.teachers,
  });

  factory TeacherListViewModelState.empty() =>
      TeacherListViewModelState._(teachers: const []);

  TeacherListViewModelState copyWith({
    List<Teacher>? teachers,
  }) =>
      TeacherListViewModelState._(
        teachers: teachers ?? this.teachers,
      );

  factory TeacherListViewModelState.fromJson(String str) =>
      TeacherListViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherListViewModelState.fromMap(Map<String, dynamic> json) =>
      TeacherListViewModelState._(
        teachers:
            List<Teacher>.from(json["teachers"].map((x) => Teacher.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "teachers": List<dynamic>.from(teachers.map((x) => x.toMap())),
      };
}
