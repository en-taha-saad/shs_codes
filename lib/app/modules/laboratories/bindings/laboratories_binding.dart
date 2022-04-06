import 'package:get/get.dart';

import '../controllers/laboratories_controller.dart';

class LaboratoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaboratoriesController>(
      () => LaboratoriesController(),
    );
  }
}
