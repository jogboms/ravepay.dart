import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ravepay/src/models/card.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/models/metadata.dart';
import 'package:ravepay/src/models/serializers.dart';

part 'verify_result.g.dart';

abstract class VerifyResult with ModelInterface implements Built<VerifyResult, VerifyResultBuilder> {
  factory VerifyResult([void Function(VerifyResultBuilder b) updates]) = _$VerifyResult;

  VerifyResult._();

  int get txid;

  String get txref;

  String get flwref;

  String get devicefingerprint;

  String get cycle;

  double get amount;

  String get currency;

  double get chargedamount;

  double get appfee;

  double get merchantfee;

  double get merchantbearsfee;

  String get chargecode;

  String get chargemessage;

  String get authmodel;

  String get ip;

  String get narration;

  String get status;

  String get vbvcode;

  String get vbvmessage;

  String get authurl;

  @nullable
  String get acctcode;

  @nullable
  String get acctmessage;

  String get paymenttype;

  String get paymentid;

  String get fraudstatus;

  String get chargetype;

  int get createdday;

  String get createddayname;

  int get createdweek;

  int get createdmonth;

  String get createdmonthname;

  int get createdquarter;

  int get createdyear;

  bool get createdyearisleap;

  int get createddayispublicholiday;

  int get createdhour;

  int get createdminute;

  String get createdpmam;

  String get created;

  int get customerid;

  @nullable
  String get custphone;

  String get custnetworkprovider;

  String get custname;

  String get custemail;

  String get custemailprovider;

  String get custcreated;

  int get accountid;

  String get acctbusinessname;

  String get acctcontactperson;

  String get acctcountry;

  int get acctbearsfeeattransactiontime;

  int get acctparent;

  String get acctvpcmerchant;

  @nullable
  String get acctalias;

  int get acctisliveapproved;

  String get orderref;

  @nullable
  String get paymentplan;

  @nullable
  String get paymentpage;

  String get raveref;

  Card get card;

  BuiltList<Metadata> get meta;

  bool get isSuccessful => status == 'successful';

  @override
  Map<String, dynamic> toJson() => serializers.serializeWith(VerifyResult.serializer, this);

  static VerifyResult fromJson(Map<String, dynamic> map) => serializers.deserializeWith(VerifyResult.serializer, map);

  static Serializer<VerifyResult> get serializer => _$verifyResultSerializer;
}
