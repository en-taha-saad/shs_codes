import 'package:get/get.dart';

import '../controllers/private_clinics_controller.dart';

class PrivateClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivateClinicsController>(
      () => PrivateClinicsController(),
    );
  }
}
