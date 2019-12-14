import 'dart:async';
import 'dart:io';

import 'package:ravepay/src/constants/strings.dart';

const String LOCAL_SCHEME = 'http://';
const String LOCAL_IP = '127.0.0.1';
const int LOCAL_PORT = 8184;
const String LOCAL_REDIRECT_URL = '$LOCAL_SCHEME$LOCAL_IP:$LOCAL_PORT';

class LocalServer {
  LocalServer({this.localhost = LOCAL_IP, this.port = LOCAL_PORT, this.scheme = LOCAL_SCHEME})
      : assert(localhost != null),
        assert(port != null),
        assert(scheme != null);

  final String localhost;
  final int port;
  final String scheme;
  final _completer = Completer<Map<String, dynamic>>();
  HttpServer _server;

  Future<Map<String, dynamic>> get onComplete => _completer.future;

  Future<void> start() async {
    if (_server != null) {
      throw Exception('Server already started on $scheme$localhost:$port');
    }

    final completer = Completer<void>();

    await runZoned(() async {
      _server = await HttpServer.bind(localhost, port, shared: true);

      _server.listen((HttpRequest request) async {
        request.response
          ..statusCode = 200
          ..headers.set('Content-Type', ContentType.html.mimeType)
          ..write('<html><center><h1>${Strings.closeLocalServerWindow}</h1></center></html>');

        _completer.complete(request.requestedUri.queryParameters);

        await request.response.close();
        await close();
      });

      completer.complete();
    }, onError: (dynamic e) => print('Error: $e'));

    return completer.future;
  }

  Future<void> close() async {
    if (_server != null) {
      await _server.close(force: true);

      _server = null;
    }
  }
}
