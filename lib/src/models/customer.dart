import 'package:ravepay/src/models/main.dart';

class Customer extends Model {
  Customer({
    this.id,
    this.phone,
    this.fullName,
    this.customertoken,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.accountId,
  });

  Customer.fromJson(Map<String, dynamic> json)
      : id = Model.parseInt(json['id']),
        phone = json['phone'],
        fullName = json['fullName'],
        customertoken = json['customertoken'],
        email = json['email'],
        createdAt = Model.parseTimestamp(json['createdAt']),
        updatedAt = Model.parseTimestamp(json['updatedAt']),
        deletedAt = Model.parseTimestamp(json['deletedAt']),
        accountId = Model.parseInt(json['AccountId']);

  int id;
  dynamic phone;
  String fullName;
  dynamic customertoken;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  int accountId;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'fullName': fullName,
      'customertoken': customertoken,
      'email': email,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'deletedAt': deletedAt.toString(),
      'accountId': accountId,
    };
  }
}
