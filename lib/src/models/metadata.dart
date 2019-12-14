library metadata;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'metadata.g.dart';

abstract class Metadata with ModelInterface implements Built<Metadata, MetadataBuilder> {
  Metadata._();

  factory Metadata([void Function(MetadataBuilder b) updates]) = _$Metadata;

  factory Metadata.named({@required String name, @required String value}) {
    return Metadata((b) => b
      ..name = name
      ..value = value);
  }

  @nullable
  int get id;

  @BuiltValueField(wireName: 'metaname')
  String get name;

  @BuiltValueField(wireName: 'metavalue')
  String get value;

  @nullable
  DateTime get createdAt;

  @nullable
  DateTime get updatedAt;

  @nullable
  String get deletedAt;

  @nullable
  int get getpaidTransactionId;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(Metadata.serializer, this);

  static Metadata fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Metadata.serializer, map);

  static Serializer<Metadata> get serializer => _$metadataSerializer;
}
