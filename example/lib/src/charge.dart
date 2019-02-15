import 'package:ravepay/ravepay.dart';

void main() async {
  final charge = Charge.card(
    amount: '2000',
    cardno: '5438898014560229',
    cvv: '890',
    email: 'jeremiahogbomo@gmail.com',
    expirymonth: '12',
    expiryyear: '21',
    firstname: "Jeremiah",
    lastname: "Ogbomo",
    meta: [Meta("hello", "world")],
  );

  final res = await charge.charge();

  print(res);
}
