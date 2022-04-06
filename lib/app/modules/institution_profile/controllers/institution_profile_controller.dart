import 'package:get/get.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/institution_profile/providers/institutions_provider.dart';

class InstitutionProfileController extends GetxController {
  Future<InstitutionsProfile>? getInstituionsVar;
  @override
  void onInit() {
    getInstituionsVar = getInstituions();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
