import 'package:get/get.dart';

import '../controllers/drugs_controller.dart';

class DrugsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrugsController>(
      () => DrugsController(),
    );
  }
}
