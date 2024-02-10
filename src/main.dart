import 'package:dart_modules/core/core.dart';
// import 'app.controller.dart';
import 'app.module.dart';

void main() {
  var app = DartFactory.create(AppModule);
  app.listen(3000);
}
