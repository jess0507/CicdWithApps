import 'dart:convert';
import 'package:curriculum/extensions.dart';

class Course {
  final String? name;
  final int? dayOfWeek;
  final String? startTime;
  final int? durationInMinutes;
  final String? info;

  String get displayTime =>
      '${dayOfWeek?.toDayOfWeekString()}, $startTime ~ $endTime';

  String get endTime {
    if (startTime.isNullOrEmpty() || durationInMinutes == null) return '';
    // 解析startTime
    List<String> timeComponents = startTime!.split(':');
    int hours = int.parse(timeComponents[0]);
    int minutes = int.parse(timeComponents[1]);

    // 加上durationInMinutes
    int totalMinutes = hours * 60 + minutes + (durationInMinutes ?? 0);

    // 計算新的小時和分鐘
    int newHours = (totalMinutes ~/ 60) % 24;
    int newMinutes = totalMinutes % 60;

    // 轉換為時間字串
    String newTimeString =
        '${newHours.toString().padLeft(2, '0')}:${newMinutes.toString().padLeft(2, '0')}';

    return newTimeString;
  }

  Course({
    this.name,
    this.dayOfWeek,
    this.startTime,
    this.durationInMinutes,
    this.info,
  });

  Course copyWith({
    String? name,
    int? dayOfWeek,
    String? startTime,
    int? durationInMinutes,
    String? info,
  }) =>
      Course(
        name: name ?? this.name,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        startTime: startTime ?? this.startTime,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        info: info ?? this.info,
      );

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        name: json["name"],
        dayOfWeek: json["dayOfWeek"],
        startTime: json["startTime"],
        durationInMinutes: json["durationInMinutes"],
        info: json["info"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "dayOfWeek": dayOfWeek,
        "startTime": startTime,
        "durationInMinutes": durationInMinutes,
        "info": info,
      };
}
