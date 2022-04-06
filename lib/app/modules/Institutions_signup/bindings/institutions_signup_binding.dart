import 'package:get/get.dart';

import '../controllers/institutions_signup_controller.dart';

class InstitutionsSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstitutionsSignupController>(
      () => InstitutionsSignupController(),
    );
  }
}
