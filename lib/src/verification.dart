import 'package:http/http.dart' as http;
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Verification {
  Verification() : _httpClient = HttpWrapper();

  final HttpWrapper _httpClient;

  Future<http.Response> transaction(String txRef) {
    assert(txRef != null);
    return _httpClient.post(
      Endpoints.requeryTransaction,
      <String, dynamic>{
        'txref': txRef,
        'SECKEY': Rave().secretKey,
      },
    );
  }
}
