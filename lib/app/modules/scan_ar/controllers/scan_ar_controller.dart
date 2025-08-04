import 'package:get/get.dart';
// import 'package:camera/camera.dart'; // commented untuk sementara
// import 'package:image_picker/image_picker.dart'; // commented untuk sementara

class ScanArController extends GetxController {
  // late CameraController cameraController; // commented untuk sementara
  // final ImagePicker _picker = ImagePicker(); // commented untuk sementara

  // Observable untuk status kamera
  var isCameraInitialized = false.obs;
  var isScanning = false.obs;

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

  // Scan from camera (simulasi)
  Future<void> scanFromCamera() async {
    isScanning.value = true;
    print('Scanning from camera...');

    // Simulasi delay scan
    await Future.delayed(Duration(seconds: 2));

    // Navigate to hasil scan
    Get.toNamed('/hasil-scan');

    isScanning.value = false;
  }

  // Upload from gallery (simulasi untuk emulator)
  Future<void> uploadFromGallery() async {
    try {
      print('Simulasi upload dari galeri...');

      // Simulasi processing
      isScanning.value = true;
      await Future.delayed(Duration(seconds: 1));

      // Navigate to hasil scan
      Get.toNamed('/hasil-scan');

      isScanning.value = false;
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
