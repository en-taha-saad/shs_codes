import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class DrugAndMaterialsDirectoriesController extends GetxController {
  List<String> professions = [
    "دليل الأدوية",
    "دليل المستلزمات الطبية",
    "دليل المواد الصيدلانية",
  ];
  List routes = [Routes.DRUGS, null, null];
  List images = [
    pharmaceuticalIMG,
    suppliesIMG,
    productsIMG,
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
