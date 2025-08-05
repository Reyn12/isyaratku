import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4F8), // Light teal background
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),

            // Profile Avatar Section
            _buildProfileAvatar(),

            // Avatar Selection Section
            _buildAvatarSelection(),

            // Continue Learning Section
            _buildContinueLearning(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(
              'assets/icons/ic_back_1.png',
              width: 80,
              height: 80,
            ),
          ),
          // const SizedBox(width: 40), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Column(
      children: [
        const Text(
          'Profilku',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A), // Dark blue
          ),
        ),
        // Main Avatar
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/icons/img_profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Name Section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bambang Firman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A8A), // Dark blue
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/icons/ic_pengaturan.png', // Using pengaturan icon as pencil
              width: 20,
              height: 20,
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildAvatarSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Avatar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16A34A), // Green
            ),
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAvatarOption('assets/images/img_avatar1.png', false),
            _buildAvatarOption(
              'assets/images/img_avatar2.png',
              true,
            ), // Selected
            _buildAvatarOption('assets/images/img_avatar3.png', false),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildAvatarOption(String imagePath, bool isSelected) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border:
            isSelected
                ? Border.all(color: const Color(0xFF16A34A), width: 3)
                : null,
        boxShadow:
            isSelected
                ? [
                  BoxShadow(
                    color: const Color(0xFF16A34A).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildContinueLearning() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Lanjutkan Mainku',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16A34A), // Green
              ),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildLearningModule(
                  'assets/images/img_alfabet_profile.png',
                  'Alfabet',
                  60,
                  const Color(0xFFF97316), // Orange
                ),
                const SizedBox(height: 16),
                _buildLearningModule(
                  'assets/images/img_angka_profile.png',
                  'Angka',
                  30,
                  const Color(0xFF8B5CF6), // Purple
                ),
                const SizedBox(height: 16),
                _buildLearningModule(
                  'assets/images/img_singa_profile.png',
                  'Hewan',
                  50,
                  const Color(0xFFF97316), // Orange
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningModule(
    String imagePath,
    String title,
    int progress,
    Color progressColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Module Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: progressColor.withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),

          // Module Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A8A), // Dark blue
                      ),
                    ),
                    Text(
                      '$progress%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A8A), // Dark blue
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Progress Bar
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: progressColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Continue Button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4F8), // Light teal
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Lanjut',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A8A), // Dark blue
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
