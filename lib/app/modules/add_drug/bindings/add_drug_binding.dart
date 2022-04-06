import 'package:get/get.dart';

import '../controllers/add_drug_controller.dart';

class AddDrugBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDrugController>(
      () => AddDrugController(),
    );
  }
}
