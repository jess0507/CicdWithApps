import 'package:fimber/fimber.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maio_photos/hive/config/box_name.dart';

class HiveLocalStorage<T> {
  final BoxName boxName;
  String get name => boxName.name;
  Box get box => Hive.box(name);

  HiveLocalStorage({required this.boxName});

  Future<void> update({required int key, required T value}) async {
    await box.put(key, value);
    final json = {'boxName': boxName, 'event': 'update', 'key': key}.toString();
    Fimber.d(json);
  }

  Future<void> updateAll({required Map<int, T> entries}) async {
    await box.putAll(entries);
    final json = {
      'boxName': boxName,
      'event': 'updateAll',
      'size': entries.length
    }.toString();
    Fimber.d(json);
  }

  Future<T> query({required int key}) {
    final value = box.get(key);
    final json =
        {'boxName': boxName, 'event': 'query', 'value': key}.toString();
    Fimber.d(json);
    return value;
  }

  List<T> queryAll() {
    final result = box.values.cast<T>().toList();
    final json = {
      'boxName': boxName,
      'event': 'queryAll',
      'size': result.length
    }.toString();
    Fimber.d(json);
    return result;
  }

  Future<void> delete({required int key}) async {
    await box.delete(key);
    final json = {'boxName': boxName, 'event': 'delete', 'key': key}.toString();
    Fimber.d(json);
  }

  Stream<List<T>> watchList() {
    final result = box.watch().map((event) => box.values.cast<T>().toList());
    final json = {
      'boxName': boxName,
      'event': 'watchList',
      'value': result.length,
    }.toString();
    Fimber.d(json);
    return result;
  }
}
