import 'package:http/http.dart' as http;
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Transactions {
  Transactions() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> verify({
    String flwRef,
    String txRef,
  }) {
    assert(!(flwRef == null && txRef == null),
        'You must pass either flwRef or txRef');
    return _http.post(
      Endpoints.verifyTransaction,
      <String, dynamic>{
        'SECKEY': Ravepay().secretKey,
        'flwref': flwRef,
        'txref': txRef,
      },
    );
  }

  Future<http.Response> requery({
    String flwRef,
    String txRef,
    String lastAttempt,
    String onlySuccessful,
  }) {
    assert(!(flwRef == null && txRef == null),
        'You must pass either flwRef or txRef');
    return _http.post(
      Endpoints.requeryTransaction,
      <String, dynamic>{
        'SECKEY': Ravepay().secretKey,
        'flwref': flwRef,
        'txref': txRef,
        'last_attempt': lastAttempt,
        'only_successful': onlySuccessful,
      },
    );
  }
}
