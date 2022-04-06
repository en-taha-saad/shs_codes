import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class CharityDirectoriesController extends GetxController {
  List<String> professions = [
    "الجمعيات الطبية والإنسانية",
    "خدمة الحالات الإنسانية",
    "خدمة الرعاية الخاصة",
  ];
  List routes = [
    Routes.MEDICAL_AND_HUMANITARIAN_SOCIETIES,
    Routes.HUMANITIRIAN_CASES,
    null,
  ];
  List images = [
    associationsIMG,
    casesIMG,
    i16IMG,
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
