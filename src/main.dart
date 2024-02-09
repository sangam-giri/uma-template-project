import 'package:dart_modules/common.dart';
import 'app.service.dart' as One;
import 'package:dio/dio.dart' as dio;

void main() {
  dio.Headers();
  One.test();
  final env = loadEnv();
  print(env['DATABASE_URL']);
  print(env['API_KEY']);
  print(env['DEBUG']);
}
