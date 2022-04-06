// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<String> services = [
    'اطباء',
    'مستشفيات',
    'مختبرات',
    'مستلزمات طبية',
    'معالجين',
    'صيدليات',
    'خدمات طبية خارج العراق',
    'شركات ومكاتب تجهيز',
  ];
  List<String> cities = ['بابل', 'بغداد'];
  String? selectedService;
  String? selectedCity;
  // List<String> doctorsSpecialization = ['عام', 'اطفال', 'نسائي'];
  // List<String> hospitalsSpecialization = ['جلدية', 'تناسلية', 'اورام'];
  // List<String> specializations = [];
  // String? selectedSpecialization;
  // List<String> baghdadDestricts = ['المنصور', 'الاعظمية', 'الشعب'];
  // List<String> dialahDestricts = ['بعقوبة', 'المفرك', 'بهرز'];
  // List<String> destricts = [];
  // String? selectedDestrict;
  // void onChangedSpecialization(specialization) {
  //   // selectedSpecialization = specialization;
  //   update();
  // }
  // void onChangedDestrict(destrict) {
  //   // selectedDestrict = destrict;
  //   update();
  // }

  void onChangedService(service) {
    if (service == 'اطباء') {
      selectedService = service;
      // specializations = doctorsSpecialization;
    } else if (service == 'مستشفيات') {
      // specializations = hospitalsSpecialization;
    } else {
      // specializations = [];
    }
    // selectedSpecialization = null;
    // selectedService = service;
    update();
  }

  void onChangedCity(city) {
    if (city == 'بغداد') {
      selectedCity = city;
      // destricts = baghdadDestricts;
    } else if (city == 'بابل') {
      // destricts = dialahDestricts;
    } else {
      // destricts = [];
    }
    // selectedDestrict = null;
    // selectedCity = city;
    update();
  }
}
