library customer;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'customer.g.dart';

abstract class Customer with ModelInterface implements Built<Customer, CustomerBuilder> {
  Customer._();

  factory Customer([void Function(CustomerBuilder b) updates]) = _$Customer;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(compare: false)
  String get phone;

  @nullable
  @BuiltValueField(compare: false)
  String get fullName;

  @nullable
  @BuiltValueField(compare: false)
  String get customertoken;

  @nullable
  @BuiltValueField(compare: false)
  String get email;

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
  @BuiltValueField(wireName: 'AccountId', compare: false)
  int get accountId;

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(Customer.serializer, this);

  static Customer fromJson(Map<String, dynamic> map) => serializers.deserializeWith(Customer.serializer, map);

  static Serializer<Customer> get serializer => _$customerSerializer;
}
