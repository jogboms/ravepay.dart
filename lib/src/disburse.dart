import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Disburse {
  Disburse() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> disburse({
    @required String bankCode,
    @required String accountNumber,
    @required String currency,
    @required String amount,
  }) {
    assert(bankCode != null);
    assert(accountNumber != null);
    assert(currency != null);
    assert(amount != null);
    return _http.post(
      Endpoints.disburse,
      <String, dynamic>{
        'seckey': Ravepay().secretKey,
        'bank_code': bankCode,
        'account_number': accountNumber,
        'currency': currency,
        'amount': amount,
      },
    );
  }
}
