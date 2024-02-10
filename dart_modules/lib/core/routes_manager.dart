import 'dart:io';
import 'dart:mirrors';
import 'package:dart_modules/common/routes.dart';
import 'package:dart_modules/core/all_routes.dart';
import 'package:dart_modules/core/request_handler.dart';

class RoutesManager {
  static initailize(HttpRequest request, Object module) {
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
    RequestHandler.handleRequest(request, module);
  }
}
