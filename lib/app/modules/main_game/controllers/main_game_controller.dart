import 'package:get/get.dart';
import '../../widgets/coming_soon_fitur.dart';

class MainGameController extends GetxController {
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

  void onAlfabetTap() {
    print('Alfabet button tapped');
    Get.toNamed('/game-alfabet');
  }

  void onAngkaTap() {
    print('Angka button tapped');
    Get.toNamed('/game-angka');
  }

  void onHewanTap() {
    print('Hewan button tapped');
    _showComingSoon();
  }

  void onBuahMakananTap() {
    print('Buah dan Makanan button tapped');
    _showComingSoon();
  }

  // Show coming soon dialog
  void _showComingSoon() {
    Get.dialog(const ComingSoonFitur(), barrierDismissible: false);
  }

  void onBackTap() {
    print('Back button tapped');
    Get.back();
  }
}
