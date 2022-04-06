import 'package:get/get.dart';

import '../controllers/drug_and_materials_directories_controller.dart';

class DrugAndMaterialsDirectoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrugAndMaterialsDirectoriesController>(
      () => DrugAndMaterialsDirectoriesController(),
    );
  }
}
