library card_token;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'card_token.g.dart';

abstract class CardToken with ModelInterface implements Built<CardToken, CardTokenBuilder> {
  CardToken._();

  factory CardToken([void Function(CardTokenBuilder b) updates]) = _$CardToken;

  @nullable
  String get embedtoken;

  @nullable
  String get shortcode;

  @nullable
  String get expiry;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(CardToken.serializer, this);

  static CardToken fromJson(Map<String, dynamic> map) => serializers.deserializeWith(CardToken.serializer, map);

  static Serializer<CardToken> get serializer => _$cardTokenSerializer;
}
