import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class InstitutionsDirectoriesController extends GetxController {
  List<String> professions = [
    "دليل العيادات و المراكز و المجمعات الطبية الخاصة",
    "دليل الصيدليات",
    "دليل المختبرات",
    "دليل المستشفيات الخاصة",
    "دليل المستشفيات و المراكز الطبية الحكومية",
    "دليل المستشفيات والخدمات العلاجية خارج العراق",
    "دليل شركات التأمين الصحي",
    "دليل مؤسسات التدريب الصحي",
    "دليل المذاخر و المكاتب العلمية",
  ];
  List routes = [
    Routes.PRIVATE_CLINICS,
    Routes.PHARMACIES,
    Routes.LABORATORIES,
    Routes.HOSPITALS,
    null,
    Routes.MEDICAL_SERVICES_OUTSIDE_IRAQ,
    Routes.HEALTH_INSURANCE_CO,
    Routes.THERAPEUTIC_TRAINING_SERVICES,
    Routes.SCIENTIFIC_BUREAU,
  ];
  List images = [
    clinicsIMG,
    pharmaciesIMG,
    labs3IMG,
    centersIMG,
    hospitalGovIMG,
    iraqIMG,
    companiesIMG,
    servicesIMG,
    offices15IMG,
  ];

  @override
  // ignore: unnecessary_overrides
  void onInit() {
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
