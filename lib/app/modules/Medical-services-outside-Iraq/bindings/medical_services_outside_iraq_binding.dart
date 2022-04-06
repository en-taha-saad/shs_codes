import 'package:get/get.dart';

import '../controllers/medical_services_outside_iraq_controller.dart';

class MedicalServicesOutsideIraqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalServicesOutsideIraqController>(
      () => MedicalServicesOutsideIraqController(),
    );
  }
}
