import 'package:meta/meta.dart';
import 'package:ravepay/src/constants/auth.dart';
import 'package:ravepay/src/constants/countries.dart';
import 'package:ravepay/src/constants/currencies.dart';
import 'package:ravepay/src/constants/payment.dart';
import 'package:ravepay/src/encryption.dart';
import 'package:ravepay/src/models/meta.dart';
import 'package:ravepay/src/models/response.dart';
import 'package:ravepay/src/models/result.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';
import 'package:ravepay/src/utils/log.dart';
import 'package:ravepay/src/utils/payload.dart';

class Charge {
  Charge({
    @required this.payload,
  })  : assert(payload != null),
        _http = HttpWrapper();

  factory Charge.card({
    @required String cardno,
    @required String cvv,
    @required String amount,
    @required String expiryyear,
    @required String expirymonth,
    @required String email,
    @required String firstname,
    @required String lastname,
    @required String redirectUrl,
    String currency = Currencies.NAIRA,
    String country = Countries.NIGERIA,
    String txRef,
    String suggestedAuth,
    String iP,
    String settlementToken,
    String phonenumber,
    String billingzip,
    String narration,
    List<Meta> meta,
    String pin,
    String bvn,
    String chargeType,
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
    assert(firstname != null);
    assert(lastname != null);
    assert(redirectUrl != null);
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
        ..add(Keys.RedirectUrl, redirectUrl)
        ..add(Keys.ChargeType, chargeType)
        ..add(Keys.DeviceFingerprint, deviceFingerprint)
        ..add(Keys.RecurringStop, recurringStop)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
    );
  }

