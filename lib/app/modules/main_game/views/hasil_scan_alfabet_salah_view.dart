import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HasilScanAlfabetSalahView extends StatefulWidget {
  const HasilScanAlfabetSalahView({super.key});  
  
  @override
  State<HasilScanAlfabetSalahView> createState() => _HasilScanAlfabetSalahViewState();
}

class _HasilScanAlfabetSalahViewState extends State<HasilScanAlfabetSalahView> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // Animation controllers
    late AnimationController iconController;
    late AnimationController textController;
    late Animation<double> iconAnimation;
    late Animation<double> textAnimation;

    iconController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    iconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: iconController,
      curve: Curves.elasticOut,
    ));

    textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: textController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    iconController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      textController.forward();
    });

    // Set status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFB5EBE9), // Background mint/cyan muda
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/icons/ic_back_1.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),

              // Main content - centered
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated cross icon
                    AnimatedBuilder(
                      animation: iconAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: iconAnimation.value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444), // Red background
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFEF4444).withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    // Animated error message
                    AnimatedBuilder(
                      animation: textAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: textAnimation.value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - textAnimation.value)),
                            child: const Text(
                              'Jawaban Salah!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF4444), // Red color
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Additional message
                    AnimatedBuilder(
                      animation: textAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: textAnimation.value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - textAnimation.value)),
                            child: const Text(
                              'Coba scan QR code huruf A\nyang benar!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6B7280),
                                height: 1.4,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Try again button
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E40AF), // Blue
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Coba Lagi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
