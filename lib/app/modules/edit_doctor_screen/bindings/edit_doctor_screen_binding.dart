import 'package:get/get.dart';

import '../controllers/edit_doctor_screen_controller.dart';

class EditDoctorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDoctorScreenController>(
      () => EditDoctorScreenController(),
    );
  }
}
