import 'package:meta/meta.dart';
import 'package:ravepay/src/utils/log.dart';

class Ravepay {
  factory Ravepay() {
    assert(_instance != null,
        'Please make sure to call Ravepay.init() at the top of your app or before using the other functions.');
    return _instance;
  }

  Ravepay._({
    @required this.publicKey,
    @required this.secretKey,
    @required this.production,
  }) : baseUrl = production ? PROD_BASE_UI : STAGING_BASE_UI;

  @visibleForTesting
  static void reset() {
    _instance = null;
  }

  static void init({
    @required String publicKey,
    @required String secretKey,
    @required bool production,
  }) {
    assert(publicKey != null);
    assert(secretKey != null);
    assert(production != null);
    assert(_instance == null,
        'Are you trying to reset the previous keys by calling Ravepay.init() again?.');
    _instance = Ravepay._(
      publicKey: publicKey,
      secretKey: secretKey,
      production: production,
    );
    // Initialize logger
    Log.init(production);
  }

  static Ravepay _instance;
  static const PROD_BASE_UI = "https://api.ravepay.co/";
  static const STAGING_BASE_UI = "https://ravesandboxapi.flutterwave.com/";

  final String publicKey;
  final String secretKey;
  final bool production;
  final String baseUrl;

  @override
  String toString() {
    return 'Rave(publicKey: $publicKey, secretKey: $secretKey, production: $production, baseUrl: $baseUrl)';
  }
}