  factory Charge.pin({
    @required String amount,
    @required String email,
    @required String firstname,
    @required String lastname,
    @required String pin,
    @required String cardno,
    @required String cvv,
    @required String expiryyear,
    @required String expirymonth,
    @required String redirectUrl,
    String currency = Currencies.NAIRA,
    String country = Countries.NIGERIA,
    String txRef,
    String paymentType,
    List<Meta> meta,
    String iP,
    String chargeType,
    bool includeIntegrityHash,
  }) {
    assert(amount != null);
    assert(pin != null);
    assert(email != null);
    assert(firstname != null);
    assert(lastname != null);
    assert(cardno != null);
    assert(cvv != null);
    assert(expiryyear != null);
    assert(expirymonth != null);
    assert(redirectUrl != null);
    return Charge(
      payload: Payload()
        ..add(Keys.Cardno, cardno)
        ..add(Keys.Cvv, cvv)
        ..add(Keys.Expiryyear, expiryyear)
        ..add(Keys.Expirymonth, expirymonth)
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Amount, amount)
        ..add(Keys.Pin, pin)
        ..add(Keys.PaymentType, paymentType)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.Meta, meta)
        ..add(Keys.IP, iP)
        ..add(Keys.RedirectUrl, redirectUrl)
        ..add(Keys.ChargeType, chargeType)
        ..add(Keys.SuggestedAuth, AuthType.PIN)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
    );
  }

  factory Charge.account({
    @required String amount,
    @required String email,
    @required String accountbank,
    @required String accountnumber,
    @required String firstname,
    @required String lastname,
    @required String redirectUrl,
    String currency = Currencies.NAIRA,
    String country = Countries.NIGERIA,
    String iP,
    String txRef,
    String chargeType,
    String suggestedAuth,
    String settlementToken,
    String phonenumber,
    String billingzip,
    String narration,
    List<Meta> meta,
    String pin,
    String bvn,
    String deviceFingerprint,
    String paymentType,
    String recurringStop,
    String isInternetBanking,
    bool includeIntegrityHash,
  }) {
    assert(amount != null);
    assert(accountbank != null);
    assert(accountnumber != null);
    assert(email != null);
    assert(firstname != null);
    assert(lastname != null);
    assert(redirectUrl != null);
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.SuggestedAuth, suggestedAuth)
        ..add(Keys.Country, country)
        ..add(Keys.SettlementToken, settlementToken)
        ..add(Keys.Amount, amount)
        ..add(Keys.Phonenumber, phonenumber)
        ..add(Keys.Billingzip, billingzip)
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
        ..add(Keys.Accountbank, accountbank)
        ..add(Keys.Accountnumber, accountnumber)
        ..add(Keys.RedirectUrl, redirectUrl)
        ..add(Keys.SuggestedAuth, AuthType.PIN)
        ..add(Keys.Payment_Type, paymentType ?? PaymentType.ACCOUNT)
        ..add(Keys.IsInternetBanking, isInternetBanking)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
    );
  }

  factory Charge.preauth({
    @required String cardno,
    @required String cvv,
    @required String amount,
    @required String expiryyear,
    @required String expirymonth,
    @required String email,
    @required String firstname,
    @required String lastname,
    @required String pin,
    @required String redirectUrl,
    String currency = Currencies.NAIRA,
    String country = Countries.NIGERIA,
    String txRef,
    String chargeType,
    String iP,
    String suggestedAuth,
    String settlementToken,
    String phonenumber,
    String billingzip,
    String narration,
    List<Meta> meta,
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
    assert(firstname != null);
    assert(lastname != null);
    assert(pin != null);
    assert(redirectUrl != null);
    return Charge(
      payload: Payload()
        ..add(Keys.Cardno, cardno)
        ..add(Keys.Currency, currency)
        ..add(Keys.SuggestedAuth, suggestedAuth ?? AuthType.PIN)
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
        ..add(Keys.RedirectUrl, redirectUrl)
        ..add(Keys.ChargeType, chargeType ?? "preauth")
        ..add(Keys.DeviceFingerprint, deviceFingerprint)
        ..add(Keys.RecurringStop, recurringStop)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
    );
  }

  factory Charge.ussd({
    @required String amount,
    @required String phonenumber,
    @required String email,
    @required String accountbank,
    @required String accountnumber,
    @required String firstname,
    @required String lastname,
    @required String redirectUrl,
    String currency = Currencies.NAIRA,
    String country = Countries.NIGERIA,
    String txRef,
    String iP,
    String narration,
    List<Meta> meta,
    String deviceFingerprint,
    bool includeIntegrityHash,
  }) {
    assert(amount != null);
    assert(accountbank != null);
    assert(accountnumber != null);
    assert(email != null);
    assert(phonenumber != null);
    assert(firstname != null);
    assert(lastname != null);
    assert(redirectUrl != null);
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.Amount, amount)
        ..add(Keys.Phonenumber, phonenumber)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.IP, iP)
        ..add(Keys.Narration, narration)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Meta, meta)
        ..add(Keys.DeviceFingerprint, deviceFingerprint)
        ..add(Keys.Accountbank, accountbank)
        ..add(Keys.Accountnumber, accountnumber)
        ..add(Keys.IsUssd, AuthType.USSD)
        ..add(Keys.RedirectUrl, redirectUrl)
        ..add(Keys.OrderRef, DateTime.now().millisecondsSinceEpoch)
        ..add(Keys.Payment_Type, PaymentType.ACCOUNT)
        ..add(Keys.IncludeIntegrityHash, includeIntegrityHash),
    );
  }

  final HttpWrapper _http;
  final Payload payload;
  static final _encryption = Encryption(secretKey: Ravepay().secretKey);

  Future<Response<Result>> charge() async {
    if (payload.getItem(Keys.IncludeIntegrityHash) == true) {
      payload.remove(Keys.IncludeIntegrityHash);
      final integrityHash = _encryption.integrityHash(payload.toMap());
      final queryStringData = payload.toMap()
        ..putIfAbsent(
          Keys.IntegrityHash,
          () => integrityHash,
        );
      payload..add(Keys.QueryStringData, queryStringData);
    }

    Log().debug("Charge.charge()", payload);

    final _res = await _http.post(
      Endpoints.directCharge,
      <String, dynamic>{
        "PBFPubKey": Ravepay().publicKey,
        "client": _encryption.encrypt(payload.toMap()),
        "alg": Encryption.ALGORITHM,
      },
    );

    final _response = Response<Result>(
      _res,
      onTransform: (dynamic data, _) => Result.fromJson(data),
    );

    Log().debug("Charge.charge() -> Response", _response);

    return _response;
  }
}
