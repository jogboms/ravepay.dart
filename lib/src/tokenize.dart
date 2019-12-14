import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Tokenize {
  Tokenize() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> _charge(
    String url, {
    @required String amount,
    @required String email,
    @required String iP,
    @required String txRef,
    String token,
    String currency,
    String country,
    String firstname,
    String lastname,
    String narration,
    String meta,
    String deviceFingerprint,
  }) {
    assert(amount != null);
    assert(email != null);
    assert(iP != null);
    assert(txRef != null);
    return _http.post(
      url,
      <String, dynamic>{
        'SECKEY': Ravepay().secretKey,
        'token': token,
        'currency': currency,
        'country': country,
        'amount': amount,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'IP': iP,
        'narration': narration,
        'txRef': txRef,
        'meta': meta,
        'device_fingerprint': deviceFingerprint,
      },
    );
  }

  Future<http.Response> card({
    @required String amount,
    @required String email,
    @required String iP,
    @required String txRef,
    String token,
    String currency,
    String country,
    String firstname,
    String lastname,
    String narration,
    String meta,
    String deviceFingerprint,
  }) {
    return _charge(
      Endpoints.tokenizeCard,
      amount: amount,
      email: email,
      iP: iP,
      txRef: txRef,
      token: token,
      currency: currency,
      country: country,
      firstname: firstname,
      lastname: lastname,
      narration: narration,
      meta: meta,
      deviceFingerprint: deviceFingerprint,
    );
  }

  Future<http.Response> account({
    @required String amount,
    @required String email,
    @required String iP,
    @required String txRef,
    String token,
    String currency,
    String country,
    String firstname,
    String lastname,
    String narration,
    String meta,
    String deviceFingerprint,
  }) {
    return _charge(
      Endpoints.tokenizeAccount,
      amount: amount,
      email: email,
      iP: iP,
      txRef: txRef,
      token: token,
      currency: currency,
      country: country,
      firstname: firstname,
      lastname: lastname,
      narration: narration,
      meta: meta,
      deviceFingerprint: deviceFingerprint,
    );
  }
}
