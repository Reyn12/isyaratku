import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    print('SplashScreenBinding dependencies called');
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
