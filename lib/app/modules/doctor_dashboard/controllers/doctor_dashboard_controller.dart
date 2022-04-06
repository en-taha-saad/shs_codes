import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/modules/doctor_profile/providers/doctor_provider.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class DoctorDashboardController extends GetxController {
  Future<List<InstitutionsProfile>>? getRegisteredInstituionsVar;

  Future<List<InstitutionsProfile>>? getRegisteredInstituions() async {
    var headers = {
      // 'Authorization': 'Bearer 112|AFY5SIOfhYGdhwUvSRkGWARs1pJR0q1xJcxkTIH3',
      'Authorization': 'Bearer $savedToken',
      'Accept': 'application/json'
    };

    var request = http.Request('GET', Uri.parse('$url/my_institutions'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('response.statusCode = ${response.statusCode}');
      print('response.reasonPhrase = ${response.reasonPhrase}');
      var data = jsonDecode(await response.stream.bytesToString());
      // print('Data = $data');
      List<InstitutionsProfile>? dataMap =
          List.from(data).map((e) => InstitutionsProfile.fromJson(e)).toList();
      print('dataMap = $dataMap');
      return dataMap;
    } else {
      print('response.statusCode = ${response.statusCode}');
      print('response.reasonPhrase = ${response.reasonPhrase}');
      var data = jsonDecode(await response.stream.bytesToString());
      print('data = $data');
      return data;
    }
  }

  List<String> menus = [
    'الصفحة الرئيسية',
    'الصفحة المهنية',
    'الصفحة الشخصية',
    'الصفحة العائلية',
    'إضافة دواء',
    'تعديل لوحة التحكم',
    'تعديل المعلومات المهنية',
    'الإشعارات',
    'إنشاء حساب المؤسسات الصحية',
  ];
  List<String> routes = [
    Routes.HOME,
    Routes.DOCTOR_PROFILE,
    Routes.PROFILE,
    Routes.FAMILY_INFORMATION,
    Routes.ADD_DRUG,
    Routes.INSTITUTION_DASHBOARD,
    Routes.DOCTOR_DASHBOARD,
    Routes.INBOX,
    Routes.INSTITUTIONS_SIGNUP,
  ];
  List<Color> colors = [
    Color(0xFF12CADB),
    Color(0xFF12CADB),
    Color(0xFF12CADB),
    Color(0xFF12CADB),
    generalColor,
    Color(0xFFE8C415),
    Color(0xFFE8C415),
    Color(0xFFC40000),
    Color(0xFFC40000),
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.person_pin_outlined,
    Icons.person,
    Icons.family_restroom_outlined,
    Icons.note_add,
    Icons.edit,
    Icons.pending_actions,
    Icons.notifications,
    Icons.medication_rounded,
  ];

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    getRegisteredInstituionsVar = getRegisteredInstituions();

    DoctorProvider().getDoctorProfile();
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

sureToLogOut() async {
  print('savedToken = $savedToken');
  var headers = {'Authorization': 'Bearer $savedToken'};
  var request = http.Request(
    'POST',
    Uri.parse('$url/logout'),
  );
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print('response.statusCode = ${response.statusCode}');
    print(await response.stream.bytesToString());
  } else {
    print('response.statusCode = ${response.statusCode}');
    print(response.reasonPhrase);
  }
  savedToken = null;
  box.remove('map');
  box.remove('image');
  storedToken.remove('token');
  if (!providers) Get.back();
  if (!providers) Get.offAllNamed(Routes.HOME);
  if (providers) Get.offAllNamed(Routes.SIGNIN);
}
