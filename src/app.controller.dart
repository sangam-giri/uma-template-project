import 'package:dart_modules/common/controller.dart';
import 'package:dart_modules/common/routes.dart';
import 'app.service.dart';

@Controller()
class AppController {
  AppService appService = AppService();

  @Get()
  String getMethod() {
    return appService.getMethod();
  }

  @Get(path: '/my-get-path')
  String getWithPathMethod() {
    return 'This get method has a path';
  }

  @Post()
  String postMethod() {
    return appService.postMethod();
  }

  @Put()
  String putMethod() {
    return 'PuT Working';
  }

  @Patch()
  String patchMethod() {
    return 'Patch Working';
  }

  @Delete()
  String deleteMethod() {
    return 'Delete Working';
  }
}
