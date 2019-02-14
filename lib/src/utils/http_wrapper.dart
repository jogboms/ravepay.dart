import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ravepay/src/rave.dart';

class HttpWrapper {
  HttpWrapper() : baseUrl = Rave().baseUrl;

  static final Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  final String baseUrl;

  Future<http.Response> get(String url) {
    return http.get(baseUrl + url, headers: _headers);
  }

  Future<http.Response> post(String url, Map<String, dynamic> data) {
    return http.post(
      baseUrl + url,
      headers: _headers,
      body: json.encode(data),
    );
  }
}
