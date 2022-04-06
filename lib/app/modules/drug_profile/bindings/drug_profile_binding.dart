import 'package:get/get.dart';

import '../controllers/drug_profile_controller.dart';

class DrugProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrugProfileController>(
      () => DrugProfileController(),
    );
  }
}
