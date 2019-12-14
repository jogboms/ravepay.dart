import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class Api {
  Api()
      : http = HttpWrapper(baseUrl: Ravepay().baseUrl),
        keys = _Keys(Ravepay().publicKey, Ravepay().secretKey);

  final HttpWrapper http;
  final _Keys keys;
}

class _Keys {
  const _Keys(this.public, this.secret);

  final String public;
  final String secret;
}
