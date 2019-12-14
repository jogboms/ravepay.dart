import 'package:ravepay/ravepay.dart';

import '_keys.dart';

void init() {
  Ravepay.init(production: true, publicKey: PUBK, secretKey: SECK, useLogger: true);
//  Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK);
}
