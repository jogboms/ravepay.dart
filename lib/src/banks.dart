import 'package:http/http.dart' as http;
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Banks {
  Banks() : _httpClient = HttpWrapper();

  final HttpWrapper _httpClient;

  Future<http.Response> getBanks() {
    return _httpClient.get(Endpoints.getBanks);
  }
}
