library card;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/card_token.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'card.g.dart';

abstract class Card with ModelInterface implements Built<Card, CardBuilder> {
  Card._();

  factory Card([void Function(CardBuilder b) updates]) = _$Card;

  String get expirymonth;

  String get expiryyear;

  String get cardBIN;

  String get last4digits;

  String get brand;

  @BuiltValueField(wireName: 'card_tokens')
  BuiltList<CardToken> get cardTokens;

  @BuiltValueField(wireName: 'life_time_token')
  String get lifeTimeToken;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(Card.serializer, this);

  static Card fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Card.serializer, map);

  static Serializer<Card> get serializer => _$cardSerializer;
}
