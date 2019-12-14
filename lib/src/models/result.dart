library result;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/constants/auth.dart';
import 'package:ravepay/src/models/customer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'result.g.dart';

abstract class Result with ModelInterface implements Built<Result, ResultBuilder> {
  Result._();

  factory Result([void Function(ResultBuilder b) updates]) = _$Result;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(compare: false)
  String get txRef;

  @nullable
  @BuiltValueField(compare: false)
  String get orderRef;

  @nullable
  @BuiltValueField(compare: false)
  String get flwRef;

  @nullable
  @BuiltValueField(compare: false)
  String get redirectUrl;

  @nullable
  @BuiltValueField(wireName: 'device_fingerprint', compare: false)
  String get deviceFingerprint;

  @nullable
  @BuiltValueField(wireName: 'settlement_token', compare: false)
  String get settlementToken;

  @nullable
  @BuiltValueField(compare: false)
  String get cycle;

  @nullable
  @BuiltValueField(compare: false)
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'charged_amount', compare: false)
  double get chargedAmount;

  @nullable
  @BuiltValueField(compare: false)
  double get appfee;

  @nullable
  @BuiltValueField(compare: false)
  double get merchantfee;

  @nullable
  @BuiltValueField(compare: false)
  double get merchantbearsfee;

  @nullable
  @BuiltValueField(compare: false)
  String get chargeResponseCode;

  @nullable
  @BuiltValueField(compare: false)
  String get raveRef;

  @nullable
  @BuiltValueField(compare: false)
  String get chargeResponseMessage;

  @nullable
  @BuiltValueField(compare: false)
  String get authModelUsed;

  @nullable
  @BuiltValueField(compare: false)
  String get currency;

  @nullable
  @BuiltValueField(wireName: 'IP', compare: false)
  String get iP;

  @nullable
  @BuiltValueField(compare: false)
  String get narration;

  @nullable
  @BuiltValueField(compare: false)
  String get status;

  @nullable
  @BuiltValueField(compare: false)
  String get modalauditid;

  @nullable
  @BuiltValueField(compare: false)
  String get vbvrespmessage;

  @nullable
  @BuiltValueField(wireName: 'authurl', compare: false)
  String get invalidAuthUrl;

  @nullable
  @BuiltValueField(compare: false)
  String get vbvrespcode;

  @nullable
  @BuiltValueField(compare: false)
  String get acctvalrespmsg;

  @nullable
  @BuiltValueField(compare: false)
  String get acctvalrespcode;

  @nullable
  @BuiltValueField(compare: false)
  String get paymentType;

  @nullable
  @BuiltValueField(compare: false)
  String get paymentPlan;

  @nullable
  @BuiltValueField(compare: false)
  String get paymentPage;

  @nullable
  @BuiltValueField(compare: false)
  String get paymentId;

  @nullable
  @BuiltValueField(wireName: 'fraud_status', compare: false)
  String get fraudStatus;

  @nullable
  @BuiltValueField(wireName: 'charge_type', compare: false)
  String get chargeType;

  @nullable
  @BuiltValueField(wireName: 'is_live', compare: false)
  int get isLive;

  @nullable
  @BuiltValueField(wireName: 'suggested_auth', compare: false)
  String get suggestedAuth;

  @nullable
  @BuiltValueField(compare: false)
  String get createdAt;

  @nullable
  @BuiltValueField(compare: false)
  String get updatedAt;

  @nullable
  @BuiltValueField(compare: false)
  String get deletedAt;

  @nullable
  @BuiltValueField(compare: false)
  int get customerId;

  @nullable
  @BuiltValueField(wireName: 'AccountId', compare: false)
  int get accountId;

  @nullable
  @BuiltValueField(compare: false)
  Customer get customer;

  @nullable
  @BuiltValueField(compare: false)
  bool get customercandosubsequentnoauth;

  @memoized
  bool get requiresValidation =>
      (chargeResponseCode == '02') ||
      (chargeResponseCode == null && suggestedAuth != null && suggestedAuth.toLowerCase() == AuthType.PIN);

  @memoized
  bool get isInternational =>
      chargeResponseCode == null &&
      suggestedAuth != null &&
      (suggestedAuth.toLowerCase() == AuthType.NOAUTH_INTERNATIONAL ||
          suggestedAuth.toLowerCase() == AuthType.AVS_VBVSECURECODE);

  @memoized
  bool get isSuccessful => status.toUpperCase() == 'SUCCESSFUL';

  @memoized
  bool get hasValidReferenceAndTrans => (txRef != null) && (id != null);

  @memoized
  bool get hasValidUrl {
    if (invalidAuthUrl == null || invalidAuthUrl.isEmpty) {
      return false;
    }

    return RegExp(r'^https?://', caseSensitive: false).hasMatch(invalidAuthUrl);
  }

  @memoized
  String get authurl => hasValidUrl ? invalidAuthUrl : null;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(Result.serializer, this);

  static Result fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Result.serializer, map);

  static Serializer<Result> get serializer => _$resultSerializer;
}
