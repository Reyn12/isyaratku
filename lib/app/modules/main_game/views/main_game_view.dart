import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_game_controller.dart';

class MainGameView extends GetView<MainGameController> {
  const MainGameView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFB5EBE9,
      ), // Warna background mint/cyan muda
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: controller.onBackTap,
                child: Image.asset(
                  'assets/icons/ic_back_1.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),

            // Header Text
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Yuk Main dan Belajar\nBahasa Isyarat!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2753), // Warna biru tua
                ),
              ),
            ),

            // Game Buttons Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    // Alfabet Button
                    _buildGameButton(
                      image: 'assets/images/btn_game_alfabet.png',
                      onTap: controller.onAlfabetTap,
                    ),

                    // Angka Button
                    _buildGameButton(
                      image: 'assets/images/btn_game_angka.png',
                      onTap: controller.onAngkaTap,
                    ),

                    // Hewan Button
                    _buildGameButton(
                      image: 'assets/images/btn_game_hewan.png',
                      onTap: controller.onHewanTap,
                    ),

                    // Buah dan Makanan Button
                    _buildGameButton(
                      image: 'assets/images/btn_game_buah_makanan.png',
                      onTap: controller.onBuahMakananTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameButton({
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 120, // Ukuran gambar diperbesar
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
