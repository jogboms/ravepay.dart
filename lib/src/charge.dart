import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/encryption.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/charge_payload.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Charge {
  Charge({
    @required this.payload,
  })  : assert(payload != null),
        _http = HttpWrapper(),
        _encryption = Encryption(secretKey: Rave().secretKey);

  factory Charge.basic({
    String currency = "NGN",
    String country = "NG",
    String txRef,
    String amount,
    String paymentType,
    String email,
    String firstname,
    String lastname,
    String meta,
  }) {
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Amount, amount)
        ..add(Keys.PaymentType, paymentType)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.Meta, meta),
    );
  }

  factory Charge.pin({
    String currency = "NGN",
    String country = "NG",
    String txRef,
    String amount,
    String paymentType,
    String email,
    String firstname,
    String lastname,
    String meta,
  }) {
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Amount, amount)
        ..add(Keys.PaymentType, paymentType)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.Meta, meta)
        ..add(Keys.SuggestedAuth, "PIN"),
    );
  }

  final HttpWrapper _http;
  final Encryption _encryption;
  final Payload payload;

  Future<http.Response> charge() {
    return _http.post(
      Endpoints.directCharge,
      <String, dynamic>{
        "PBFPubKey": Rave().publicKey,
        "client": _encryption.encrypt(payload.toMap()),
        "alg": Encryption.ALGORITHM,
      },
    );
  }
}
