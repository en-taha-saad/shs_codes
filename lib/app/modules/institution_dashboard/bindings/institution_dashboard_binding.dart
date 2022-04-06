import 'package:get/get.dart';

import '../controllers/institution_dashboard_controller.dart';

class InstitutionDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstitutionDashboardController>(
      () => InstitutionDashboardController(),
    );
  }
}
