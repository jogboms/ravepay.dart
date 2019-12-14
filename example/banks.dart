import 'package:ravepay/ravepay.dart';

import '_bootstrap.dart';

void fetch() async {
  await Banks().fetch();
}

void main() async {
  init();

  fetch();
}
