import 'package:get/get.dart';

import '../controllers/charity_directories_controller.dart';

class CharityDirectoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharityDirectoriesController>(
      () => CharityDirectoriesController(),
    );
  }
}
