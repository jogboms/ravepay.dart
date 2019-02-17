import 'dart:convert';
import 'dart:io';

import 'package:ravepay/src/utils/log.dart';
import 'package:test/test.dart';

String readInputSync({Encoding encoding = systemEncoding}) {
  final List input = [];
  while (true) {
    int byte = stdin.readByteSync();
    if (byte < 0) {
      if (input.isEmpty) return null;
      break;
    }
    input.add(byte);
  }
  return encoding.decode(input);
}

void main() {
  group('Log', () {
    setUp(() => Log.init(false));

    test('-> Single Instance', () => expect(Log(), same(Log())));
    test('-> generator dev', () {
      final truthy = Log().generator("=", "Tag").contains("= Tag");
      expect(truthy, isTrue);
    });
    test('-> generator prod', () {
      Log.init(true);
      final truthy = Log().generator("=", "Tag").isEmpty;
      expect(truthy, isTrue);
    });
    test('-> generator w/ payload', () {
      final truthy = Log().generator("=", "Tag", "Payload").contains("Payload");
      expect(truthy, isTrue);
    });
    test('-> debug', () {
      final truthy = Log().debug("Tag").contains("= Tag");
      expect(truthy, isTrue);
    });
    test('-> error', () {
      final truthy = Log().error("Tag").contains("* Tag");
      expect(truthy, isTrue);
    });
  });
}
