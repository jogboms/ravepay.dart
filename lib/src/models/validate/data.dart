library data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'data.g.dart';

abstract class Data with ModelInterface implements Built<Data, DataBuilder> {
  Data._();

  factory Data([void Function(DataBuilder b) updates]) = _$Data;

  @nullable
  @BuiltValueField(wireName: 'responsetoken', compare: false)
  String get token;

  @BuiltValueField(wireName: 'responsecode', compare: false)
  String get code;

  @BuiltValueField(wireName: 'responsemessage', compare: false)
  String get message;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(Data.serializer, this);

  static Data fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Data.serializer, map);

  static Serializer<Data> get serializer => _$dataSerializer;
}
