import 'package:get/get.dart';

import '../controllers/pharmacists_controller.dart';

class PharmacistsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmacistsController>(
      () => PharmacistsController(),
    );
  }
}
