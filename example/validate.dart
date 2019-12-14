import 'package:ravepay/ravepay.dart';

import '_bootstrap.dart';
import 'charge.dart' as charge;

Future<Response<ValidateResult>> card() async {
  final response = await charge.pin();
  final resp = await Validate().charge(
    authModelUsed: response.data.authModelUsed,
    otp: '12345',
    flwRef: response.data.flwRef,
    authUrl: response.data.authurl,
  );
  print('isSuccessful:--> ${resp.data.isSuccessful}');
  return resp;
}

Future<Response<ValidateResult>> account() async {
  final response = await charge.account();
  final resp = await Validate().charge(
    authModelUsed: response.data.authModelUsed,
    otp: '12345',
    flwRef: response.data.flwRef,
    authUrl: response.data.authurl,
  );
  return resp;
}

void main() async {
  init();

  try {
    await card();
    // await account();
  } catch (e) {
    print(e);
  }
}
