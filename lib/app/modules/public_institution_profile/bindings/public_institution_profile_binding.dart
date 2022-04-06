import 'package:get/get.dart';

import '../controllers/public_institution_profile_controller.dart';

class PublicInstitutionProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicInstitutionProfileController>(
      () => PublicInstitutionProfileController(),
    );
  }
}
