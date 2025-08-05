import 'package:get/get.dart';

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
    // TODO: Implement navigation to Alfabet game
  }

  void onAngkaTap() {
    print('Angka button tapped');
    Get.toNamed('/game-angka');
  }

  void onHewanTap() {
    print('Hewan button tapped');
    // TODO: Implement navigation to Hewan game
  }

  void onBuahMakananTap() {
    print('Buah dan Makanan button tapped');
    // TODO: Implement navigation to Buah dan Makanan game
  }

  void onBackTap() {
    print('Back button tapped');
    Get.back();
  }
}
