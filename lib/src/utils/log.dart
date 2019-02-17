class Log {
  factory Log() => _instance;

  Log._(this.production);

  static void init([bool production = false]) => _instance = Log._(production);

  static Log _instance;

  final bool production;

  void debug(String tag, [dynamic payload]) {
    if (!production) {
      print('\n= $tag ===============\n');
      if (payload != null) {
        print(payload);
        print('\n==========================\n');
      }
    }
  }

  void error(String tag, [dynamic payload]) {
    if (!production) {
      print('\n* $tag ***************\n');
      if (payload != null) {
        print(payload);
        print('\n**************************\n');
      }
    }
  }
}
