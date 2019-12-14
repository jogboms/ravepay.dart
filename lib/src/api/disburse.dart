import 'package:meta/meta.dart';
import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Disburse extends Api {
  Future<Response<dynamic>> disburse({
    @required String bankCode,
    @required String accountNumber,
    @required String currency,
    @required String amount,
  }) async {
    assert(bankCode != null);
    assert(accountNumber != null);
    assert(currency != null);
    assert(amount != null);

    final payload = {
      'seckey': keys.secret,
      'bank_code': bankCode,
      'account_number': accountNumber,
      'currency': currency,
      'amount': amount,
    };

    Log().debug('$runtimeType.disburse()', payload);

    final _response = Response<dynamic>(
      await http.post(Endpoints.disburse, payload),
      onTransform: (dynamic data, _) => data,
    );

    Log().debug('$runtimeType.disburse() -> Response', _response);

    return _response;
  }
}
