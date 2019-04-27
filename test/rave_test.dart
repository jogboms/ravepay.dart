import 'package:ravepay/src/ravepay.dart';
import 'package:test/test.dart';

import '_constants.dart';
import '_utils.dart';

void main() {
  group('Rave', () {
    group('-> Truthy', () {
      setUp(
        () {
          Ravepay.reset();
          Ravepay.init(production: true, publicKey: PUBK, secretKey: SECK);
        },
      );

      test('-> production', () => expect(Ravepay().production, true));
      test('-> publicKey', () => expect(Ravepay().publicKey, PUBK));
      test('-> secretKey', () => expect(Ravepay().secretKey, SECK));
      test('-> baseUrl', () => expect(Ravepay().baseUrl, Ravepay.PROD_BASE_UI));
      test('-> Single Instance', () => expect(Ravepay(), same(Ravepay())));
      test('-> toString', () {
        final string = Ravepay().toString();
        final production = Ravepay().production;
        final publicKey = Ravepay().publicKey;
        final secretKey = Ravepay().secretKey;
        final baseUrl = Ravepay().baseUrl;

        expect(
          string,
          'Rave(publicKey: $publicKey, secretKey: $secretKey, production: $production, baseUrl: $baseUrl)',
        );
      });
    });

    group('-> BaseUrl', () {
      test('-> production', () {
        Ravepay.reset();
        Ravepay.init(production: true, publicKey: PUBK, secretKey: SECK);
        expect(Ravepay().baseUrl, Ravepay.PROD_BASE_UI);
      });
      test('-> staging', () {
        Ravepay.reset();
        Ravepay.init(production: false, publicKey: PUBK, secretKey: SECK);
        expect(Ravepay().baseUrl, Ravepay.STAGING_BASE_UI);
      });
    });

    group('-> Assertions', () {
      test('-> No init/reset', () {
        Ravepay.reset();
        expect(() => Ravepay().secretKey, throwsAssertionError);
      });

      test('-> Multiple init', () {
        expect(
          () {
            Ravepay.init(production: true, publicKey: PUBK, secretKey: SECK);
            Ravepay.init(production: true, publicKey: PUBK, secretKey: SECK);
          },
          throwsAssertionError,
        );
      });

      test('-> production = null', () {
        expect(
          () => Ravepay.init(production: null, publicKey: PUBK, secretKey: SECK),
          throwsAssertionError,
        );
      });
      test('-> publicKey = null', () {
        expect(
          () => Ravepay.init(production: true, publicKey: null, secretKey: SECK),
          throwsAssertionError,
        );
      });
      test('-> secretKey = null', () {
        expect(
          () => Ravepay.init(production: true, publicKey: PUBK, secretKey: null),
          throwsAssertionError,
        );
      });
    });
  });
}
