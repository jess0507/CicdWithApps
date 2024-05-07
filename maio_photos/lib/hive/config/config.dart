import 'package:fimber/fimber.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/db/entity/photo.dart';
import 'box_name.dart';

Future<void> initialHive() async {
  await Hive.initFlutter();
  registerHiveAdapters();
  await openHiveBoxs().catchError((e, s) {
    Fimber.e('Cannot open hive', ex: e, stacktrace: s);
  });
}

void registerHiveAdapters() {
  Hive.registerAdapter(PhotoAdapter());
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
