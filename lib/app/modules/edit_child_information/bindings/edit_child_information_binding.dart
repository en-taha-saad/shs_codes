import 'package:get/get.dart';

import '../controllers/edit_child_information_controller.dart';

class EditChildInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditChildInformationController>(
      () => EditChildInformationController(),
    );
  }
}
