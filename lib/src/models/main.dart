abstract class ModelInterface {
  Map<String, dynamic> toJson();

  @override
  String toString() => toJson().toString();
}
