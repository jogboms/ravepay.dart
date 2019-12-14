import 'package:meta/meta.dart';
import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Tokenize extends Api {
  // TODO
  Future<Response<dynamic>> _charge(
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
  }) async {
    assert(amount != null);
    assert(email != null);
    assert(iP != null);
    assert(txRef != null);

    final payload = <String, dynamic>{
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
    };

    Log().debug('$runtimeType.charge()', payload);

    final _response = Response<dynamic>(
      await http.post(url, payload),
      onTransform: (dynamic data, _) => data,
    );

    Log().debug('$runtimeType._charge() -> Response', _response);

    return _response;
  }

  Future<Response> card({
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

  Future<Response> account({
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
