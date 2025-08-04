import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HasilScanView extends GetView {
  const HasilScanView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data dari arguments
    final arguments = Get.arguments as Map<String, dynamic>?;
    final String scanResult = arguments?['result'] ?? 'A'; // Default ke A klo ga ada data
    
    // Debug print
    print('=== DEBUG HASIL SCAN VIEW ===');
    print('=== DEBUG: Arguments: $arguments ===');
    print('=== DEBUG: Scan result: $scanResult ===');
    
    // Tentukan folder berdasarkan hasil scan (alfabet atau angka)
    final bool isAlfabet = ['A', 'B', 'C', 'D', 'E'].contains(scanResult.toUpperCase());
    final String folder = isAlfabet ? 'alfabet' : 'angka';
    final String imagePath = 'assets/images/$folder/img_isyarat_${scanResult.toLowerCase()}.png';
    
    print('=== DEBUG: Is alfabet: $isAlfabet ===');
    print('=== DEBUG: Folder: $folder ===');
    print('=== DEBUG: Image path: $imagePath ===');
    
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
                          // Gambar isyarat sesuai hasil scan
                          Image.asset(
                            imagePath,
                            height: 250,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              // Debug error
                              print('=== DEBUG: Image error: $error ===');
                              print('=== DEBUG: Image path: $imagePath ===');
                              print('=== DEBUG: Stack trace: $stackTrace ===');
                              
                              // Fallback klo gambar ga ada
                              return Container(
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    isAlfabet ? 'Huruf $scanResult' : 'Angka $scanResult',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E40AF),
                                    ),
                                  ),
                                ),
                              );
                            },
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

                          Text(
                            'Ini adalah Bahasa Isyarat\nhuruf $scanResult',
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
