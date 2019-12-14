import 'package:ravepay/src/rave.dart';
import 'package:test/test.dart';

import '_constants.dart';
import '_utils.dart';

void main() {
  group('Rave', () {
    group('-> Truthy', () {
      setUp(
        () {
          Rave.reset();
          Rave.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
        },
      );

      test('-> production', () => expect(Rave().production, true));
      test('-> publicKey', () => expect(Rave().publicKey, PUBK_TEST));
      test('-> secretKey', () => expect(Rave().secretKey, SECK_TEST));
      test('-> baseUrl', () => expect(Rave().baseUrl, Rave.PROD_BASE_UI));
      test('-> Single Instance', () => expect(Rave(), same(Rave())));
      test('-> toString', () {
        final string = Rave().toString();
        final production = Rave().production;
        final publicKey = Rave().publicKey;
        final secretKey = Rave().secretKey;
        final baseUrl = Rave().baseUrl;

        expect(
          string,
          'Rave(publicKey: $publicKey, secretKey: $secretKey, production: $production, baseUrl: $baseUrl)',
        );
      });
    });

    group('-> BaseUrl', () {
      test('-> production', () {
        Rave.reset();
        Rave.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
        expect(Rave().baseUrl, Rave.PROD_BASE_UI);
      });
      test('-> staging', () {
        Rave.reset();
        Rave.init(production: false, publicKey: PUBK_TEST, secretKey: SECK_TEST);
        expect(Rave().baseUrl, Rave.STAGING_BASE_UI);
      });
    });

    group('-> Assertions', () {
      test('-> No init/reset', () {
        Rave.reset();
        expect(() => Rave().secretKey, throwsAssertionError);
      });

      test('-> Multiple init', () {
        expect(
          () {
            Rave.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
            Rave.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
          },
          throwsAssertionError,
        );
      });

      test('-> production = null', () {
        expect(
          () => Rave.init(production: null, publicKey: PUBK_TEST, secretKey: SECK_TEST),
          throwsAssertionError,
        );
      });
      test('-> publicKey = null', () {
        expect(
          () => Rave.init(production: true, publicKey: null, secretKey: SECK_TEST),
          throwsAssertionError,
        );
      });
      test('-> secretKey = null', () {
        expect(
          () => Rave.init(production: true, publicKey: PUBK_TEST, secretKey: null),
          throwsAssertionError,
        );
      });
    });
  });
}
