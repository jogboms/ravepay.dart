import 'dart:convert' show json;

abstract class ModelInterface {
  Map<String, dynamic> toMap();
}

abstract class Model implements ModelInterface {
  static String mapToString(Map<String, dynamic> map) => json.encode(map);

  @override
  String toString() => mapToString(toMap());

  dynamic operator [](String key) => toMap()[key];
}
