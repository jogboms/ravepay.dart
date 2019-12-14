import 'package:ravepay/src/constants/endpoints.dart';
import 'package:ravepay/src/models/bank.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/response.dart';

class Banks {
  Banks() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<Response<List<Bank>>> fetch() async {
    final _response = Response<List<Bank>>(
      await _http.get(Endpoints.getBanks),
      onTransform: (dynamic data, _) => Model.generator<Bank, Map<String, dynamic>>(data, Bank.fromJson),
    );

    Log().debug('Banks.fetch() -> Response', _response);

    return _response;
  }
}
