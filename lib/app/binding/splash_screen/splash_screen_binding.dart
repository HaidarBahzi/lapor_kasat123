import 'package:get/get.dart';
import 'package:lapor_kasat/app/controllers/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
