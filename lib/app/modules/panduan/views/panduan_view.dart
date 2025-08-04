import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panduan_controller.dart';

class PanduanView extends GetView<PanduanController> {
  const PanduanView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4F8), // Light blue-green background
      body: SafeArea(
        child: Column(
          children: [
            // PageView untuk slide panduan
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) => controller.currentPage.value = index,
                children: [
                  _buildSlide1(),
                  _buildSlide2(),
                  _buildSlide3(),
                  _buildSlide4(),
                ],
              ),
            ),
            // Navigation buttons
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide1() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Main Game',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A), // Dark blue
            ),
          ),
          const SizedBox(height: 40),
          // Main Game Image
          Image.asset(
            'assets/images/img_panduan1.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            'Tekan icon Main Game. Di\nsini kamu bisa pilih mau\nbelajar apa. Belajar sambil\nbermain. yeay!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Latihan\nIsyarat',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 40),
          // Latihan Isyarat Image
          Image.asset(
            'assets/images/img_panduan2.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            'Tekan icon Latihan Isyarat.\nLatih isyaratmu biar makin\npintar dan lancar!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide3() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Progress-ku',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 40),
          // Progress Image
          Image.asset(
            'assets/images/img_panduan3.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            'Tekan icon Progress-ku. Lihat\nseberapa banyak yang\nsudah kamu pelajari.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide4() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 40),
          // Pengaturan Image (using same image as slide 3)
          Image.asset(
            'assets/images/img_panduan3.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            'Tekan icon Pengaturan. Atur\ntampilan dan caramu\nbelajar. Buat belajarmu jadi\nlebih seru dan pas buat\nkamu!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A8A),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildNavigationButtons() {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Back button
          GestureDetector(
            onTap: controller.backButton,
            child: Image.asset(
              'assets/icons/ic_back_2.png',
              width: 100,
              height: 100,
            ),
          ),
          // Home button
          GestureDetector(
            onTap: controller.goHome,
            child: Image.asset(
              'assets/icons/ic_home.png',
              width: 100,
              height: 100,
            ),
          ),
          // Right button (only show if not on last slide)
          if (controller.currentPage.value < 3)
            GestureDetector(
              onTap: controller.nextPage,
              child: Image.asset(
                'assets/icons/ic_right.png',
                width: 100,
                height: 100,
              ),
            )
          else
            const SizedBox(width: 50), // Placeholder for spacing
        ],
      ),
    ));
  }
}
