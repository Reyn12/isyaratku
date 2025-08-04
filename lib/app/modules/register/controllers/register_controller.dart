import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isyaratku/utils/loading_dialog.dart';

class RegisterController extends GetxController {
  // Form controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  // Observable untuk checkbox dan loading state
  final isAgreed = false.obs;
  final isLoading = false.obs;
  
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Method untuk register (sementara print dulu)
  Future<void> register() async {
    showLoading();
    await Future.delayed(const Duration(seconds: 2));
    hideLoading();
    print('=== REGISTER BUTTON PRESSED ===');
    print('Name: ${nameController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Confirm Password: ${confirmPasswordController.text}');
    print('Is Agreed: ${isAgreed.value}');
    print('===============================');
    Get.toNamed('/login');
  }

  // Method untuk navigasi ke login
  void goToLogin() {
    print('=== GO TO LOGIN ===');
    Get.toNamed('/login');
  }
  
  // Method untuk toggle checkbox
  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }
}
