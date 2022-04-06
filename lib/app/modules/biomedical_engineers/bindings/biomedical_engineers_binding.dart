import 'package:get/get.dart';

import '../controllers/biomedical_engineers_controller.dart';

class BiomedicalEngineersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiomedicalEngineersController>(
      () => BiomedicalEngineersController(),
    );
  }
}
