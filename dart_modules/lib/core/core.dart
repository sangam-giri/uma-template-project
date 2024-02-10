import 'dart:io';
import 'package:dart_modules/core/request_handler.dart';

HttpServer? server;

class DartFactory {
  final Object module;

  DartFactory(this.module);

  ///create
  factory DartFactory.create(Object module) {
    return DartFactory(module);
  }

  ///listen
  void listen(int port, {String ip = '127.0.0.1'}) async {
    try {
      print("Starting server...");
      print("PORT: $port");
      server = await HttpServer.bind(ip, port);
      print("Listening at: http://$ip:$port");
      server?.listen((HttpRequest request) async {
        RequestHandler.handleRequest(request, module);
      });
    } catch (e) {
      print("Error starting the server:$e");
    }
  }
}
