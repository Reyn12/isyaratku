import 'dart:async';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

class LatihanController extends GetxController {
  // Camera variables
  CameraController? cameraController;
  final isCameraInitialized = false.obs;
  
  // Timer variables
  final countdown = 10.obs;
  final isTraining = false.obs;
  Timer? _timer;
  
  @override
  void onInit() {
    super.onInit();
    _initCamera();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
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
      Get.snackbar('Error', 'Gagal menginisialisasi kamera');
    }
  }

  // Start training with countdown
  void startTraining() {
    isTraining.value = true;
    countdown.value = 10;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        _finishTraining();
      }
    });
  }

  // Finish training and go to result
  void _finishTraining() {
    isTraining.value = false;
    Get.toNamed('/hasil-latihan');
  }

  // Back button
  void onBackTap() {
    Get.back();
  }
}
