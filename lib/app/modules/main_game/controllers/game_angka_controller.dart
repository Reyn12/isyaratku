import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

class GameAngkaController extends GetxController {

  var isScanning = false.obs;
  var currentAngka = '1'.obs; // Default angka yang ditampilkan
  
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
    super.onClose();
  }

  // Method untuk kembali ke halaman sebelumnya
  void onBackTap() {
    print('Back button tapped');
    Get.back();
  }

  // Method untuk scan dari kamera
  Future<void> scanFromCamera() async {
    isScanning.value = true;
    print('Scanning angka from camera...');

    try {
      // Simulasi delay untuk scan
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Implementasi scan kamera yang sebenarnya
      
      // Simulasi hasil scan
      print('Camera scan completed');
    } catch (e) {
      print('Error scanning from camera: $e');
      Get.snackbar(
        'Error',
        'Gagal scan dari kamera: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isScanning.value = false;
  }

  // Method untuk upload dari galeri
  Future<void> uploadFromGallery() async {
    try {
      print('Upload from gallery tapped');
      
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      
      if (image != null) {
        print('Image selected: ${image.path}');
        
        // Simulasi proses deteksi QR code atau angka
        // Dalam implementasi nyata, ini akan menggunakan ML atau QR code scanner
        await _processUploadedImage(image.path);
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
      Get.snackbar(
        'Error',
        'Gagal memilih gambar dari galeri',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
  
  // Method untuk memproses gambar yang di-upload
  Future<void> _processUploadedImage(String imagePath) async {
    try {
      print('Processing uploaded image: $imagePath');
      
      // Simulasi delay untuk processing
      await Future.delayed(const Duration(seconds: 1));
      
      // Baca file gambar
      final File imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        throw Exception('File gambar tidak ditemukan');
      }
      
      // Untuk sekarang, kita simulasi scan QR berdasarkan nama file atau metadata
      // Dalam implementasi nyata, ini akan menggunakan QR code scanner library
      String scanResult = await _simulateQRScan(imagePath);
      
      print('Scan result: $scanResult');
      
      // Cek apakah hasil sesuai dengan target (angka 1)
      if (scanResult == '1') {
        // Benar - redirect ke halaman hasil benar
        Get.toNamed('/hasil-scan-angka-benar', arguments: {
          'result': scanResult,
          'isCorrect': true,
        });
      } else {
        // Salah - redirect ke halaman hasil salah
        Get.toNamed('/hasil-scan-angka-salah', arguments: {
          'result': scanResult,
          'isCorrect': false,
        });
      }
      
    } catch (e) {
      print('Error processing image: $e');
      Get.snackbar(
        'Error',
        'Gagal memproses gambar: ${e.toString()}',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
  
  // Method untuk scan QR code menggunakan Google ML Kit
  Future<String> _simulateQRScan(String imagePath) async {
    try {
      print('Scanning QR code from image: $imagePath');
      
      // Buat InputImage dari file path
      final inputImage = InputImage.fromFilePath(imagePath);
      
      // Inisialisasi BarcodeScanner
      final barcodeScanner = BarcodeScanner();
      
      // Scan barcode/QR code
      final List<Barcode> barcodes = await barcodeScanner.processImage(inputImage);
      
      // Tutup scanner
      barcodeScanner.close();
      
      if (barcodes.isNotEmpty) {
        // Ambil hasil scan pertama
        final String scannedValue = barcodes.first.displayValue ?? '';
        print('QR Code detected: $scannedValue');
        
        // Validasi apakah hasil adalah angka 1-5
        if (RegExp(r'^[1-5]$').hasMatch(scannedValue)) {
          return scannedValue;
        } else {
          print('QR code tidak valid atau bukan angka 1-5: $scannedValue');
          // Jika QR code ada tapi bukan angka 1-5, anggap salah
          return '0'; // Akan selalu salah
        }
      } else {
        print('Tidak ada QR code yang terdeteksi');
        // Jika tidak ada QR code terdeteksi, gunakan fallback
        return _fallbackDetection(imagePath);
      }
      
    } catch (e) {
      print('Error in QR scan: $e');
      // Jika ada error, gunakan fallback
      return _fallbackDetection(imagePath);
    }
  }
  
  // Method fallback jika QR scanner gagal
  Future<String> _fallbackDetection(String imagePath) async {
    try {
      print('Using fallback detection for: $imagePath');
      
      // Analisis nama file untuk hint
      final fileName = imagePath.toLowerCase();
      
      // Cari angka di nama file
      final RegExp numberRegex = RegExp(r'[1-5]');
      final Match? match = numberRegex.firstMatch(fileName);
      
      if (match != null) {
        final String detectedNumber = match.group(0)!;
        print('Detected number from filename: $detectedNumber');
        return detectedNumber;
      }
      
      // Jika tidak ada di nama file, kembalikan hasil random untuk testing
      final List<String> fallbackResults = ['1', '2', '3', '4', '5'];
      final String result = fallbackResults[DateTime.now().millisecond % fallbackResults.length];
      print('Using random fallback: $result');
      return result;
      
    } catch (e) {
      print('Error in fallback detection: $e');
      return '1'; // Default ke 1 jika semua gagal
    }
  }

  // Method untuk menampilkan bantuan
  void showHelp() {
    print('Help button tapped');
    Get.dialog(
      AlertDialog(
        title: const Text('Bantuan'),
        content: const Text(
          'Arahkan kamera ke kartu angka atau upload gambar dari galeri untuk melihat gerakan bahasa isyarat yang sesuai.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
