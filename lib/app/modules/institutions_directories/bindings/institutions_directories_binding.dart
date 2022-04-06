import 'package:get/get.dart';

import '../controllers/institutions_directories_controller.dart';

class InstitutionsDirectoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstitutionsDirectoriesController>(
      () => InstitutionsDirectoriesController(),
    );
  }
}
