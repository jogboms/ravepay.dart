import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/payload.dart';
import 'package:test/test.dart';

import '_constants.dart';

const String Key = 'Hey';

void main() {
  setUp(() => Rave.init(production: true, publicKey: PUBK, secretKey: SECK));

  tearDown(() => Rave.reset());

  group('Payload', () {
    test('-> empty length', () {
      expect(Payload().length, 2);
    });
    test('-> default keys', () {
      expect(Payload().containsKey(Keys.PublicKey), isTrue);
      expect(Payload().containsKey(Keys.TxRef), isTrue);
    });
    test('-> add length', () {
      final payload = Payload()..add(Key, 20);

      expect(payload.length, 3);
    });
    test('-> add multiple length', () {
      final payload = Payload()
        ..add(Key, 20)
        ..add(Key, 20)
        ..add(Key, 20)
        ..add(Key, 20);

      expect(payload.length, 3);
    });
    test('-> add over write', () {
      final payload = Payload()..add(Key, 20)..add(Key, 25);

      expect(payload.getItem(Key), 25);
    });
    test('-> addBuilder length', () {
      final payload = Payload()..addBuilder(Key, (_) => 20);

      expect(payload.length, 3);
    });
    test('-> add null length', () {
      final payload = Payload()
        ..add(Key, null)
        ..addBuilder(Key, (_) => null);

      expect(payload.length, 2);
    });
    test('-> remove length', () {
      final payload = Payload()
        ..add(Key, 20)
        ..remove(Key);

      expect(payload.length, 2);
    });
    test('-> remove invalid', () {
      final payload = Payload()
        ..add(Key, 20)
        ..remove('Key');

      expect(payload.length, 3);
    });
    test('-> getItem valid', () {
      final dynamic item = Payload().add(Key, 20).getItem(Key);

      expect(item, 20);
    });
    test('-> getItem invalid', () {
      final dynamic item = Payload().add(Key, 20).getItem('Key');

      expect(item, isNull);
    });
    test('-> containsKey valid', () {
      final truthy = Payload().add(Key, 20).containsKey(Key);

      expect(truthy, isTrue);
    });
    test('-> containsKey invalid', () {
      final truthy = Payload().add(Key, 20).containsKey('Key');

      expect(truthy, isFalse);
    });
    test('-> clear length', () {
      expect(Payload().clear().length, isZero);
    });
    test('-> toString', () {
      final string = Payload().clear().add(Keys.TxRef, Keys.TxRef).toString();

      expect(string, '{"${Keys.TxRef}":"${Keys.TxRef}"}');
    });
  });
}
