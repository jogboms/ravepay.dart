import 'package:meta/meta.dart';
import 'package:ravepay/src/models/main.dart';

class Bank extends Model {
  Bank({
    @required this.bankname,
    @required this.bankcode,
    @required this.internetbanking,
  });

  Bank.fromJson(Map<String, dynamic> json)
      : assert(json != null),
        bankname = json['bankname'],
        bankcode = json['bankcode'],
        internetbanking = json['internetbanking'];

  final String bankname;
  final String bankcode;
  final bool internetbanking;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "bankname": bankname,
      "bankcode": bankcode,
      "internetbanking": internetbanking,
    };
  }
}
