library validate_result;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';
import 'package:ravepay/src/models/validate/data.dart';
import 'package:ravepay/src/models/validate/tx.dart';

part 'validate_result.g.dart';

abstract class ValidateResult with ModelInterface implements Built<ValidateResult, ValidateResultBuilder> {
  ValidateResult._();

  factory ValidateResult([void Function(ValidateResultBuilder b) updates]) = _$ValidateResult;

  @BuiltValueField(compare: false)
  Data get data;

  @BuiltValueField(compare: false)
  Tx get tx;

  @nullable
  @BuiltValueField(wireName: 'airtime_flag', compare: false)
  String get airtimeFlag;

  bool get isSuccessful => tx.status == 'successful';

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(ValidateResult.serializer, this);

  static ValidateResult fromJson(Map<String, dynamic> map) =>
      serializers.deserializeWith(ValidateResult.serializer, map);

  static Serializer<ValidateResult> get serializer => _$validateResultSerializer;
}
