import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ravepay/src/models/response.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/log.dart';

class HttpWrapper {
  HttpWrapper() : baseUrl = Ravepay().baseUrl;

  static final Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  final String baseUrl;

  Future<http.Response> get(String url) {
    try {
      Log().debug("HttpWrapper.get() -> $url");
      return http.get(baseUrl + url, headers: _headers);
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  Future<http.Response> post(String url, Map<String, dynamic> data) {
    try {
      final _body = json.encode(data);
      Log().debug("HttpWrapper.post() -> $url", _body);
      return http.post(
        baseUrl + url,
        headers: _headers,
        body: _body,
      );
    } on TimeoutException {
      throw TimeOutException();
    }
  }
}
