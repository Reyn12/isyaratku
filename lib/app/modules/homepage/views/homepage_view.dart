import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar hitam seperti halaman lain
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(
        0xFFB2F5EA,
      ), // Warna background mint/cyan muda
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Profil user di pojok kanan atas
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/icons/img_profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Gambar utama dan teks 'Isyaratku'
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/img_welcome.png', // Ini gambar anak laki-laki
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    'Isyaratku',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E40AF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Grid menu utama
              Expanded(child: _buildMenuGrid()),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk grid menu
  Widget _buildMenuGrid() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 40,
      crossAxisSpacing: 40,
      childAspectRatio: 1.1,
      children: [
        // Menu Scan AR
        _buildMenuItem(
          title: 'Scan AR',
          iconPath: 'assets/icons/ic_scan_ar.png',
          onTap: controller.goToScanAR,
          color: Colors.white,
        ),

        // Menu Main Game
        _buildMenuItem(
          title: 'Main Game',
          iconPath: 'assets/icons/ic_main_game.png',
          onTap: controller.goToMainGame,
          color: Colors.white,
        ),

        // Menu Latihan Isyarat
        _buildMenuItem(
          title: 'Latihan',
          iconPath: 'assets/icons/ic_latihan.png',
          onTap: controller.goToLatihanIsyarat,
          color: const Color(0xFFFED7D7), // Pink muda
        ),

        // Menu Progress-ku
        _buildMenuItem(
          title: 'Progress-ku',
          iconPath: 'assets/icons/ic_progress.png',
          onTap: controller.goToProgress,
          color: const Color(0xFFE9D8FD), // Ungu muda
        ),

        // Menu Panduan
        _buildMenuItem(
          title: 'Panduan',
          iconPath: 'assets/icons/ic_panduan.png',
          onTap: controller.goToPanduan,
          color: const Color(0xFFFED7D7), // Pink muda
        ),

        // Menu Pengaturan
        _buildMenuItem(
          title: 'Pengaturan',
          iconPath: 'assets/icons/ic_pengaturan.png',
          onTap: controller.goToPengaturan,
          color: const Color(0xFFE9D8FD), // Ungu muda
        ),
      ],
    );
  }

  // Widget untuk item menu
  Widget _buildMenuItem({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Material(
        color: color, // Pindahkan warna ke Material
        borderRadius: BorderRadius.circular(24),
        clipBehavior:
            Clip.antiAlias, // Tambahkan ini agar splash tidak keluar dari border
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 80, height: 80),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E40AF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
