import 'package:meta/meta.dart';

class Rave {
  factory Rave() {
    assert(_instance != null,
        'Please make sure to call Rave.init() at the top of your app or before using the other functions.');
    return _instance;
  }

  Rave._({
    @required this.publicKey,
    @required this.secretKey,
    @required this.production,
  })  : assert(publicKey != null),
        assert(secretKey != null),
        assert(production != null);

  static void init({
    @required String publicKey,
    @required String secretKey,
    @required bool production,
  }) {
    assert(_instance != null,
        'Are you trying to reset the previous keys by calling Rave.init() again?.');
    _instance = Rave._(
      publicKey: publicKey,
      secretKey: secretKey,
      production: production,
    );
  }

  static Rave _instance;

  final String publicKey;
  final String secretKey;
  final bool production;
}
