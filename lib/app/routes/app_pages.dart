import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/panduan/bindings/panduan_binding.dart';
import '../modules/panduan/views/panduan_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scan_ar/bindings/scan_ar_binding.dart';
import '../modules/scan_ar/views/hasil_scan_view.dart';
import '../modules/scan_ar/views/scan_ar_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SCAN_AR,
      page: () => const ScanArView(),
      binding: ScanArBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.HASIL_SCAN,
      page: () => const HasilScanView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      // tidak perlu binding karena pakai GetView biasa
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.PANDUAN,
      page: () => const PanduanView(),
      binding: PanduanBinding(),
    ),
  ];
}
