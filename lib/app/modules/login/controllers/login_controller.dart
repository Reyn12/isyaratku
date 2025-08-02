import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Form controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Observable untuk loading state
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
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Method untuk login (sementara print dulu)
  void login() {
    print('=== LOGIN BUTTON PRESSED ===');
    print('Username: ${usernameController.text}');
    print('Password: ${passwordController.text}');
    print('============================');
  }
  
  // Method untuk navigasi ke register
  void goToRegister() {
    print('=== GO TO REGISTER ===');
    Get.toNamed('/register');
  }
}
