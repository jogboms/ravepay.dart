import 'dart:convert' show json, utf8;

import 'package:crypto/crypto.dart' show md5;
import 'package:meta/meta.dart' show required, visibleForTesting;
import 'package:tripledes/tripledes.dart' show BlockCipher, DESEngine;

class Encryption {
  const Encryption({
    @required this.secretKey,
  });

  static const String _target = "FLWSECK-";
  static const int _sub_string_length = 12;

  final String secretKey;

  String encrypt({
    @required Map<String, dynamic> data,
  }) {
    return BlockCipher(
      DESEngine(),
      generateKey(secretKey),
    ).encodeB64(
      json.encode(data),
    );
  }

  Map<String, dynamic> decrypt({
    @required String data,
  }) {
    final String _data = BlockCipher(
      DESEngine(),
      generateKey(secretKey),
    ).decodeB64(data);
    return json.decode(_data);
  }

  @visibleForTesting
  String generateKey(String seckey) {
    final String keymd5 = utf8.decode(
      md5.convert(utf8.encode(seckey)).bytes,
      allowMalformed: true,
    );
    final String keymd5last12 = keymd5.substring(
      keymd5.length - _sub_string_length,
      keymd5.length,
    );

    return seckey.replaceAll(_target, '').substring(0, _sub_string_length) +
        keymd5last12;
  }
}
