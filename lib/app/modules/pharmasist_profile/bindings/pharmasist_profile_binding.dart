import 'package:get/get.dart';

import '../controllers/pharmasist_profile_controller.dart';

class PharmasistProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmasistProfileController>(
      () => PharmasistProfileController(),
    );
  }
}
