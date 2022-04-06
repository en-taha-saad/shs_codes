import 'package:get/get.dart';

import '../controllers/filters_results_controller.dart';

class FiltersResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FiltersResultsController>(
      () => FiltersResultsController(),
    );
  }
}
