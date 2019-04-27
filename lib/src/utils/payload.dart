import 'dart:convert' show json;

import 'package:meta/meta.dart';
import 'package:ravepay/src/ravepay.dart';

typedef dynamic PayloadBuilder(Map<String, dynamic> params);

class Keys {
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
  static const String IntegrityHash = "integrity_hash";
  static const String IncludeIntegrityHash = "include_integrity_hash";
  static const String Accountbank = "accountbank";
  static const String Accountnumber = "accountnumber";
  static const String OrderRef = "orderRef";
  static const String Payment_Type = "payment_type";
  static const String IsInternetBanking = "is_internet_banking";
  static const String IsUssd = "is_ussd";
  static const String IsMpesa = 'is_mpesa';
  static const String IsQr = 'is_qr';
  static const String IsMcash = 'is_mcash';
  static const String RedirectUrl = 'redirect_url';
  static const String QueryStringData = 'QUERY_STRING_DATA';
}

class Payload {
  Payload() {
    add(Keys.PublicKey, Ravepay().publicKey);
    add(Keys.TxRef, 'txref-${DateTime.now().millisecondsSinceEpoch}');
  }

  @visibleForTesting
  final Map<String, dynamic> hashMap = <String, dynamic>{};

  Payload add(String key, dynamic value) {
    if (value != null) {
      hashMap.containsKey(key)
          ? hashMap[key] = value
          : hashMap.putIfAbsent(key, () => value);
    }
    return this;
  }

  void addBuilder(String key, PayloadBuilder builder) =>
      add(key, builder(toMap()));

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
