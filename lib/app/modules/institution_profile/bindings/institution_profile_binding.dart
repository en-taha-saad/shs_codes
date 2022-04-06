import 'package:get/get.dart';

import '../controllers/institution_profile_controller.dart';

class InstitutionProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstitutionProfileController>(
      () => InstitutionProfileController(),
    );
  }
}
