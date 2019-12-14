# 💳 RavePay Dart SDK

[![Build Status - Travis](https://travis-ci.org/jogboms/ravepay.dart.svg?branch=master)](https://travis-ci.org/jogboms/ravepay.dart) [![codecov](https://codecov.io/gh/jogboms/ravepay.dart/branch/master/graph/badge.svg)](https://codecov.io/gh/jogboms/ravepay.dart)

## Installing

```yaml
dependencies:
  ravepay: "^0.0.1+1"
```

## Import

```dart
import 'package:ravepay/ravepay.dart';
```

## Usage

```dart
import 'package:ravepay/ravepay.dart';

main() {
  Ravepay.init(production: false, publicKey: "PUBK_TEST", secretKey: "SECK_TEST");
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/jogboms/ravepay.dart/issues/new

## License

MIT License