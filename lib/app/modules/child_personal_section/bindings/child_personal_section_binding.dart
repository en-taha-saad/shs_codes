import 'package:get/get.dart';

import '../controllers/child_personal_section_controller.dart';

class ChildPersonalSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildPersonalSectionController>(
      () => ChildPersonalSectionController(),
    );
  }
}
