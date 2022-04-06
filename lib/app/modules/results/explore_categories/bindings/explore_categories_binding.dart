import 'package:get/get.dart';

import '../controllers/explore_categories_controller.dart';

class ExploreCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreCategoriesController>(
      () => ExploreCategoriesController(),
    );
  }
}
