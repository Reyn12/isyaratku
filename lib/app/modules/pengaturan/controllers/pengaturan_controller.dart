import 'package:get/get.dart';

class PengaturanController extends GetxController {
  // Observable variables untuk toggle dan slider
  final isSuaraEnabled = true.obs;
  final isGetarEnabled = true.obs;
  final ukuranTeks = 0.5.obs; // Range 0.0 - 1.0

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

  // Method untuk toggle suara
  void toggleSuara(bool value) {
    isSuaraEnabled.value = value;
    // Di sini bisa ditambah logic untuk mengatur suara
    print('Suara: ${isSuaraEnabled.value}');
  }

  // Method untuk toggle getar
  void toggleGetar(bool value) {
    isGetarEnabled.value = value;
    // Di sini bisa ditambah logic untuk mengatur getar
    print('Getar: ${isGetarEnabled.value}');
  }

  // Method untuk mengatur ukuran teks
  void setUkuranTeks(double value) {
    ukuranTeks.value = value;
    // Di sini bisa ditambah logic untuk mengatur ukuran teks
    print('Ukuran Teks: ${ukuranTeks.value}');
  }
}
