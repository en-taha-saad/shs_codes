import 'package:get/get.dart';

import '../controllers/medical_and_humanitarian_societies_controller.dart';

class MedicalAndHumanitarianSocietiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalAndHumanitarianSocietiesController>(
      () => MedicalAndHumanitarianSocietiesController(),
    );
  }
}
