// import 'package:example_app/_constants.dart';
import 'package:ravepay/ravepay.dart';

import '_keys.dart';

void fetch() async {
  await Banks().fetch();
}

void main() async {
  Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK);

  fetch();
}
