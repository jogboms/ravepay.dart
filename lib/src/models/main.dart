import 'dart:convert' show json;

abstract class ModelInterface {
  Map<String, dynamic> toMap();

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() => Model.mapToString(toMap());
}

abstract class Model implements ModelInterface {
  Model clone() => null;

  static int parseInt(dynamic value) {
    return int.tryParse(value.toString());
  }

  static double parseDouble(dynamic value) {
    return double.tryParse(value.toString());
  }

  static DateTime parseTimestamp(String timestamp) {
    try {
      return DateTime.tryParse(timestamp);
    } catch (e) {
      return null;
    }
  }

  static List<T> generator<T, U>(List<U> items, T Function(U) cb) {
    return List<T>.generate(
      items != null ? items.length : 0,
      (int index) => cb(items[index]),
    );
  }

  static String mapToString(Map<String, dynamic> map) {
    return json.encode(map);
  }

  static Map<String, dynamic> stringToMap(String string) {
    if (string == null || string.isEmpty) {
      return null;
    }
    try {
      return json.decode(string);
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() => mapToString(toMap());

  dynamic operator [](String key) => toMap()[key];
}
