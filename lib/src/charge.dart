import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/encryption.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/endpoints.dart';
import 'package:ravepay/src/utils/http_wrapper.dart';
import 'package:ravepay/src/utils/payload.dart';

class Charge {
  Charge({
    @required this.payload,
  })  : assert(payload != null),
        _http = HttpWrapper();

  factory Charge.basic({
    String currency = "NGN",
    String country = "NG",
    String txRef,
    String amount,
    String paymentType,
    String email,
    String firstname,
    String lastname,
    String meta,
  }) {
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Amount, amount)
        ..add(Keys.PaymentType, paymentType)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.Meta, meta),
    );
  }

  factory Charge.pin({
    String currency = "NGN",
    String country = "NG",
    String txRef,
    String amount,
    String paymentType,
    String email,
    String firstname,
    String lastname,
    String meta,
  }) {
    return Charge(
      payload: Payload()
        ..add(Keys.Currency, currency)
        ..add(Keys.Country, country)
        ..add(Keys.TxRef, txRef)
        ..add(Keys.Amount, amount)
        ..add(Keys.PaymentType, paymentType)
        ..add(Keys.Email, email)
        ..add(Keys.Firstname, firstname)
        ..add(Keys.Lastname, lastname)
        ..add(Keys.Meta, meta)
        ..add(Keys.SuggestedAuth, "PIN"),
    );
  }

  factory Charge.preauth({
    @required String cardno,
    @required String cvv,
    @required String amount,
    @required String expiryyear,
    @required String expirymonth,
    @required String email,
    @required String iP,
    @required String txRef,
    @required String chargeType,
    String currency = "NGN",
    String country = "NG",
    String suggestedAuth,
    String settlementToken,
    String phonenumber,
    String billingzip,
    String firstname,
    String lastname,
    String narration,
    String meta,
    String pin,
    String bvn,
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
        // TODO
        ..add(Keys.IncludeIntegrityHash,
            _encryption.integrityHash(<String, dynamic>{})),
    );
  }

  factory Charge.ussd({
    @required String amount,
    @required String phonenumber,
    @required String email,
    @required String iP,
    @required String txRef,
    @required String accountbank,
    @required String accountnumber,
    String currency = "NGN",
    String country = "NG",
    String firstname,
    String lastname,
    String narration,
    String meta,
    String deviceFingerprint,
  }) {
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
        ..add(Keys.IsUssd, "ussd")
        ..add(Keys.OrderRef, DateTime.now().millisecondsSinceEpoch)
        ..add(Keys.Payment_Type, "account")
        // TODO
        ..add(Keys.IncludeIntegrityHash,
            _encryption.integrityHash(<String, dynamic>{})),
    );
  }

  final HttpWrapper _http;
  final Payload payload;
  static final _encryption = Encryption(secretKey: Rave().secretKey);

  Future<http.Response> charge() {
    return _http.post(
      Endpoints.directCharge,
      <String, dynamic>{
        "PBFPubKey": Rave().publicKey,
        "client": _encryption.encrypt(payload.toMap()),
        "alg": Encryption.ALGORITHM,
      },
    );
  }
}
