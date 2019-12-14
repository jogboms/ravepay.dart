import 'dart:io';

import 'package:ravepay/src/constants/strings.dart';

class RedirectException extends ResponseException {
  RedirectException(this.url, [String message]) : super(HttpStatus.temporaryRedirect, 'Temporary Redirect', message);

  final String url;

  @override
  String toString() => '$runtimeType($statusCode, $status, $message, $url)';
}

class ForbiddenException extends ResponseException {
  ForbiddenException(String status, [String message]) : super(HttpStatus.forbidden, status, message);
}

class TimeOutException extends ResponseException {
  TimeOutException() : super(HttpStatus.requestTimeout, 'UNKNOWN', Strings.timeoutErrorMessage);
}

class BadRequestException extends ResponseException {
  BadRequestException(String status, [String message]) : super(HttpStatus.badRequest, status, message);
}

class UnAuthorisedException extends ResponseException {
  UnAuthorisedException(String status, [String message]) : super(HttpStatus.unauthorized, status, message);
}

class ResponseException implements Exception {
  ResponseException(this.statusCode, this.status, [this.message]);

  final int statusCode;
  final String status;
  final String message;

  @override
  String toString() => '$runtimeType($statusCode, $status, $message)';
}
