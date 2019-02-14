import 'package:ravepay/src/rave.dart';
import 'package:test/test.dart';

import '_constants.dart';
import '_utils.dart';

void main() {
  group('Grouped Rave', () {
    group('Grouped Truthy', () {
      Rave.init(production: true, publicKey: PUBK, secretKey: SECK);

      test('production', () => expect(Rave().production, true));
      test('publicKey', () => expect(Rave().publicKey, PUBK));
      test('secretKey', () => expect(Rave().secretKey, SECK));
      test('baseUrl', () => expect(Rave().baseUrl, Rave.PROD_BASE_UI));
    });

    group('Grouped BaseUrl', () {
      test('production', () {
        Rave.reset();
        Rave.init(production: true, publicKey: PUBK, secretKey: SECK);
        expect(Rave().baseUrl, Rave.PROD_BASE_UI);
      });
      test('staging', () {
        Rave.reset();
        Rave.init(production: false, publicKey: PUBK, secretKey: SECK);
        expect(Rave().baseUrl, Rave.STAGING_BASE_UI);
      });
    });

    group('Grouped Assertions', () {
      test('No init/reset', () {
        Rave.reset();
        expect(() => Rave().secretKey, throwsAssertionError);
      });

      test('Multiple init', () {
        expect(
          () {
            Rave.init(production: true, publicKey: PUBK, secretKey: SECK);
            Rave.init(production: true, publicKey: PUBK, secretKey: SECK);
          },
          throwsAssertionError,
        );
      });

      test('production = null', () {
        expect(
          () => Rave.init(production: null, publicKey: PUBK, secretKey: SECK),
          throwsAssertionError,
        );
      });
      test('publicKey = null', () {
        expect(
          () => Rave.init(production: true, publicKey: null, secretKey: SECK),
          throwsAssertionError,
        );
      });
      test('secretKey = null', () {
        expect(
          () => Rave.init(production: true, publicKey: PUBK, secretKey: null),
          throwsAssertionError,
        );
      });
    });
  });
}
