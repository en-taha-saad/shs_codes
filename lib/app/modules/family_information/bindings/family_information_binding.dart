import 'package:get/get.dart';

import '../controllers/family_information_controller.dart';

class FamilyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyInformationController>(
      () => FamilyInformationController(),
    );
  }
}
