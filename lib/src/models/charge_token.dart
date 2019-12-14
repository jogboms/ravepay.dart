library charge_token;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'charge_token.g.dart';

abstract class ChargeToken with ModelInterface implements Built<ChargeToken, ChargeTokenBuilder> {
  ChargeToken._();

  factory ChargeToken([void Function(ChargeTokenBuilder b) updates]) = _$ChargeToken;

  @BuiltValueField(wireName: 'user_token', compare: false)
  String get userToken;

  @BuiltValueField(wireName: 'embed_token', compare: false)
  String get embedToken;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(ChargeToken.serializer, this);

  static ChargeToken fromJson(Map<String, dynamic> map) => serializers.deserializeWith(ChargeToken.serializer, map);

  static Serializer<ChargeToken> get serializer => _$chargeTokenSerializer;
}
