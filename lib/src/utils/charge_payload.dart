import 'dart:convert' show json;

import 'package:ravepay/src/rave.dart';

class ChargePayload {
  ChargePayload({
    this.currency = "NGN",
    this.country = "NG",
    String txRef,
    this.amount,
    this.paymentType,
    this.email,
    this.firstname,
    this.lastname,
    this.meta,
    this.suggestedAuth,
  })  : assert(currency != null),
        assert(country != null),
        this.txRef = txRef ??
            "txref-" + DateTime.now().millisecondsSinceEpoch.toString();

  String currency;
  String country;
  String txRef;
  String amount;
  String paymentType;
  String email;
  String firstname;
  String lastname;
  String meta;
  String suggestedAuth;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PBFPubKey': Rave().publicKey,
      'currency': currency,
      'country': country,
      'txRef': txRef,
      'amount': amount,
      'paymentType': paymentType,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'meta': meta,
      'suggested_auth': suggestedAuth,
    };
  }

  @override
  String toString() {
    return json.encode(toMap());
  }
}
