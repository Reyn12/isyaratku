import 'package:get/get.dart';

import 'package:isyaratku/app/modules/main_game/controllers/game_angka_controller.dart';
import 'package:isyaratku/app/modules/main_game/controllers/game_alfabet_controller.dart';

import '../controllers/main_game_controller.dart';

class MainGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameAngkaController>(
      () => GameAngkaController(),
    );
    Get.lazyPut<GameAlfabetController>(
      () => GameAlfabetController(),
    );
    Get.lazyPut<MainGameController>(
      () => MainGameController(),
    );
  }
}
