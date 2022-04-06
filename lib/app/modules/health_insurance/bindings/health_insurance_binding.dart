import 'package:get/get.dart';

import '../controllers/health_insurance_controller.dart';

class HealthInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthInsuranceController>(
      () => HealthInsuranceController(),
    );
  }
}
