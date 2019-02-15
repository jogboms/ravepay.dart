import 'package:ravepay/src/models/main.dart';

class Card extends Model {
  Card({
    this.expirymonth,
    this.expiryyear,
    this.cardBIN,
    this.last4digits,
    this.brand,
    this.cardTokens,
    this.lifeTimeToken,
  });

  Card.fromJson(Map<String, dynamic> json)
      : expirymonth = json["expirymonth"],
        expiryyear = json["expiryyear"],
        cardBIN = json["cardBIN"],
        last4digits = json["last4digits"],
        brand = json["brand"],
        cardTokens = Model.generator<Map<String, dynamic>>(
          json["card_tokens"],
          (dynamic token) => Map<String, dynamic>.from(token),
        ),
        lifeTimeToken = json["life_time_token"];

  final String expirymonth;
  final String expiryyear;
  final String cardBIN;
  final String last4digits;
  final String brand;
  final List<Map<String, dynamic>> cardTokens;
  final String lifeTimeToken;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "expirymonth": expirymonth,
      "expiryyear": expiryyear,
      "cardBIN": cardBIN,
      "last4digits": last4digits,
      "brand": brand,
      "cardTokens": cardTokens,
      "lifeTimeToken": lifeTimeToken,
    };
  }
}
