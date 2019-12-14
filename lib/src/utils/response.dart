import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ravepay/src/constants/strings.dart';
import 'package:ravepay/src/ravepay.dart';
import 'package:ravepay/src/utils/exceptions.dart';
import 'package:ravepay/src/utils/log.dart';

typedef TransformFunction<T> = T Function(dynamic data, String status);

class Response<T> {
  factory Response(http.Response _response, {TransformFunction<T> onTransform, bool shouldThrow = true}) {
    final _status = _Status(_response.statusCode);
    try {
      final dynamic response = json.decode(_response.body);
      if (response == null || (response is! Map && response is! List)) {
        throw ResponseException(_status.code, _response.reasonPhrase);
      }

      final String status =
          response is Map && response.containsKey('status') ? response['status'] : (_status.isOk ? 'success' : 'error');

      final String message = response is Map && response.containsKey('message') && response['message'] != null
          ? response['message']
          : !Ravepay().production ? _response.reasonPhrase : Strings.errorMessage;

      if (_status.isNotOk) {
        throw ResponseException(_status.code, status, message);
      }

      final dynamic rawData = response is Map && response.containsKey('data') ? response['data'] : response;

      return Response._(
        status: _status,
        message: message,
        data: onTransform != null ? onTransform(rawData, status) : null,
      );
    } catch (e) {
      Log().error('Response.catch', e);
      final message =
          _status.code == HttpStatus.badGateway && Ravepay().production ? Strings.errorMessage : e.toString();

      if (shouldThrow) {
        if (_status.isForbidden) {
          throw ForbiddenException(message);
        }

        if (_status.isNotAuthorized) {
          throw UnAuthorisedException(message);
        }

        if (_status.isBadRequest) {
          throw BadRequestException(message);
        }

        throw ResponseException(_status.code, message);
      }

      return Response._(status: _status, message: message);
    }
  }

  Response._({@required this.status, @required this.message, this.data});

  final _Status status;
  final String message;
  final T data;

  @override
  String toString() => ({'status': status.code, 'message': message, 'data': data?.toString()}).toString();
}

class _Status {
  _Status(this.code);

  final int code;

  bool get isOk => code >= HttpStatus.ok && code < HttpStatus.multipleChoices;

  bool get isNotOk => !isOk;

  bool get isBadRequest => code == HttpStatus.badRequest;

  bool get isNotFound => code == HttpStatus.notFound;

  bool get isNotAuthorized => code == HttpStatus.unauthorized;

  bool get isForbidden => code == HttpStatus.forbidden;
}
