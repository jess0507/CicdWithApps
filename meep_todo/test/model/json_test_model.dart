import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:meep_todo/model/data_model.dart';

abstract class JsonTestModel<T extends DataModelMixin> {
  String get trainString;
  String get expectString => jsonEncode(jsonDecode(trainString));

  createModel();
  fromJson(String json);
  String toJsonString(T model) => model.toJson();
  Map<String, dynamic> toMap(T model) => model.toMap();

  void runTests() {
    test('$runtimeType should be converted from JSON string.', () {
      final convertedModel = fromJson(expectString);
      expect(createModel().toMap(), convertedModel.toMap());
    });

    test('$runtimeType should convert to JSON string.', () {
      final model = createModel();
      final String toJsonString = model.toJson();
      expect(toJsonString, expectString);
    });
  }
}
