import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/institution_profile/providers/institutions_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class InstitutionDashboardController extends GetxController {
  Future<InstitutionsProfile>? getInstituionsVar;
  @override
  void onInit() {
    getInstituionsVar = getInstituions();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  //#region cards
  List<String> menus = [
    'إدارة الحجوزات',
    'سجلات المراجعين',
    'إدارة الموارد',
    'تقويم العيادة',
    'التقارير المالية',
    'التقارير العامة',
    'الزيارات المنزلية',
    'الرصيد المخزني',
    'الاشعارات الواردة',
  ];

  List<String> routes = [
    Routes.HOME,
    Routes.DOCTOR_PROFILE,
    Routes.PROFILE,
    Routes.FAMILY_INFORMATION,
    Routes.ADD_DRUG,
    Routes.CLINICS_RESERVATION,
    Routes.DOCTOR_DASHBOARD,
    Routes.INBOX,
    Routes.INSTITUTIONS_SIGNUP,
  ];
  List<Color> colors = [
    Color(0xFF12CADB),
    Color(0xFF12CADB),
    Color(0xFF12CADB),
    Color(0xFFE8C415),
    Color(0xFFE8C415),
    Color(0xFFE8C415),
    Color(0xFFC40000),
    Color(0xFFC40000),
    Color(0xFFC40000),
  ];

  List<IconData> icons = [
    FontAwesomeIcons.edit,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.windowRestore,
    FontAwesomeIcons.calendarWeek,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.fileWord,
    FontAwesomeIcons.home,
    FontAwesomeIcons.windowRestore,
    FontAwesomeIcons.bell,
  ];
  //#endregion

  //#region switches
  List<String> switchesTitles = [
    'الزيارات المنزلية',
    'الحجز الحضوري متوفر',
    'متوفر الحجز للأيام القادمة',
    'الحجوزات متوفرة اليوم',
    'العيادة مفتوحة الان',
  ];
  List<Color> switchesColors = [
    Colors.yellow,
    Colors.orangeAccent,
    Colors.blueAccent,
    Color(0xFFC40000),
    Colors.green,
  ];

  List<bool>switchesValues = [false,false,false,false,false];

  onSwitchChanged(index){
    switchesValues[index]=!switchesValues[index];
    print(switchesValues[index]);
    update();
  }
  //#endregion
}
