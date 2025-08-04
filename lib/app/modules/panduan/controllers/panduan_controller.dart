import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PanduanController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

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
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < 3) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void backButton() {
    if (currentPage.value == 0) {
      // Jika di slide pertama, langsung keluar
      Get.back();
    } else {
      // Jika bukan slide pertama, pindah ke slide sebelumnya
      previousPage();
    }
  }

  void goHome() {
    Get.back();
  }
}
