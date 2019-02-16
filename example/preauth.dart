import 'package:ravepay/ravepay.dart';

import '../test/_constants.dart';

void preauth() async {
  await PreAuth().preauth(
    cardno: '5840406187553286',
    cvv: '116',
    expirymonth: '12',
    expiryyear: '21',
    amount: '2000',
    email: 'jeremiahogbomo@gmail.com',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    pin: "1111",
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
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
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    pin: "1111",
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
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
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    pin: "1111",
    redirectUrl: "https://rave-web.herokuapp.com/receivepayment",
  );

  await PreAuth().refundCard(_charge.data.flwRef);
}

void main() async {
  Rave.init(production: false, publicKey: PUBK, secretKey: SECK);

  // preauth();
  voidCard();
  // refundCard();
}
