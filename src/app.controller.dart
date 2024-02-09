import 'package:dart_modules/common/get.dart';
import 'package:dart_modules/common/post.dart';
import 'package:dart_modules/common/controller.dart';
import 'app.service.dart';

@Controller()
class AppController {
  AppService appService;
  AppController(this.appService);

  @Get()
  String getMethod() {
    return appService.getMethod();
  }

  @Get(path: '/my-get')
  String getMethodWithRoute() {
    return appService.getMethodWithRoute();
  }

  @Post()
  String postMethod() {
    return appService.postMethod();
  }

  @Post(path: '/my-post')
  String postMethodWithRoute() {
    return appService.postMethodWithRoute();
  }
}
