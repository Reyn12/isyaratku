import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:camera/camera.dart'; // commented untuk sementara

import '../controllers/scan_ar_controller.dart';

class ScanArView extends GetView<ScanArController> {
  const ScanArView({super.key});

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
          children: [
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
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Scan AR',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E40AF),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Scan frame area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFAFE4E1), // Warna tosca sesuai gambar
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Corner frames hitam yang lebih besar
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 70, // Lebih besar
                          height: 70, // Lebih besar
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
                          width: 70, // Lebih besar
                          height: 70, // Lebih besar
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 8),
                              right: BorderSide(color: Colors.black, width: 8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 70, // Lebih besar
                          height: 70, // Lebih besar
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black, width: 8),
                              left: BorderSide(color: Colors.black, width: 8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 70, // Lebih besar
                          height: 70, // Lebih besar
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black, width: 8),
                              right: BorderSide(color: Colors.black, width: 8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Tombol scan yang naik setengah ke frame
            Transform.translate(
              offset: const Offset(0, -80), // Menggeser ke atas 50 pixel
              child: Obx(
                () => GestureDetector(
                  onTap:
                      controller.isScanning.value
                          ? null
                          : () {
                            controller.scanFromCamera();
                          },
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child:
                        controller.isScanning.value
                            ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : ClipOval(
                              child: Image.asset(
                                'assets/images/img_btn_scan.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.qr_code_scanner,
                                    size: 50,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            ),
                  ),
                ),
              ),
            ),

            // Instruction text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Tekan icon Scan lalu Arahkan\nkamera ke kartu alfabet (A-E)\natau angka (0-5) untuk\nmenampilkan model 3D\ngerakan bahasa isyarat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF1E40AF),
                  height: 1.3,
                ),
              ),
            ),

            // Main Scan button
            const Spacer(),

            // Upload button - stylish design
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: controller.isScanning.value 
                        ? Colors.grey.withOpacity(0.3)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFF1E40AF), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: controller.isScanning.value
                          ? null
                          : () {
                              controller.uploadFromGallery();
                            },
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
                            const Icon(
                              Icons.photo_library_outlined,
                              color: Color(0xFF1E40AF),
                              size: 20,
                            ),
                          const SizedBox(width: 8),
                          Text(
                            controller.isScanning.value
                                ? 'Memproses...'
                                : 'Upload dari Galeri',
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
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
