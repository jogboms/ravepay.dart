class Log {
  factory Log() => _instance;

  Log._(this.production);

  static void init([bool production = false]) => _instance = Log._(production);

  static Log _instance;

  final bool production;

  void debug(dynamic payload) {
    if (!production) {
      print(payload);
    }
  }
}
