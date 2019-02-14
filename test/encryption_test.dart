import 'package:ravepay/src/encryption.dart';
import 'package:test/test.dart';

const PUBK = "FLWPUBK-e634d14d9ded04eaf05d5b63a0a06d2f-X";
const SECK = "FLWSECK-bb971402072265fb156e90a3578fe5e6-X";
const RAW_DATA = <String, int>{"a": 1, "b": 2, "c": 3};
const ENCRYPTED_DATA = 'tGXfuhcyL46cVsynJ79v+w==';
const GENERATED_KEY = 'bb9714020722eb4cf7a169f2';
const GENERATED_INTEGRITY_HASH = '01a9467aee23fa8988a0968bcf04b534c8a0c67ee97e2bcd61c0e90e72cf1699';

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
