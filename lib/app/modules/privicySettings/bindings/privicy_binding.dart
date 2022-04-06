import 'package:get/get.dart';

import '../controllers/privicy_controller.dart';

class PrivicySettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivicySettingsController>(
      () => PrivicySettingsController(),
    );
  }
}
