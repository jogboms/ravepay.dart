import 'package:example_app/_constants.dart';
import 'package:example_app/src/charge.dart' as charge;
import 'package:ravepay/ravepay.dart';

void main() async {
  Rave.init(production: false, publicKey: PUBK, secretKey: SECK);

  charge.main();
}
