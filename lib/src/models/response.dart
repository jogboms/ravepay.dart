import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:ravepay/src/constants/strings.dart';
import 'package:ravepay/src/models/main.dart';
import 'package:ravepay/src/rave.dart';
import 'package:ravepay/src/utils/log.dart';

typedef T TransformFunction<T>(dynamic data, String status);

class ForbiddenException implements Exception {
  ForbiddenException([this.message]);

  final String message;

  @override
  String toString() => this.message;
}

class NotAuthorisedException implements Exception {
  NotAuthorisedException([this.message]);

  final String message;

  @override
  String toString() => this.message;
}

class ResponseException implements Exception {
  ResponseException([this.status, this.message]);

  final String status;
  final String message;

  @override
  String toString() => 'ResponseException(${this.status}, ${this.message})';
}

class Response<T> extends Model {
  Response(
    this._response, {
    TransformFunction<T> onTransform,
  }) {
    try {
      final dynamic responseJson = json.decode(_response.body);
      status = responseJson != null
          ? (responseJson is Map && responseJson.containsKey("status")
              ? responseJson["status"]
              : _response.statusCode < 300 ? 'success' : 'error')
          : 'empty';
      message = responseJson != null &&
              responseJson is Map &&
              responseJson.containsKey("message") &&
              responseJson["message"] != null
          ? responseJson["message"]
          : !Rave().production ? _response.reasonPhrase : Strings.errorMessage;

      if (_response.statusCode >= 300) {
        throw ResponseException(status, message);
      }

      rawData = _response.statusCode < 300
          ? (responseJson != null &&
                  responseJson is Map &&
                  responseJson.containsKey("data")
              ? responseJson["data"]
              : responseJson)
          : null;
    } on ResponseException catch (e) {
      status = e.status;
      message = e.message;
      rawData = null;
      Log().error('ResponseException', e);
    } catch (e) {
      status = "empty";
      message = _response.statusCode == 502 && Rave().production
          ? Strings.errorMessage
          : e.toString();
      rawData = null;
      Log().error('Response.catch', e);
    }

    if (onTransform != null) {
      data = onTransform(rawData, status);
    }
  }

  final http.Response _response;
  String status;
  String message;
  dynamic rawData;
  T data;

  int get statusCode => _response.statusCode;

  String get reasonPhrase => _response.reasonPhrase;

  bool get isOk {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode >= 400 && statusCode < 500) {
      return false;
    } else if (statusCode >= 500) {
      return false;
    }
    return false;
  }

  bool get isSuccess => status == "success";

  bool get isError => status == "error";

  bool get isCancel => status == "cancelled";

  bool get isNotOk => !isOk;

  bool get isBadRequest => statusCode == 400;

  bool get isNotFound => statusCode == 404;

  bool get isNotAcceptable => statusCode == 406;

  bool get isNotAuthorized => statusCode == 401;

  bool get isForbidden => statusCode == 403;

  bool get isTooLarge => statusCode == 413;

  @override
  Map<String, dynamic> toMap() {
    return rawData is Map ? rawData : <String, dynamic>{':( Rave': rawData};
  }
}
