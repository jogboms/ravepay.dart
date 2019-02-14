import 'package:ravepay/src/encryption.dart';
import 'package:test/test.dart';

import '_constants.dart';

void main() {
  group('Grouped Encyption', () {
    const _encryption = const Encryption(secretKey: SECK);

    test('generateKey', () {
      expect(_encryption.generateKey(SECK), GENERATED_KEY);
    });
    test('integrityHash', () {
      expect(_encryption.integrityHash(RAW_DATA), GENERATED_INTEGRITY_HASH);
    });
    test('encrypt', () {
      expect(_encryption.encrypt(RAW_DATA), ENCRYPTED_DATA);
    });
    test('decrypt', () {
      expect(_encryption.decrypt(ENCRYPTED_DATA), RAW_DATA);
    });
  });
}
