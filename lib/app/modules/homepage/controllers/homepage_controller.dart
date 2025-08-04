import 'package:get/get.dart';
import '../../widgets/coming_soon_fitur.dart';

class HomepageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Method untuk menu Scan AR
  void goToScanAR() {
    print('=== MENU SCAN AR CLICKED ===');
    Get.toNamed('/scan-ar');
  }

  // Method untuk menu Main Game
  void goToMainGame() {
    print('=== MENU MAIN GAME CLICKED ===');
    Get.dialog(
      const ComingSoonFitur(),
      barrierDismissible: false,
    );
  }

  // Method untuk menu Latihan Isyarat
  void goToLatihanIsyarat() {
    print('=== MENU LATIHAN ISYARAT CLICKED ===');
    Get.dialog(
      const ComingSoonFitur(),
      barrierDismissible: false,
    );
  }

  // Method untuk menu Progress-ku
  void goToProgress() {
    print('=== MENU PROGRESS CLICKED ===');
    Get.dialog(
      const ComingSoonFitur(),
      barrierDismissible: false,
    );
  }

  // Method untuk menu Panduan
  void goToPanduan() {
    print('=== MENU PANDUAN CLICKED ===');
    Get.dialog(
      const ComingSoonFitur(),
      barrierDismissible: false,
    );
  }

  // Method untuk menu Pengaturan
  void goToPengaturan() {
    print('=== MENU PENGATURAN CLICKED ===');
    Get.toNamed('/pengaturan');
  }
}
