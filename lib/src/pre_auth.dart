import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/charge.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/charge_payload.dart';
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
    String includeIntegrityHash,
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
    return Charge(
      payload: Payload()
        ..add(Keys.Cardno, cardno)
        ..add(Keys.Currency, currency)
        ..add(Keys.SuggestedAuth, suggestedAuth)
        ..add(Keys.Country, country)
        ..add(Keys.SettlementToken, settlementToken)
        ..add(Keys.Cvv, cvv)
        ..add(Keys.Amount, amount)
        ..add(Keys.Phonenumber, phonenumber)
        ..add(Keys.Billingzip, billingzip)
        ..add(Keys.Expiryyear, expiryyear)
        ..add(Keys.Expirymonth, expirymonth)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.IP, iP)
        ..add(Keys.Narration, narration)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Meta, meta)
        ..add(Keys.Pin, pin)
        ..add(Keys.Bvn, bvn)
        ..add(Keys.ChargeType, chargeType)
        ..add(Keys.DeviceFingerprint, deviceFingerprint)
        ..add(Keys.RecurringStop, recurringStop)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
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
