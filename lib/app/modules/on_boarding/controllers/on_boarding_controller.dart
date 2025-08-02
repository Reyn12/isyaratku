import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isyaratku/utils/loading_dialog.dart';

class OnBoardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animationController;

  RxInt currentPage = 0.obs;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Komunikasi Tanpa Batas\nUntuk Semua',
      'description':
          'Catat penjualan, stok, dan uang pelanggan\nlangsung dari HP Anda. Tanpa ribet. Tanpa\ncatatan manual',
      'image': 'assets/images/on_boarding1.png',
    },
    {
      'title': 'Terjemahkan Bahasa\nIsyarat ke Teks atau Suara',
      'description':
          'Gunakan kamera untuk mengenali\ngerakan tangan dan ubah jadi kata kata\nsecara real-time',
      'image': 'assets/images/on_boarding2.png',
    },
    {
      'title': 'Yuk, Mulai Lebih Inklusif\nHari Ini..!!',
      'description':
          'Gabung dengan ribuan pengguna yang\npeduli dan ingin lebih memahami satu\nsama lain',
      'image': 'assets/images/on_boarding3.png',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    animationController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToEnd() {
    currentPage.value = onboardingData.length - 1;
  }

  void goToSignUp() {
    showLoading();
    Future.delayed(const Duration(seconds: 1), () {
      hideLoading();
      Get.offAllNamed(
        '/register',
      ); // Langsung ke halaman register dan hapus stack sebelumnya
    });
  }

  void goToLogin() {
    showLoading();
    Future.delayed(const Duration(seconds: 1), () {
      hideLoading();
      Get.offAllNamed(
        '/login',
      ); // Langsung ke halaman login dan hapus stack sebelumnya
    });
  }
}
