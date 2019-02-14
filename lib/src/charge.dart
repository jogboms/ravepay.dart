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
        _httpClient = HttpWrapper(),
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
      payload: ChargePayload(
        currency: currency,
        country: country,
        txRef: txRef,
        amount: amount,
        paymentType: paymentType,
        email: email,
        firstname: firstname,
        lastname: lastname,
        meta: meta,
      ),
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
      payload: ChargePayload(
        currency: currency,
        country: country,
        txRef: txRef,
        amount: amount,
        paymentType: paymentType,
        email: email,
        firstname: firstname,
        lastname: lastname,
        meta: meta,
        suggestedAuth: "PIN",
      ),
    );
  }

  final HttpWrapper _httpClient;
  final Encryption _encryption;
  final ChargePayload payload;

  Future<http.Response> charge() {
    return _httpClient.post(
      Endpoints.directCharge,
      <String, dynamic>{
        "PBFPubKey": Rave().publicKey,
        "client": _encryption.encrypt(payload.toMap()),
        "alg": Encryption.ALGORITHM,
      },
    );
  }
}
