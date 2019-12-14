import 'package:ravepay/ravepay.dart';

const PUBK = 'FLWPUBK-e8c4f36df52a58eac2033b76c8c58432-X';
const SECK = 'FLWSECK-b42f2eacd6b92bda2f560c7e85b41cfd-X';

void init() {
  Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK, useLogger: true);
}
