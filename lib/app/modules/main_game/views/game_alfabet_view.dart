import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import '../controllers/game_alfabet_controller.dart';

class GameAlfabetView extends GetView<GameAlfabetController> {
  const GameAlfabetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar transparent with dark icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFB5EBE9), // Mint background
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/icons/ic_back_1.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  // Title
                  Expanded(
                    child: const Text(
                      'Game Alfabet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2753),
                      ),
                    ),
                  ),
                  // Help button
                  GestureDetector(
                    onTap: controller.showHelpDialog,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF1E40AF), width: 2),
                      ),
                      child: const Icon(
                        Icons.help_outline,
                        color: Color(0xFF1E40AF),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Camera frame area
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFB5EBE9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        // Camera preview
                        Obx(() {
                          if (controller.isCameraInitialized.value &&
                              controller.cameraController != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: controller.cameraController!.value.previewSize!.height,
                                    height: controller.cameraController!.value.previewSize!.width,
                                    child: CameraPreview(controller.cameraController!),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                'Menginisialisasi kamera...',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                        }),

                        // Corner frames
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 6),
                                left: BorderSide(color: Colors.black, width: 6),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 6),
                                right: BorderSide(color: Colors.black, width: 6),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 6),
                                left: BorderSide(color: Colors.black, width: 6),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 6),
                                right: BorderSide(color: Colors.black, width: 6),
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

            const SizedBox(height: 30),

            // Camera and Gallery buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() {
                return Row(
                  children: [
                    // Capture button
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: controller.isScanning.value 
                              ? Colors.grey.withOpacity(0.5)
                              : const Color(0xFF1E40AF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: controller.isScanning.value 
                                ? null 
                                : controller.captureFromCamera,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.isScanning.value)
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                else
                                  Image.asset(
                                    'assets/icons/ic_camera.png',
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 24,
                                      );
                                    },
                                  ),
                                const SizedBox(width: 8),
                                Text(
                                  controller.isScanning.value 
                                      ? 'Memproses...' 
                                      : 'Ambil Foto',
                                  style: const TextStyle(
                                    color: Colors.white,
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

                    const SizedBox(width: 15),

                    // Gallery button
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: controller.isScanning.value 
                              ? Colors.grey.withOpacity(0.3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color(0xFF1E40AF), 
                            width: 2
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: controller.isScanning.value 
                                ? null 
                                : controller.uploadFromGallery,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller.isScanning.value)
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xFF1E40AF),
                                    ),
                                  )
                                else
                                  Image.asset(
                                    'assets/icons/ic_galeri.png',
                                    width: 24,
                                    height: 24,
                                    color: const Color(0xFF1E40AF),
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.photo_library,
                                        color: Color(0xFF1E40AF),
                                        size: 24,
                                      );
                                    },
                                  ),
                                const SizedBox(width: 8),
                                Text(
                                  controller.isScanning.value 
                                      ? 'Memproses...' 
                                      : 'Galeri',
                                  style: const TextStyle(
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
                  ],
                );
              }),
            ),

            // Instruction Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Arahkan kamera atau ambil foto untuk scan QR code huruf A',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0A2753),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
