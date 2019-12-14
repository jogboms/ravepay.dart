library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ravepay/src/models/bank.dart';
import 'package:ravepay/src/models/card.dart';
import 'package:ravepay/src/models/charge_token.dart';
import 'package:ravepay/src/models/customer.dart';
import 'package:ravepay/src/models/metadata.dart';
import 'package:ravepay/src/models/result.dart';
import 'package:ravepay/src/models/validate/tx.dart';
import 'package:ravepay/src/models/validate/validate_result.dart';
import 'package:ravepay/src/models/verify/verify_result.dart';

part 'serializers.g.dart';

@SerializersFor([
  Result,
  VerifyResult,
  Card,
  ValidateResult,
  Bank,
  Metadata,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
