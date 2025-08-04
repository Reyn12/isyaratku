import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';
// import 'package:camera/camera.dart'; // commented untuk sementara

class ScanArController extends GetxController {
  // late CameraController cameraController; // commented untuk sementara
  final ImagePicker _picker = ImagePicker();

  // Observable untuk status kamera
  var isCameraInitialized = false.obs;
  var isScanning = false.obs;
  var scannedResult = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // initCamera(); // commented untuk sementara
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // cameraController.dispose(); // commented untuk sementara
    super.onClose();
  }

  // Method untuk scan QR code dari image
  Future<String> scanQRFromImage(String imagePath) async {
    try {
      print('=== DEBUG: Scanning QR from image: $imagePath ===');
      
      // Scan QR code dengan google_ml_kit
      final inputImage = InputImage.fromFilePath(imagePath);
      print('=== DEBUG: InputImage created ===');
      
      final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
      print('=== DEBUG: BarcodeScanner created ===');
      
      final List<Barcode> barcodes = await barcodeScanner.processImage(inputImage);
      print('=== DEBUG: Process image completed ===');
      print('=== DEBUG: Found ${barcodes.length} barcodes ===');
      
      // Print semua barcode yang ditemukan
      for (int i = 0; i < barcodes.length; i++) {
        final barcode = barcodes[i];
        print('=== DEBUG: Barcode $i - Type: ${barcode.type} ===');
        print('=== DEBUG: Barcode $i - Raw value: ${barcode.rawValue} ===');
        print('=== DEBUG: Barcode $i - Display value: ${barcode.displayValue} ===');
      }
      
      if (barcodes.isNotEmpty) {
        final barcode = barcodes.first;
        final rawValue = barcode.rawValue;
        print('=== DEBUG: Using first barcode ===');
        print('=== DEBUG: Barcode type: ${barcode.type} ===');
        print('=== DEBUG: Barcode raw value: $rawValue ===');
        print('=== DEBUG: Barcode display value: ${barcode.displayValue} ===');
        
        if (rawValue != null) {
          // Pastikan hasil scan adalah A, B, C, D, E atau 0, 1, 2, 3, 4, 5
          final cleanValue = rawValue.trim().toUpperCase();
          print('=== DEBUG: Clean value: $cleanValue ===');
          print('=== DEBUG: Valid values: [A, B, C, D, E, 0, 1, 2, 3, 4, 5] ===');
          print('=== DEBUG: Is valid: ${['A', 'B', 'C', 'D', 'E', '0', '1', '2', '3', '4', '5'].contains(cleanValue)} ===');
          
          if (['A', 'B', 'C', 'D', 'E', '0', '1', '2', '3', '4', '5'].contains(cleanValue)) {
            print('=== DEBUG: Valid QR result: $cleanValue ===');
            return cleanValue;
          } else {
            print('=== DEBUG: Invalid QR result: $cleanValue, using fallback ===');
            return 'A'; // Fallback klo bukan A-E atau 0-5
          }
        } else {
          print('=== DEBUG: No raw value found, using fallback ===');
          return 'A'; // Fallback klo ga ada value
        }
      } else {
        print('=== DEBUG: No barcodes found, using fallback ===');
        return 'A'; // Fallback klo ga ada barcode
      }
      
    } catch (e) {
      print('=== DEBUG: Error in scanQRFromImage: $e ===');
      print('=== DEBUG: Error stack trace: ${StackTrace.current} ===');
      return 'A'; // Fallback ke A klo error
    }
  }

  // Initialize camera (commented untuk sementara)
  /*
  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController = CameraController(
          cameras.first,
          ResolutionPreset.medium,
        );
        await cameraController.initialize();
        isCameraInitialized.value = true;
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }
  */

  // Scan from camera (real scan)
  Future<void> scanFromCamera() async {
    isScanning.value = true;
    print('=== DEBUG: Scanning from camera... ===');

    try {
      // Di sini kamu implement camera QR scanner yang beneran
      // Contoh dengan qr_code_scanner atau mobile_scanner
      
      // Untuk sementara, simulasi delay
      await Future.delayed(Duration(seconds: 2));
      
      // Simulasi hasil scan dari camera
      // Nanti ganti dengan hasil scan yang beneran
      scannedResult.value = 'A'; // Default, nanti ganti dengan hasil scan QR

      print('=== DEBUG: Camera scan result: ${scannedResult.value} ===');

      // Navigate to hasil scan dengan data
      Get.toNamed('/hasil-scan', arguments: {'result': scannedResult.value});
    } catch (e) {
      print('=== DEBUG: Error scanning from camera: $e ===');
      Get.snackbar(
        'Error',
        'Gagal scan dari camera: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isScanning.value = false;
  }

  // Upload from gallery (beneran upload dan scan QR)
  Future<void> uploadFromGallery() async {
    try {
      print('=== DEBUG: Upload dari galeri dimulai ===');
      isScanning.value = true;

      // Pick image dari galeri
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        print('=== DEBUG: Image selected: ${image.path} ===');
        
        // Scan QR code dari image yang dipilih
        print('=== DEBUG: Memulai scan QR dari image ===');
        
        try {
          // Baca file image
          File imageFile = File(image.path);
          if (await imageFile.exists()) {
            print('=== DEBUG: Image file exists ===');
            print('=== DEBUG: Image file size: ${await imageFile.length()} bytes ===');
            
            // Scan QR code dengan google_ml_kit
            String qrResult = await scanQRFromImage(image.path);
            scannedResult.value = qrResult;
            
            print('=== DEBUG: QR Code detected: ${scannedResult.value} ===');
            print('=== DEBUG: Scanned result value: ${scannedResult.value} ===');

            // Navigate to hasil scan dengan data
            print('=== DEBUG: Navigate ke hasil-scan dengan data: ${scannedResult.value} ===');
            Get.toNamed('/hasil-scan', arguments: {'result': scannedResult.value});
          } else {
            print('=== DEBUG: Image file not found ===');
            Get.snackbar(
              'Error',
              'File gambar tidak ditemukan',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } catch (e) {
          print('=== DEBUG: Error scanning QR: $e ===');
          Get.snackbar(
            'Error',
            'Gagal scan QR code: $e',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        print('=== DEBUG: No image selected ===');
        Get.snackbar(
          'Error',
          'Tidak ada gambar yang dipilih',
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      isScanning.value = false;
      print('=== DEBUG: Upload selesai, isScanning = false ===');
    } catch (e) {
      print('=== DEBUG: Error uploading image: $e ===');
      isScanning.value = false;
      Get.snackbar(
        'Error',
        'Gagal upload gambar: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
