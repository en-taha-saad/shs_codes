import 'package:get/get.dart';

import '../controllers/personal_account_sign_in_controller.dart';

class PersonalAccountSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalAccountSignInController>(
      () => PersonalAccountSignInController(),
    );
  }
}
