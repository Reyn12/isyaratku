import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/game_angka_controller.dart';

class GameAngkaView extends GetView<GameAngkaController> {
  const GameAngkaView({super.key});
  @override
  Widget build(BuildContext context) {
    // Set status bar transparan
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(
        0xFFB5EBE9,
      ), // Warna background mint/cyan muda
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: controller.onBackTap,
                child: Image.asset(
                  'assets/icons/ic_back_1.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),

            // Instruction Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'TUNJUKKAN ISYARAT\nUNTUK ANGKA...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2753),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '1', // Ini nanti bisa diganti dengan Obx untuk angka dinamis
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2753),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/icons/img_welcome.png', // Ganti dengan gambar yang sesuai
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            // Camera Frame
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    color: const Color(
                      0xFFD9D9D9,
                    ), // Warna abu-abu untuk frame kamera
                    child: Stack(
                      children: [
                        // Corner frames hitam
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 8),
                                left: BorderSide(color: Colors.black, width: 8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 8),
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 8,
                                ),
                                left: BorderSide(color: Colors.black, width: 8),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 8,
                                ),
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Instruction Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Arahkan kamera ke kartu di sini',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2753),
                ),
              ),
            ),

            // Upload from Gallery Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xFF1E40AF), width: 2),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: controller.uploadFromGallery,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo_library_outlined,
                          color: Color(0xFF1E40AF),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Upload dari Galeri',
                          style: TextStyle(
                            color: Color(0xFF1E40AF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Help Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: GestureDetector(
                  onTap: controller.showHelp,
                  child: Image.asset(
                    'assets/icons/ic_tanya.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
