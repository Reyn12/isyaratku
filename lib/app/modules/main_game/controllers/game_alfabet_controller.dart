import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';

class GameAlfabetController extends GetxController {
  CameraController? cameraController;
  final ImagePicker _picker = ImagePicker();

  // Observable variables
  var isCameraInitialized = false.obs;
  var isScanning = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  // Initialize camera
  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController = CameraController(
          cameras.first,
          ResolutionPreset.medium,
        );
        await cameraController!.initialize();
        isCameraInitialized.value = true;
      }
    } catch (e) {
      print('Error initializing camera: $e');
      Get.snackbar(
        'Error',
        'Gagal menginisialisasi kamera: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Capture photo from camera and process
  Future<void> captureFromCamera() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      Get.snackbar(
        'Error',
        'Kamera belum siap. Silakan tunggu sebentar.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isScanning.value = true;
    print('=== DEBUG: Capturing from camera... ===');

    try {
      final XFile photo = await cameraController!.takePicture();
      print('=== DEBUG: Photo captured: ${photo.path} ===');
      
      await _processUploadedImage(photo.path);
    } catch (e) {
      print('=== DEBUG: Error capturing photo: $e ===');
      Get.snackbar(
        'Error',
        'Gagal mengambil foto: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isScanning.value = false;
  }

  // Upload from gallery and process
  Future<void> uploadFromGallery() async {
    isScanning.value = true;
    print('=== DEBUG: Upload from gallery started ===');

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      
      if (image != null) {
        print('=== DEBUG: Image selected: ${image.path} ===');
        await _processUploadedImage(image.path);
      } else {
        print('=== DEBUG: No image selected ===');
      }
    } catch (e) {
      print('=== DEBUG: Error uploading from gallery: $e ===');
      Get.snackbar(
        'Error',
        'Gagal upload gambar: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isScanning.value = false;
  }

  // Process uploaded image with QR code scanning
  Future<void> _processUploadedImage(String imagePath) async {
    try {
      print('=== DEBUG: Processing image: $imagePath ===');
      
      // Scan QR code using Google ML Kit
      final inputImage = InputImage.fromFilePath(imagePath);
      final barcodeScanner = BarcodeScanner();
      final List<Barcode> barcodes = await barcodeScanner.processImage(inputImage);
      barcodeScanner.close();

      String scannedResult = 'B'; // Default fallback
      
      if (barcodes.isNotEmpty) {
        final String scannedValue = barcodes.first.displayValue ?? '';
        print('=== DEBUG: QR Code found: $scannedValue ===');
        
        // Validate that result is A-E
        if (RegExp(r'^[A-E]$').hasMatch(scannedValue.toUpperCase())) {
          scannedResult = scannedValue.toUpperCase();
        } else {
          print('=== DEBUG: Invalid QR result, using fallback ===');
          scannedResult = _fallbackDetection(imagePath);
        }
      } else {
        print('=== DEBUG: No QR code found, using fallback ===');
        scannedResult = _fallbackDetection(imagePath);
      }

      print('=== DEBUG: Final scan result: $scannedResult ===');

      // Navigate based on result
      if (scannedResult == 'A') {
        // Correct answer - show success page
        Get.toNamed('/hasil-scan-alfabet-benar');
      } else {
        // Wrong answer - show error page
        Get.toNamed('/hasil-scan-alfabet-salah');
      }

    } catch (e) {
      print('=== DEBUG: Error processing image: $e ===');
      Get.snackbar(
        'Error',
        'Gagal memproses gambar: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Fallback detection if QR scan fails
  String _fallbackDetection(String imagePath) {
    try {
      // Try to extract letter from filename
      final filename = imagePath.split('/').last.toLowerCase();
      print('=== DEBUG: Fallback detection from filename: $filename ===');
      
      if (filename.contains('a')) return 'A';
      if (filename.contains('b')) return 'B';
      if (filename.contains('c')) return 'C';
      if (filename.contains('d')) return 'D';
      if (filename.contains('e')) return 'E';
      
      return 'B'; // Default to wrong answer
    } catch (e) {
      print('=== DEBUG: Fallback detection error: $e ===');
      return 'B';
    }
  }

  // Show help dialog
  void showHelpDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Cara Bermain',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E40AF),
          ),
        ),
        content: const Text(
          '1. Ambil foto QR code huruf A menggunakan kamera\n'
          '2. Atau upload gambar QR code dari galeri\n'
          '3. Sistem akan memindai QR code\n'
          '4. Jika QR code huruf A, akan muncul halaman sukses\n'
          '5. Jika bukan huruf A, akan muncul halaman error',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Mengerti',
              style: TextStyle(
                color: Color(0xFF1E40AF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
