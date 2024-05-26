import 'dart:io';

import 'package:hive/hive.dart';
import 'package:meep_todo/hive/config/box_name.dart';
import 'package:meep_todo/hive/config/config.dart';

class HiveConfig {
  HiveConfig._();

  static HiveConfig instance = HiveConfig._();

  factory HiveConfig() => instance;

  static const testSourcePath = 'test-resources';

  Future<void> initHive() async {
    final testPath = File(testSourcePath).path;
    Hive.init(testPath);
    registerHiveAdapters();
    await Hive.openBox(BoxName.todo.name);
  }
}
