class Endpoints {
  Endpoints._();

  static const String _base = "flwv3-pug/getpaidx/api";

  static const String directCharge = "$_base/charge";
  static const String validateCardCharge = "/$_base/validatecharge";
  static const String validateAccountCharge = "/$_base/validate";
  static const String getBanks = "/$_base/flwpbf-banks.js?json=1";
  static const String requeryTransaction = "/$_base/verify";
  static const String xRequeryTransaction = "/$_base/xrequery";
  static const String capturePreauthorizeCard = "/$_base/capture";
  static const String refundOrVoidPreauthorization = "/$_base/refundorvoid";
  static const String getFees = "/$_base/fee";
  static const String refundTransaction = "/gpx/merchant/transactions/refund";
  static const String convertCurrency = "/$_base/forex";
}
