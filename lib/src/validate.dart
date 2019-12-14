import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Validate {
  Validate() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> card({
    @required String flwRef,
    @required String otp,
  }) {
    assert(flwRef != null);
    return _http.post(
      Endpoints.validateCardCharge,
      <String, dynamic>{
        'PBFPubKey': Ravepay().publicKey,
        'transaction_reference': flwRef,
        'otp': otp,
      },
    );
  }

  Future<http.Response> account({
    @required String flwRef,
    @required String otp,
  }) {
    return _http.post(
      Endpoints.validateAccountCharge,
      <String, dynamic>{
        'PBFPubKey': Ravepay().publicKey,
        'transactionreference': flwRef,
        'otp': otp,
      },
    );
  }
}
