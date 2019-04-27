import 'package:meta/meta.dart';
import 'package:ravepay/src/charge.dart';
import 'package:ravepay/src/constants/countries.dart';
import 'package:ravepay/src/constants/currencies.dart';
import 'package:ravepay/src/models/meta.dart';
import 'package:ravepay/src/models/response.dart';
import 'package:ravepay/src/models/result.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';
import 'package:ravepay/src/utils/log.dart';

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
    @required String redirectUrl,
    String country = Countries.NIGERIA,
    String currency = Currencies.NAIRA,
    String suggestedAuth,
    String chargeType,
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
    assert(redirectUrl != null);
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
      redirectUrl: redirectUrl,
    ).charge();
  }

  Future<Response> _refundOrVoidCard({
    @required String flwRef,
    @required String action,
  }) async {
    final _res = await _http.post(
      Endpoints.refundOrVoidPreauthorization,
      <String, dynamic>{
        'SECKEY': Ravepay().secretKey,
        'ref': flwRef,
        'action': action,
      },
    );
    final _response = Response<Result>(
      _res,
      onTransform: (dynamic data, _) => data,
    );

    Log().debug("PreAuth.refundOrVoidCard($action) -> Response", _response);

    return _response;
  }

  Future<Response> voidCard(String flwRef) {
    return _refundOrVoidCard(
      flwRef: flwRef,
      action: 'void',
    );
  }

  Future<Response> refundCard(String flwRef) {
    return _refundOrVoidCard(
      flwRef: flwRef,
      action: 'refund',
    );
  }

  Future<Response> captureCard(String flwRef, String amount) async {
    final _res = await _http.post(
      Endpoints.capturePreauthorizeCard,
      <String, dynamic>{
        'SECKEY': Ravepay().secretKey,
        'flwRef': flwRef,
        'amount': amount,
      },
    );
    final _response = Response<Result>(
      _res,
      onTransform: (dynamic data, _) => data,
    );

    Log().debug("PreAuth.captureCard() -> Response", _response);

    return _response;
  }
}
