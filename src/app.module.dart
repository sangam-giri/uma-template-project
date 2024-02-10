import 'package:dart_modules/common/module.dart';
import 'app.service.dart';

@Module(
  imports: [],
  controllers: [AppService],
  providers: [AppService],
)
class AppModule {}
