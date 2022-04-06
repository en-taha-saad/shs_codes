import 'package:get/get.dart';

import '../controllers/family_info_preview_controller.dart';

class FamilyInfoPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyInfoPreviewController>(
      () => FamilyInfoPreviewController(),
    );
  }
}
