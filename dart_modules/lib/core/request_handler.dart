import 'dart:io';
import 'dart:mirrors';
import 'package:dart_modules/common/routes.dart';
import 'package:dart_modules/constants/constants.dart';
import 'package:dart_modules/core/request.dart';

Map<String, Function> getRoutes = {};
Map<String, Function> postRoutes = {};
Map<String, Function> putRoutes = {};
Map<String, Function> patchRoutes = {};
Map<String, Function> deleteRoutes = {};

class RequestHandler {
  static handleRequest(HttpRequest request, Object module) async {
    ///Setting up routes
    if (getRoutes.isEmpty &&
        postRoutes.isEmpty &&
        putRoutes.isEmpty &&
        patchRoutes.isEmpty &&
        deleteRoutes.isEmpty) {
      var instanceMirror = reflect(module);
      var classMirrorType = instanceMirror.type;
      classMirrorType.instanceMembers.forEach((symbol, methodMirror) {
        var metadata = methodMirror.metadata;
        metadata.forEach((meta) {
          var currAnnot = meta.reflectee;
          if (currAnnot is Get) {
            getRoutes.addAll({
              currAnnot.path: () {
                return instanceMirror.invoke(symbol, []).reflectee;
              }
            });
          }
          if (currAnnot is Post) {
            postRoutes.addAll({
              currAnnot.path: () {
                return instanceMirror.invoke(symbol, []).reflectee;
              }
            });
          }
          if (currAnnot is Put) {
            putRoutes.addAll({
              currAnnot.path: () {
                return instanceMirror.invoke(symbol, []).reflectee;
              }
            });
          }
          if (currAnnot is Patch) {
            patchRoutes.addAll({
              currAnnot.path: () {
                return instanceMirror.invoke(symbol, []).reflectee;
              }
            });
          }
          if (currAnnot is Delete) {
            deleteRoutes.addAll({
              currAnnot.path: () {
                return instanceMirror.invoke(symbol, []).reflectee;
              }
            });
          }
        });
      });
    }

    ///RequestHandler
    dynamic myRequest = Request(request);
    final path = myRequest.path;
    final method = myRequest.method;
    if (method == GET && getRoutes.containsKey(path)) {
      final methodResult = getRoutes[path]!();
      request.response
        ..statusCode = HttpStatus.ok
        ..write(methodResult) // Write the result to the response
        ..close();
    } else if (method == POST && postRoutes.containsKey(path)) {
      final methodResult = postRoutes[path]!();
      request.response
        ..statusCode = HttpStatus.created
        ..write(methodResult) // Write the result to the response
        ..close();
    } else if (method == PUT && putRoutes.containsKey(path)) {
      final methodResult = putRoutes[path]!();
      request.response
        ..statusCode = HttpStatus.ok
        ..write(methodResult) // Write the result to the response
        ..close();
    } else if (method == PATCH && patchRoutes.containsKey(path)) {
      final methodResult = patchRoutes[path]!();
      request.response
        ..statusCode = HttpStatus.ok
        ..write(methodResult) // Write the result to the response
        ..close();
    } else if (method == DELETE && deleteRoutes.containsKey(path)) {
      final methodResult = deleteRoutes[path]!();
      request.response
        ..statusCode = HttpStatus.ok
        ..write(methodResult) // Write the result to the response
        ..close();
    } else {
      request.response
        ..statusCode = HttpStatus.notFound
        ..write('Not found') //Route not found error
        ..close();
    }
  }
}
