import 'package:ravepay/src/encryption.dart';
import 'package:test/test.dart';

import '_constants.dart';

const encryption = const Encryption(secretKey: SECK);

void main() {
  group('Grouped Encyption', () {
    test('generateKey', () {
      final res = encryption.generateKey(SECK);
      expect(res, GENERATED_KEY);
    });
    test('integrityHash', () {
      final res = encryption.integrityHash(RAW_DATA);
      expect(res, GENERATED_INTEGRITY_HASH);
    });
    test('encrypt', () {
      final res = encryption.encrypt(RAW_DATA);
      expect(res, ENCRYPTED_DATA);
    });
    test('decrypt', () {
      final res = encryption.decrypt(ENCRYPTED_DATA);
      expect(res, RAW_DATA);
    });
  });
}
