import 'package:get/get.dart';

import '../controllers/clinics_reservation_controller.dart';

class ClinicsReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicsReservationController>(
      () => ClinicsReservationController(),
    );
  }
}
