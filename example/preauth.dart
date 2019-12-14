import 'package:ravepay/ravepay.dart';

import '_bootstrap.dart';

void preauth() async {
  await PreAuth().preauth(
    cardno: '5840406187553286',
    cvv: '116',
    expirymonth: '12',
    expiryyear: '21',
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: 'Jeremiah',
    lastname: 'Ogbomo',
    pin: '1111',
  );
}

void voidCard() async {
  final _charge = await PreAuth().preauth(
    cardno: '5840406187553286',
    cvv: '116',
    expirymonth: '12',
    expiryyear: '21',
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: 'Jeremiah',
    lastname: 'Ogbomo',
    pin: '1111',
  );

  await PreAuth().voidCard(_charge.data.flwRef);
}

void refundCard() async {
  final _charge = await PreAuth().preauth(
    cardno: '5840406187553286',
    cvv: '116',
    expirymonth: '12',
    expiryyear: '21',
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: 'Jeremiah',
    lastname: 'Ogbomo',
    pin: '1111',
  );

  await PreAuth().refundCard(_charge.data.flwRef);
}

void main() async {
  init();

  // preauth();
  voidCard();
  // refundCard();
}
