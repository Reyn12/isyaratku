import 'package:get/get.dart';
import 'package:isyaratku/utils/loading_dialog.dart'; // Import loading_dialog.dart

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('SplashScreenController initialized and ready');
    showLoading();
    Future.delayed(const Duration(seconds: 1), () {
      hideLoading();
      Get.offNamed('/on-boarding'); // Navigasi ke halaman onboarding
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
