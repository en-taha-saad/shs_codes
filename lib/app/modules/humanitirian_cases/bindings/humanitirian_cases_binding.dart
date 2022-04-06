import 'package:get/get.dart';

import '../controllers/humanitirian_cases_controller.dart';

class HumanitirianCasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HumanitirianCasesController>(
      () => HumanitirianCasesController(),
    );
  }
}
