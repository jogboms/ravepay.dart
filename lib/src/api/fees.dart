import 'package:meta/meta.dart';
import 'package:ravepay/src/api/api.dart';
import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Fees extends Api {
  // TODO
  Future<Response<dynamic>> card({
    @required String amount,
    @required String currency,
    @required String card6,
  }) async {
    assert(amount != null);
    assert(currency != null);
    assert(card6 != null);

    final payload = <String, dynamic>{
      'PBFPubKey': Ravepay().publicKey,
      'amount': amount,
      'currency': currency,
      'card6': card6,
    };

    Log().debug('$runtimeType.card()', payload);

    final _response = Response<dynamic>(
      await http.post(Endpoints.getFees, payload),
      onTransform: (dynamic data, _) => data,
    );

    Log().debug('$runtimeType.card() -> Response', _response);

    return _response;
  }

  // TODO
  Future<Response<dynamic>> account({
    @required String amount,
    @required String currency,
    int ptype,
  }) async {
    assert(amount != null);
    assert(currency != null);

    final payload = <String, dynamic>{
      'PBFPubKey': Ravepay().publicKey,
      'amount': amount,
      'currency': currency,
      'ptype': ptype ?? 2
    };

    Log().debug('$runtimeType.account()', payload);

    final _response = Response<dynamic>(
      await http.post(Endpoints.getFees, payload),
      onTransform: (dynamic data, _) => data,
    );

    Log().debug('$runtimeType.account() -> Response', _response);

    return _response;
  }
}
