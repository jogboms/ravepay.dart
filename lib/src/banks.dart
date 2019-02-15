import 'package:ravepay/src/models/banks.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/response.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';
import 'package:ravepay/src/utils/log.dart';

class Banks {
  Banks() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<Response<List<Bank>>> fetch() async {
    final _response = Response<List<Bank>>(
      await _http.get(Endpoints.getBanks),
      onTransform: (dynamic data, _) {
        return Model.generator<Bank>(
          data,
          (dynamic bank) => Bank.fromJson(bank),
        );
      },
    );

    Log().debug("Banks.fetch() -> Response", _response);

    return _response;
  }
}
