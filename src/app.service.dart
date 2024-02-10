import 'package:dart_modules/common/injectable.dart';

@Injectable()
class AppService {
  String getMethod() {
    return 'Get Method Triggered';
  }

  String getMethodWithRoute() {
    return 'Get Method Triggered with route';
  }

  String postMethod() {
    return 'Post Method Triggered';
  }

  String postMethodWithRoute() {
    return 'Post Method Triggered with route';
  }
}
