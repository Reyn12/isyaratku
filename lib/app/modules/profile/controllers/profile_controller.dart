import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User Profile Data
  final userName = 'Namaku'.obs;
  final selectedAvatarIndex = 1.obs; // Default to second avatar (index 1)
  
  // Learning Progress Data
  final learningModules = <Map<String, dynamic>>[
    {
      'title': 'Alfabet',
      'progress': 60,
      'imagePath': 'assets/images/img_alfabet_profile.png',
      'progressColor': 0xFFF97316, // Orange
    },
    {
      'title': 'Angka',
      'progress': 30,
      'imagePath': 'assets/images/img_angka_profile.png',
      'progressColor': 0xFF8B5CF6, // Purple
    },
    {
      'title': 'Hewan',
      'progress': 50,
      'imagePath': 'assets/images/img_singa_profile.png',
      'progressColor': 0xFFF97316, // Orange
    },
  ].obs;

  // Avatar options
  final avatarOptions = [
    'assets/images/img_avatar1.png',
    'assets/images/img_avatar2.png',
    'assets/images/img_avatar3.png',
  ];

  @override
  void onInit() {
    super.onInit();
    // Load user data from storage if needed
    loadUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadUserData() {
    // TODO: Load user data from SharedPreferences or other storage
    // For now, using default values
  }

  void updateUserName(String newName) {
    userName.value = newName;
    // TODO: Save to storage
  }

  void selectAvatar(int index) {
    if (index >= 0 && index < avatarOptions.length) {
      selectedAvatarIndex.value = index;
      // TODO: Save to storage
    }
  }

  void continueLearning(String moduleTitle) {
    // TODO: Navigate to specific learning module
    print('Continue learning: $moduleTitle');
  }

  void goBack() {
    Get.back();
  }
}
