import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAFE4E1),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/ic_back_1.png',
                          width: 80,
                          height: 80,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E40AF),
                    ),
                  ),
                ],
              ),
            ),

            // Settings Card - sekarang di tengah vertical
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7FF2D5),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSettingItem(
                        icon: 'assets/icons/ic_handphone.png',
                        title: 'Getar',
                        control: Obx(
                          () => Switch(
                            value: controller.isGetarEnabled.value,
                            onChanged: controller.toggleGetar,
                            activeColor: const Color(0xFF1E40AF),
                            activeTrackColor: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildSettingItem(
                        icon: 'assets/icons/ic_huruf.png',
                        title: 'Ukuran Teks',
                        control: Obx(
                          () => Flexible(
                            child: Slider(
                              value: controller.ukuranTeks.value,
                              onChanged: controller.setUkuranTeks,
                              min: 0.0,
                              max: 1.0,
                              divisions: 10,
                              activeColor: const Color(0xFF1E40AF),
                              inactiveColor: Colors.grey.withOpacity(0.3),
                              thumbColor: const Color(0xFF1E40AF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String icon,
    required String title,
    required Widget control,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: Color(0xFF1E40AF),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(icon, width: 80, height: 80),
            ),
            const SizedBox(width: 20),
            Expanded(child: control),
          ],
        ),
      ],
    );
  }
}
