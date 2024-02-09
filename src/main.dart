import 'package:dart_modules/core/core.dart';
import 'app.controller.dart';

void main() {
  var app = DartFactory.create(AppController());
  app.listen(3000);
}
