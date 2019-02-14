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
  static const String Cardno = "cardno";
  static const String SettlementToken = "settlement_token";
  static const String Cvv = "cvv";
  static const String Phonenumber = "phonenumber";
  static const String Billingzip = "billingzip";
  static const String Expiryyear = "expiryyear";
  static const String Expirymonth = "expirymonth";
  static const String IP = "IP";
  static const String Narration = "narration";
  static const String Pin = "pin";
  static const String Bvn = "bvn";
  static const String ChargeType = "charge_type";
  static const String DeviceFingerprint = "device_fingerprint";
  static const String RecurringStop = "recurring_stop";
  static const String IncludeIntegrityHash = "include_integrity_hash";
  static const String Accountbank = "accountbank";
  static const String Accountnumber = "accountnumber";
  static const String IsUssd = "is_ussd";
  static const String OrderRef = "orderRef";
  static const String Payment_Type = "payment_type";
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
