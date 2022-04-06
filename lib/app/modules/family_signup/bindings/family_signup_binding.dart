import 'package:get/get.dart';

import '../controllers/family_signup_controller.dart';

class FamilySignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilySignupController>(
      () => FamilySignupController(),
    );
  }
}
