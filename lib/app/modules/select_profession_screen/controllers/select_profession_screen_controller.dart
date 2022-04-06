import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/main.dart';

class SelectProfessionScreenController extends GetxController {
  List<String> professions = [
    'طبيب',
    'صيدلي',
    'محلل مختبرات',
    'ممارس تمريض',
    'إداري صحي',
    'فني طبي',
    'فني صيانة وتشغيل',
    'مهندس اجهزة طبية',
    'مهندسي طب حياتي',
    'إداري',
    'دعم حياتي',
    'كادر إسعاف',
  ];
  List<Color> professionsColors = [
    Colors.green,
    Colors.green,
    Colors.red,
    Colors.red,
    Colors.amber,
    Colors.amber,
    Colors.brown,
    Colors.brown,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.teal,
    Colors.teal,
  ];
  List routes = [
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
    Routes.SIGNUP,
  ];
  List images = [
    'assets/onle_for_second_app/professions/1doctor.jpg',
    'assets/onle_for_second_app/professions/2pharmacist.jpg',
    'assets/onle_for_second_app/professions/3Analyzer.jpg',
    'assets/onle_for_second_app/professions/4practitioners.jpg',
    'assets/onle_for_second_app/professions/5health_administrator.jpg',
    'assets/onle_for_second_app/professions/6medical_technicians.jpg',
    'assets/onle_for_second_app/professions/7maintenance_and_operation_technicians.jpg',
    'assets/onle_for_second_app/professions/8medical_device_engineers.jpg',
    'assets/onle_for_second_app/professions/9biomedical_engineers.jpg',
    'assets/onle_for_second_app/professions/10administrators.jpg',
    'assets/onle_for_second_app/professions/11life_support.jpg',
    'assets/onle_for_second_app/professions/12ambulance_staff.jpg',
  ];

  sureToLogOut() async {
    var headers = {'Authorization': 'Bearer $savedToken'};
    var request = http.Request(
      'POST',
      Uri.parse('$url/logout'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('response.statusCode = ${response.statusCode}');
    } else {
      print('response.statusCode = ${response.statusCode}');
      print(response.reasonPhrase);
    }
    savedToken = null;
    storedToken.remove('token');
    update();
    Get.back();
    Get.offAllNamed(Routes.SIGNIN);
  }

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
