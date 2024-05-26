import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:meep_todo/model/data_model.dart';

abstract class JsonTestModel<T extends DataModelMixin> {
  String get trainString;
  Map<String, dynamic> get mapData => jsonDecode(trainString);
  String get jsonData => jsonEncode(jsonDecode(trainString));

  createModel();
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toMap(T model) => model.toJson();

  void runTests() {
    test('$runtimeType should be converted from JSON string.', () {
      final T model = createModel();
      final json = jsonEncode(model);
      final pureMap = jsonDecode(json);
      expect(pureMap, mapData);
    });

    test('$runtimeType should convert to JSON string.', () {
      final model = createModel();
      final String jsonString = jsonEncode(toMap(model));
      expect(jsonString, jsonData);
    });
  }
}
