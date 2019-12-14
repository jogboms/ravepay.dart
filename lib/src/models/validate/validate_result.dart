library validate_result;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';
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
  Map<String, dynamic> toMap() => serializers.serializeWith(ValidateResult.serializer, this);

  static ValidateResult fromJson(Map<String, dynamic> map) =>
      serializers.deserializeWith(ValidateResult.serializer, map);

  static Serializer<ValidateResult> get serializer => _$validateResultSerializer;
}

abstract class Data with ModelInterface implements Built<Data, DataBuilder> {
  Data._();

  factory Data([void Function(DataBuilder b) updates]) = _$Data;

  @nullable
  String get responsetoken;

  String get responsecode;

  String get responsemessage;

  @override
  Map<String, dynamic> toMap() => serializers.serializeWith(Data.serializer, this);

  static Data fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Data.serializer, map);

  static Serializer<Data> get serializer => _$dataSerializer;
}
