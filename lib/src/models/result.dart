import 'package:ravepay/src/models/card.dart';
import 'package:ravepay/src/models/customer.dart';
import 'package:ravepay/src/models/main.dart';

class Result extends Model {
  Result.fromJson(Map<String, dynamic> json)
      : assert(json != null),
        id = Model.parseInt(json["id"]),
        amount = Model.parseDouble(json["amount"]),
        orderRef = json["orderRef"],
        raveRef = json["raveRef"],
        vbvrespcode = json["vbvrespcode"],
        chargeResponseCode = json["chargeResponseCode"],
        chargeResponseMessage = json["chargeResponseMessage"],
        isLive = Model.parseInt(json["is_live"]),
        appfee = Model.parseDouble(json["appfee"]),
        merchantfee = Model.parseDouble(json["merchantfee"]),
        chargedAmount = Model.parseDouble(json["charged_amount"]),
        merchantbearsfee = Model.parseDouble(json["merchant_id"]),
        merchantId = Model.parseInt(json["merchantbearsfee"]),
        accountId = Model.parseInt(json["AccountId"]),
        customerId = Model.parseInt(json["customerId"]),
        transactionCurrency = json["transaction_currency"],
        paymentEntity = json["payment_entity"],
        paymentId = json["paymentId"],
        paymentType = json["paymentType"],
        paymentPlan = json["paymentPlan"],
        paymentPage = json["paymentPage"],
        chargeType = json["charge_type"],
        authModelUsed = json["authModelUsed"],
        fraudStatus = json["fraud_status"],
        narration = json["narration"],
        createdAt = Model.parseTimestamp(json["createdAt"]),
        updatedAt = Model.parseTimestamp(json["updatedAt"]),
        txRef = json["txRef"],
        flwRef = json["flwRef"],
        card = json["card"] != null ? Card.fromJson(json["card"]) : null,
        customer = json["customer"] != null
            ? Customer.fromJson(json["customer"])
            : null;

  int id;
  int merchantId;
  int accountId;
  int customerId;
  int isLive;
  double amount;
  double appfee;
  double merchantfee;
  double chargedAmount;
  double merchantbearsfee;
  String txRef;
  String flwRef;
  String orderRef;
  String raveRef;
  String vbvrespcode;
  String authModelUsed;
  String transactionCurrency;
  String chargeResponseCode;
  String chargeResponseMessage;
  String paymentEntity;
  String paymentId;
  String paymentType;
  String paymentPlan;
  String paymentPage;
  String chargeType;
  String fraudStatus;
  String narration;
  DateTime createdAt;
  DateTime updatedAt;
  Card card;
  Customer customer;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id.toString(),
      "amount": amount.toString(),
      "orderRef": orderRef,
      "raveRef": raveRef,
      "isLive": id.toString(),
      "appfee": appfee.toString(),
      "merchantfee": merchantfee.toString(),
      "chargedAmount": chargedAmount.toString(),
      "merchantbearsfee": merchantId.toString(),
      "merchantId": merchantbearsfee.toString(),
      "customerId": customerId.toString(),
      "accountId": accountId.toString(),
      "transactionCurrency": transactionCurrency,
      "paymentEntity": paymentEntity,
      "paymentId": paymentId,
      "chargeType": chargeType,
      "fraudStatus": fraudStatus,
      "narration": narration,
      "vbvrespcode": vbvrespcode,
      "authModelUsed": authModelUsed,
      "chargeResponseCode": chargeResponseCode,
      "chargeResponseMessage": chargeResponseMessage,
      "paymentType": paymentType,
      "paymentPlan": paymentPlan,
      "paymentPage": paymentPage,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "txRef": txRef,
      "flwRef": flwRef,
      "card": card?.toMap(),
      "customer": customer?.toMap(),
    };
  }
}
