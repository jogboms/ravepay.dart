import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Api {
  Api() : http = HttpWrapper(baseUrl: Ravepay().baseUrl);

  final HttpWrapper http;
}
