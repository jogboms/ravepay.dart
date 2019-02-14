import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ravepay/src/rave.dart';

class HttpWrapper {
  factory HttpWrapper() => _instance ?? HttpWrapper._();

  HttpWrapper._()
      : baseUrl = Rave().production
            ? "https://api.ravepay.co/"
            : "https://ravesandboxapi.flutterwave.com/";

  static final HttpWrapper _instance = HttpWrapper._();

  final String baseUrl;

  Future<http.Response> get(String url) {
    return http.get(baseUrl + url, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
  }

  Future<http.Response> post(String url, Map<String, dynamic> data) {
    return http.post(
      baseUrl + url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: json.encode(data),
    );
  }
}
