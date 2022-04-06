import 'package:get/get.dart';

import '../controllers/therapeutic_training_services_controller.dart';

class TherapeuticTrainingServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TherapeuticTrainingServicesController>(
      () => TherapeuticTrainingServicesController(),
    );
  }
}
