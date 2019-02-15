import 'package:ravepay/src/models/main.dart';

class Meta extends Model {
  Meta(this.name, this.value);

  final String name;
  final String value;

  @override
  Map<String, String> toMap() {
    return <String, String>{
      "metaname": name,
      "metavalue": value,
    };
  }
}
