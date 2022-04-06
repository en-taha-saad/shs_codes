import 'package:get/get.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class StaffController extends GetxController {
  List<String> professions = [
    'أطباء',
    'صيادلة',
    'محللي مختبرات',
    'ممارسين',
    'إداري صحي',
    'الفنيين الطبيين',
    'فنيي الصيانة وتشغيل',
    'مهندسي الأجهزة الطبية',
    'مهندسي الطب حياتي',
    'إداريين',
    'دعم حياتي',
    'كادر الإسعاف',
  ];
  List routes = [
    Routes.DOCTORS,
    Routes.PHARMACISTS,
    Routes.STAFF,
    Routes.STAFF,
    Routes.STAFF,
    Routes.STAFF,
    Routes.STAFF,
    Routes.STAFF,
    Routes.BIOMEDICAL_ENGINEERS,
    Routes.STAFF,
    Routes.STAFF,
    Routes.STAFF,
  ];
  List images = [
    'assets/onle_for_second_app/professions/1doctor.jpg',
    'assets/onle_for_second_app/professions/2pharmacist.png',
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
