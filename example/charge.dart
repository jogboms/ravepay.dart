import 'package:ravepay/ravepay.dart';

import '_keys.dart';

// TODO
Future<Response<Result>> card() async {
  final charge = Charge.card(
    amount: '2000',
    cardno: '4556052704172643',
    cvv: '899',
    email: 'jeremiahogbomo@gmail.com',
    expirymonth: '08',
    expiryyear: '21',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    meta: [Meta("hello", "world")],
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
  );

  return await charge.charge();
}

// TODO
Future<Response<Result>> pin() async {
  final charge = Charge.pin(
    cardno: '5438898014560229',
    cvv: '789',
    expirymonth: '12',
    expiryyear: '21',
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    pin: "3310",
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
  );

  return await charge.charge();
}

Future<Response<Result>> account() async {
  final _banks = await Banks().fetch();
  final banks = _banks.data;

  final accessBankCode = banks.first.bankcode;

  final charge = Charge.account(
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    accountbank: accessBankCode,
    accountnumber: '0690000031',
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
  );

  return await charge.charge();
}

Future<Response<Result>> ussd() async {
  final _banks = await Banks().fetch();
  final banks = _banks.data;

  final accessBankCode = banks.first.bankcode;

  final charge = Charge.ussd(
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    accountbank: accessBankCode,
    accountnumber: '0690000031',
    phonenumber: '081245554343',
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
  );

  return await charge.charge();
}

void main() async {
  Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK);

  await card();
  await pin();
  await account();
  await ussd();
}
