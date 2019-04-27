import 'package:ravepay/ravepay.dart';

import '_keys.dart';
import 'charge.dart' as charge;

void card() async {
  final response = await charge.pin();
  await Validate().card(
    otp: '12345',
    flwRef: response.data.flwRef,
  );
}

void account() async {
  final response = await charge.account();
  await Validate().account(
    otp: '12345',
    flwRef: response.data.flwRef,
  );
}

void main() async {
  Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK);

  card();
}
