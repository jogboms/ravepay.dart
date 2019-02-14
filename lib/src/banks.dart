import 'package:http/http.dart' as http;
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Banks {
  Banks() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> getBanks() {
    return _http.get(Endpoints.getBanks);
  }
}
