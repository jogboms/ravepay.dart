import 'package:ravepay/src/models/main.dart';

class Meta extends Model {
  Meta(
    this.metaname,
    this.metavalue,
  );

  final String metaname;
  final String metavalue;

  @override
  Map<String, String> toMap() {
    return <String, String>{
      "metaname": metaname,
      "metavalue": metavalue,
    };
  }
}
