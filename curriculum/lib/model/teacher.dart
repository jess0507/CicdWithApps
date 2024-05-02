import 'dart:convert';

import 'course.dart';

class Teacher {
  final String? name;
  final String? title;
  final String? avatarUrl;
  final String? info;
  final List<Course>? courses;

  Teacher({
    this.name,
    this.title,
    this.avatarUrl,
    this.info,
    this.courses,
  });

  Teacher copyWith({
    String? name,
    String? teacherTitle,
    String? avatarUrl,
    String? info,
    List<Course>? courses,
  }) =>
      Teacher(
        name: name ?? this.name,
        title: teacherTitle ?? this.title,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        info: info ?? this.info,
        courses: courses ?? this.courses,
      );

  factory Teacher.fromJson(String str) => Teacher.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Teacher.fromMap(Map<String, dynamic> json) => Teacher(
        name: json["name"],
        title: json["title"],
        avatarUrl: json["avatarUrl"],
        info: json["info"],
        courses: List<Course>.from(
            json["courses"]?.map((x) => Course.fromMap(x)) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "title": title,
        "avatarUrl": avatarUrl,
        "info": info,
        "courses": List<dynamic>.from(courses?.map((x) => x.toMap()) ?? []),
      };
}
