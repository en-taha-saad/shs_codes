import 'package:get/get.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/public_institution_profile/controllers/public_institution_profile_provider.dart';

class PublicInstitutionProfileController extends GetxController {
  Future<InstitutionsProfile>? getPublicInstituionsVar;
  @override
  void onInit() {
    getPublicInstituionsVar = getPublicInstituions();
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
