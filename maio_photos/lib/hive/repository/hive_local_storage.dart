import 'package:hive_flutter/hive_flutter.dart';
import 'package:maio_photos/hive/config/box_name.dart';

class HiveLocalStorage<T> {
  final BoxName boxName;
  String get name => boxName.name;
  Box get box => Hive.box(name);

  HiveLocalStorage({required this.boxName});

  Future<void> add({required T value}) async {
    await box.add(value);
  }

  Future<void> addAll({required List<T> list}) async {
    await box.addAll(list);
  }

  Future<void> update({required int key, required T value}) async {
    await box.put(key, value);
  }

  Future<void> updateAll({required Map<int, T> entries}) async {
    await box.putAll(entries);
  }

  Future<T> query({required int key}) {
    return box.get(key);
  }

  List<T> queryAll() {
    return box.values.cast<T>().toList();
  }

  Future<void> delete({required int key}) async {
    await box.delete(key);
  }

  Stream<List<T>> watchList() {
    return box.watch().map((event) => box.values.cast<T>().toList());
  }
}
