import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    print('SplashScreenView built');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color(0xFFF9FAFF), // 13% stop
              Color(0xFF7FD7FF), // 55% stop
            ],
            stops: [0.13, 0.55],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.asset('assets/images/logo_splash.png', height: 100),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  'assets/images/gb_anak_rame.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 80.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                'Belajar Bahasa Isyarat Jadi Menyenangkan!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 6, 46, 106),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
