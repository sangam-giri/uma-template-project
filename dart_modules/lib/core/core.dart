import 'dart:mirrors';
import 'package:dart_modules/common/get.dart';
import 'package:dart_modules/common/post.dart';

class DartFactory {
  DartFactory._();

  ///create
  static DartFactory create(Type module) {
    ClassMirror moduleClass = reflectClass(module);
    moduleClass.declarations.forEach((symbol, declaration) {
      if (declaration is MethodMirror) {
        List<InstanceMirror> metaData = declaration.metadata;
        String methodName = MirrorSystem.getName(symbol);
        metaData.forEach((meta) {
          var decoratorType = meta.reflectee;
          if (decoratorType is Get) {
            Get.handleGetRequest(
                decoratorType: decoratorType,
                methodName: methodName,
                path: decoratorType.path);
          } else if (decoratorType is Post) {
            Post.handlePostRequest(
                decoratorType: decoratorType,
                methodName: methodName,
                path: decoratorType.path);
          }
        });
      }
    });
    return DartFactory._();
  }

  ///listen
  void listen(int port, {String ip = '127.0.0.1'}) {}
}
