import 'package:get/get.dart';

import '../controllers/select_profession_screen_controller.dart';

class SelectProfessionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectProfessionScreenController>(
      () => SelectProfessionScreenController(),
    );
  }
}
