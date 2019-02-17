// import 'package:example_app/_constants.dart';
import 'package:ravepay/ravepay.dart';

import '../test/_constants.dart';

void fetch() async {
  await Banks().fetch();
}

void main() async {
  Rave.init(production: false, publicKey: PUBK, secretKey: SECK);

  fetch();
}
