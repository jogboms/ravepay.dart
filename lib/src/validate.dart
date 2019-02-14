import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Validate {
  Validate() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> card({
    @required String txRef,
    @required String otp,
  }) {
    assert(txRef != null);
    return _http.post(
      Endpoints.validateCardCharge,
      <String, dynamic>{
        'PBFPubKey': Rave().publicKey,
        'transaction_reference': txRef,
        'otp': otp,
      },
    );
  }

  Future<http.Response> account({
    @required String txRef,
    @required String otp,
  }) {
    return _http.post(
      Endpoints.validateAccountCharge,
      <String, dynamic>{
        'PBFPubKey': Rave().publicKey,
        'transactionreference': txRef,
        'otp': otp,
      },
    );
  }
}
