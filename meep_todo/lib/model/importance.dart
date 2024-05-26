import 'package:hive_flutter/hive_flutter.dart';

import '../hive/config/hive_type_id.dart';
part 'importance.g.dart';

@HiveType(typeId: HiveTypeId.importance)
enum Importance {
  @HiveField(0)
  none,

  @HiveField(1)
  low,

  @HiveField(2)
  medium,

  @HiveField(3)
  high;

  static Importance fromString(String importanceString) {
    return Importance.values
        .firstWhere((element) => element.name == importanceString);
  }

  String importanceDisplay() {
    return '!' * index;
  }
}
