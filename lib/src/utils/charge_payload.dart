import 'dart:convert' show json;

import 'package:ravepay/src/rave.dart';

class Keys {
  Keys._();

  static const String PublicKey = "PBFPubKey";
  static const String Currency = "currency";
  static const String Country = "country";
  static const String TxRef = "txRef";
  static const String Amount = "amount";
  static const String PaymentType = "paymentType";
  static const String Email = "email";
  static const String Firstname = "firstname";
  static const String Lastname = "lastname";
  static const String Meta = "meta";
  static const String SuggestedAuth = "suggested_auth";
}

class Payload {
  Payload() {
    add(Keys.PublicKey, Rave().publicKey);
    add(Keys.TxRef,
        "txref-" + DateTime.now().millisecondsSinceEpoch.toString());
  }

  final Map<String, dynamic> _hashMap = <String, dynamic>{};

  void add(String key, dynamic value) => _hashMap.putIfAbsent(key, () => value);

  Map<String, dynamic> toMap() => _hashMap;

  @override
  String toString() => json.encode(_hashMap);
}
