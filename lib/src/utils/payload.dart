import 'dart:convert' show json;

import 'package:meta/meta.dart';
import 'package:ravepay/src/constants/keys.dart';
import 'package:ravepay/src/ravepay.dart';

typedef PayloadBuilder = dynamic Function(Map<String, dynamic> params);

class Payload {
  Payload() {
    add(Keys.PublicKey, Ravepay().publicKey);
    add(Keys.TxRef, 'txref-${DateTime.now().millisecondsSinceEpoch}');
  }

  @visibleForTesting
  final Map<String, dynamic> hashMap = <String, dynamic>{};

  Payload add(String key, dynamic value) {
    if (value != null) {
      hashMap.containsKey(key) ? hashMap[key] = value : hashMap.putIfAbsent(key, () => value);
    }
    return this;
  }

  void addBuilder(String key, PayloadBuilder builder) => add(key, builder(toMap()));

  Map<String, dynamic> toMap() => hashMap;

  bool containsKey(String key) => toMap().containsKey(key);

  dynamic remove(String key) => toMap().remove(key);

  dynamic getItem(String key) => containsKey(key) == true ? toMap()[key] : null;

  @visibleForTesting
  dynamic clear() {
    hashMap.clear();
    return this;
  }

  @visibleForTesting
  int get length => toMap().length;

  @override
  String toString() => json.encode(toMap());
}
