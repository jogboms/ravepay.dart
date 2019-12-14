class Endpoints {
  static const String _base = 'flwv3-pug/getpaidx/api';

  static const String directCharge = '$_base/charge';
  static const String validateCardCharge = '$_base/validatecharge';
  static const String validateAccountCharge = '$_base/validate';
  static const String getBanks = '$_base/flwpbf-banks.js?json=1';
  static const String verifyTransaction = '$_base/v2/verify';
  // TODO: somehow returns a 404
  static const String requeryTransaction = '$_base/v2/xrequery';
  static const String capturePreauthorizeCard = '$_base/capture';
  static const String refundOrVoidPreauthorization = '$_base/refundorvoid';
  static const String getFees = '$_base/fee';
  static const String disburse = '/merchant/disburse';
  static const String convertCurrency = '$_base/forex';
  static const String tokenizeCard = '$_base/tokenized/charge';
  static const String tokenizeAccount = '$_base/tokenized/account/charge';
}
