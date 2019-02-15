import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/charge.dart';
import 'package:ravepay/src/constants/countries.dart';
import 'package:ravepay/src/constants/currencies.dart';
import 'package:ravepay/src/models/meta.dart';
import 'package:ravepay/src/models/response.dart';
import 'package:ravepay/src/models/result.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';

class PreAuth {
  PreAuth() : _http = HttpWrapper();

  final HttpWrapper _http;

  Future<Response<Result>> preauth({
    @required String cardno,
    @required String cvv,
    @required String amount,
    @required String expiryyear,
    @required String expirymonth,
    @required String email,
    @required String chargeType,
    String country = Countries.NIGERIA,
    String currency = Currencies.NAIRA,
    String suggestedAuth,
    String txRef,
    String iP,
    String settlementToken,
    String phonenumber,
    String billingzip,
    String firstname,
    String lastname,
    String narration,
    List<Meta> meta,
    String pin,
    String bvn,
    String deviceFingerprint,
    String recurringStop,
    bool includeIntegrityHash,
  }) {
    assert(cardno != null);
    assert(cvv != null);
    assert(amount != null);
    assert(expiryyear != null);
    assert(expirymonth != null);
    assert(email != null);
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
      includeIntegrityHash: includeIntegrityHash,
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
