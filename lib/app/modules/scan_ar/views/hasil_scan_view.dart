import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HasilScanView extends GetView {
  const HasilScanView({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar hitam
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFAFE4E1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/ic_back_1.png',
                  width: 80,
                  height: 80,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // Title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Jawaban',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Main content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Gambar isyarat A
                          Image.asset(
                            'assets/images/alfabet/img_isyarat_a.png',
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 30),

                          // Text jawaban
                          const Text(
                            'Kamu Benar!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E40AF),
                            ),
                          ),
                          const SizedBox(height: 10),

                          const Text(
                            'Ini adalah Bahasa Isyarat\nhuruf A',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E40AF),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            'Coba lakukan gerakannya!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1E40AF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),

                  // Bottom navigation buttons
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Back button
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              'assets/icons/ic_back_2.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),

                        // Home button
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            // Navigate to home atau dashboard
                            Get.offAllNamed(
                              '/homepage',
                            ); // atau route home kamu
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              'assets/icons/ic_home.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
