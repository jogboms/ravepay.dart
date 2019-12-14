import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/metadata.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'charge_param.g.dart';

abstract class ChargeParam with ModelInterface implements Built<ChargeParam, ChargeParamBuilder> {
  factory ChargeParam([void Function(ChargeParamBuilder b) updates]) = _$ChargeParam;

  ChargeParam._();

  String get amount;

  String get email;

  String get firstname;

  String get currency;

  String get country;

  @nullable
  String get lastname;

  @nullable
  String get redirectUrl;

  @nullable
  String get txRef;

  @nullable
  String get suggestedAuth;

  @nullable
  String get iP;

  @nullable
  String get settlementToken;

  @nullable
  String get phonenumber;

  @nullable
  String get billingzip;

  @nullable
  String get narration;

  @nullable
  BuiltList<Metadata> get meta;

  @nullable
  String get bvn;

  @nullable
  String get chargeType;

  @nullable
  String get deviceFingerprint;

  @nullable
  String get recurringStop;

  @nullable
  bool get includeIntegrityHash;

  @nullable
  String get cardno;

  @nullable
  String get cvv;

  @nullable
  String get expiryyear;

  @nullable
  String get expirymonth;

  @nullable
  String get pin;

  @override
  Map<String, dynamic> toMap() => serializers.serializeWith(ChargeParam.serializer, this);

  static ChargeParam fromJson(Map<String, dynamic> map) => serializers.deserializeWith(ChargeParam.serializer, map);

  static Serializer<ChargeParam> get serializer => _$chargeParamSerializer;
}
