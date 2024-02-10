import 'dart:io';
import 'package:dart_modules/core/routes_manager.dart';
import 'package:dart_modules/logger/logger.dart';

HttpServer? server;

class DartFactory {
  final Object module;

  DartFactory(this.module);

  ///create
  factory DartFactory.create(Object module) {
    return DartFactory(module);
  }

  Logger logger = Logger();

  ///listen
  void listen(int port, {String ip = '127.0.0.1'}) async {
    try {
      logger.info("Starting server...");
      logger.info("PORT: $port");
      server = await HttpServer.bind(ip, port);
      logger.info("Listening at: http://$ip:$port");
      server?.listen((HttpRequest request) async {
        RoutesManager.initailize(request, module);
      });
    } catch (e) {
      logger.error(e.toString());
    }
  }
}
