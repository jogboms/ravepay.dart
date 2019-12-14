import 'package:ravepay/src/constants/url.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:test/test.dart';

import '_constants.dart';
import '_utils.dart';

void main() {
  group('Ravepay', () {
    group('-> Truthy', () {
      setUp(
        () {
          Ravepay.reset();
          Ravepay.init(
            production: true,
            publicKey: PUBK_TEST,
            secretKey: SECK_TEST,
          );
        },
      );

      test('-> production', () => expect(Ravepay().production, true));
      test('-> publicKey', () => expect(Ravepay().publicKey, PUBK_TEST));
      test('-> secretKey', () => expect(Ravepay().secretKey, SECK_TEST));
      test(
        '-> baseUrl',
        () => expect(Ravepay().baseUrl, Url.Prod),
      );

      test(
        '-> productionUrl',
        () => expect(Url.Prod, PROD_BASE_URI),
      );
      test(
        '-> developmentUrl',
        () => expect(Url.Staging, STAGING_BASE_URI),
      );
      test('-> Single Instance', () => expect(Ravepay(), same(Ravepay())));
      test('-> toString', () {
        final string = Ravepay().toString();
        final production = Ravepay().production;
        final publicKey = Ravepay().publicKey;
        final secretKey = Ravepay().secretKey;
        final baseUrl = Ravepay().baseUrl;

        expect(
          string,
          'Ravepay(publicKey: $publicKey, secretKey: $secretKey, production: $production, baseUrl: $baseUrl)',
        );
      });
    });

    group('-> BaseUrl', () {
      test('-> production', () {
        Ravepay.reset();
        Ravepay.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
        expect(Ravepay().baseUrl, Url.Prod);
      });
      test('-> staging', () {
        Ravepay.reset();
        Ravepay.init(production: false, publicKey: PUBK_TEST, secretKey: SECK_TEST);
        expect(Ravepay().baseUrl, Url.Staging);
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
            Ravepay.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
            Ravepay.init(production: true, publicKey: PUBK_TEST, secretKey: SECK_TEST);
          },
          throwsAssertionError,
        );
      });

      test('-> production = null', () {
        expect(
          () => Ravepay.init(production: null, publicKey: PUBK_TEST, secretKey: SECK_TEST),
          throwsAssertionError,
        );
      });
      test('-> publicKey = null', () {
        expect(
          () => Ravepay.init(production: true, publicKey: null, secretKey: SECK_TEST),
          throwsAssertionError,
        );
      });
      test('-> secretKey = null', () {
        expect(
          () => Ravepay.init(production: true, publicKey: PUBK_TEST, secretKey: null),
          throwsAssertionError,
        );
      });
    });
  });
}
