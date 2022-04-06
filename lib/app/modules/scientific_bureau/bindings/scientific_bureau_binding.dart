import 'package:get/get.dart';

import '../controllers/scientific_bureau_controller.dart';

class ScientificBureauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScientificBureauController>(
      () => ScientificBureauController(),
    );
  }
}
