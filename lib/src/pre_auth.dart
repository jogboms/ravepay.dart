import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/charge.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class PreAuth {
  PreAuth() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<http.Response> preauth({
    @required String cardno,
    String currency,
    String suggestedAuth,
    String country,
    String settlementToken,
    @required String cvv,
    @required String amount,
    String phonenumber,
    String billingzip,
    @required String expiryyear,
    @required String expirymonth,
    @required String email,
    String firstname,
    String lastname,
    @required String iP,
    String narration,
    @required String txRef,
    String meta,
    String pin,
    String bvn,
    @required String chargeType,
    String deviceFingerprint,
    String recurringStop,
  }) {
    assert(cardno != null);
    assert(cvv != null);
    assert(amount != null);
    assert(expiryyear != null);
    assert(expirymonth != null);
    assert(email != null);
    assert(iP != null);
    assert(txRef != null);
    assert(chargeType != null);
    return Charge.preauth(
      cardno: cardno,
      currency: currency,
      suggestedAuth: suggestedAuth,
      country: country,
      settlementToken: settlementToken,
      cvv: cvv,
      amount: amount,
      phonenumber: phonenumber,
      billingzip: billingzip,
      expiryyear: expiryyear,
      expirymonth: expirymonth,
      email: email,
      firstname: firstname,
      lastname: lastname,
      iP: iP,
      narration: narration,
      txRef: txRef,
      meta: meta,
      pin: pin,
      bvn: bvn,
      chargeType: chargeType,
      deviceFingerprint: deviceFingerprint,
      recurringStop: recurringStop,
    ).charge();
  }

  Future<http.Response> _refundOrVoidCard({
    @required String id,
    @required String txRef,
    @required String amount,
    String action,
  }) {
    return _http.post(
      Endpoints.refundOrVoidPreauthorization,
      <String, dynamic>{
        'SECKEY': Rave().secretKey,
        'id': id,
        'ref': txRef,
        'amount': amount,
        'action': action,
      },
    );
  }

  Future<http.Response> voidCard({
    @required String id,
    @required String txRef,
    @required String amount,
    String action,
  }) {
    return _refundOrVoidCard(
      id: id,
      txRef: txRef,
      amount: amount,
      action: action ?? 'void',
    );
  }

  Future<http.Response> refund({
    @required String id,
    @required String txRef,
    @required String amount,
    @required String action,
  }) {
    return _refundOrVoidCard(
      id: id,
      txRef: txRef,
      amount: amount,
      action: action ?? 'refund',
    );
  }

  Future<http.Response> captureCard(String flwRef) {
    return _http.post(
      Endpoints.capturePreauthorizeCard,
      <String, dynamic>{
        'SECKEY': Rave().secretKey,
        'flwRef': flwRef,
      },
    );
  }
}
