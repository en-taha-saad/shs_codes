import 'package:get/get.dart';

import '../controllers/health_insurance_co_controller.dart';

class HealthInsuranceCoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthInsuranceCoController>(
      () => HealthInsuranceCoController(),
    );
  }
}
