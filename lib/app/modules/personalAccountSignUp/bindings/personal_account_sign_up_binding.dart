import 'package:get/get.dart';

import '../controllers/personal_account_sign_up_controller.dart';

class PersonalAccountSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalAccountSignUpController>(
      () => PersonalAccountSignUpController(),
    );
  }
}
