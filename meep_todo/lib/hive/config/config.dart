import 'package:fimber/fimber.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meep_todo/hive/config/hive_type_id.dart';

import '../../model/importance.dart';
import '../../model/todo.dart';
import 'box_name.dart';

Future<void> initialHive() async {
  await Hive.initFlutter();
  registerHiveAdapters();
  await openHiveBoxs().catchError((e, s) {
    Fimber.e('Cannot open hive', ex: e, stacktrace: s);
  });
}

void registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(HiveTypeId.todo)) {
    Hive.registerAdapter(TodoAdapter());
  }
  if (!Hive.isAdapterRegistered(HiveTypeId.importance)) {
    Hive.registerAdapter(ImportanceAdapter());
  }
}

Future openHiveBoxs() async {
  for (var box in BoxName.values) {
    try {
      return await Hive.openBox(box.name);
    } catch (e, s) {
      Fimber.w(
        'Cannot open box',
        ex: e,
        stacktrace: s,
      );
      rethrow;
    }
  }
}
