import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlng/latlng.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/clinics_pin2_model.dart';
import 'package:shs108private/app/modules/Institutions_signup/models/saved_data_in_mobile_model.dart';
import 'package:shs108private/app/modules/map/views/map_view.dart';
import 'package:shs108private/app/modules/signup/controllers/fetch_data.dart';
import 'package:path/path.dart' as paths;
import 'package:http/http.dart' as http;
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class InstitutionsSignupController extends GetxController {
  GlobalKey<FormBuilderState>? formKeyInistitution =
      GlobalKey<FormBuilderState>();

  //#region stepper

  @override
  void onInit() {
    print("لتكول هنا هم متدخل؟");
    onFindServicesList('');
    bringInfo();
    super.onInit();
  }

  @override
  void onClose() {
    print("لتكول هنا هم متدخل222؟");
    // Get.reset();
    // formKeyInistitution!.currentState!.reset();
    super.onClose();
  }

  clearAll() {
    otherTextCategory = '';
    institutionName = '';
    registrationNumber = '';

    listOfOwners = [];
    listOfSpecialists = [];
    listOfServices = [];
    listOfPhones = [];
    listOfStaff = [];

    closestPoint = '';
    districtId = 0;
    cityId = 0;
    latitude = null;
    longitude = null;

    avInstitution = [];
    registerOnAttendance = false;
    reserveByPhone = false;
    reserveOnAttendance = false;
    reserveOnline = false;
    setReserveCheckBox();

    showPhone = false;
    showMessages = false;
    showRecommendations = false;

    selectedCategory = null;
    selectedMedicalSpecialist = [];
    selectedCity = null;
    selectedRegion = null;
    selectedDistrict = null;
    selectedDays = [];
    selectedExceptionDays = [];
    selectedEReservation = null;
    selectedPhoneReservation = null;
    selectedOnPresenceReservation = null;
    selectedStaffServices = {};
    listOfOwnerNames = [];
    isNotDoctor = [];
    setPrefCheckBox();
    update();
  }

  final box = GetStorage();
  int currentstep = 2;
  Clinics pinClinicInfo = Clinics();
  ClinicsPin2 pinClinicAllInfo = ClinicsPin2();
  ScrollController scrollController = ScrollController();

  var onStepConBackgroundColor = MaterialStateProperty.all(Colors.blue);
  var onStepBackBackgroundColor = MaterialStateProperty.all(Colors.grey);

  List<FAStepstate> stepsState = [
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
  ];
  onStepTapped(index) {
    // for(int i = 0 ;i<index;i++){
    //   if(stepsState[i]==FAStepstate.editing) {
    //     return;
    //   }
    // }
    // stepsState[index]=FAStepstate.editing;
    currentstep = index;
    update();
  }

  onStepContinue() {
    switch (currentstep) {
      case 0:
        if (step1Validate()) {
          stepsState[0] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[0] = FAStepstate.editing;
        }
        break;
      case 1:
        if (step2Validate()) {
          stepsState[1] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[1] = FAStepstate.editing;
        }
        break;
      case 2:
        if (step3Validate()) {
          stepsState[2] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[2] = FAStepstate.editing;
        }
        break;
      case 3:
        if (step4Validate()) {
          stepsState[3] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[3] = FAStepstate.editing;
        }
        break;
      case 4:
        if (step5Validate()) {
          stepsState[4] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[4] = FAStepstate.editing;
        }
        break;
      case 5:
        if (step6Validate()) {
          stepsState[5] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[5] = FAStepstate.editing;
        }
        break;
      case 6:
        stepsState[6] = FAStepstate.complete;
        infoList = buildInfo();
        currentstep++;
        break;
      case 7:
        stepsState[7] = FAStepstate.complete;
        send();
        break;
    }
    update();
  }

  onStepCancel() {
    switch (currentstep) {
      case 0:
        break;
      case 1:
        currentstep--;
        break;
      case 2:
        currentstep--;
        break;
      case 3:
        currentstep--;
        break;
      case 4:
        currentstep--;
        break;
      case 5:
        currentstep--;
        break;
      case 6:
        currentstep--;
        break;
      case 7:
        currentstep--;
        break;
    }
    update();
  }

  onStepPin() {
    //#region fill data
    print("institutionName pin $institutionName");
    pinClinicInfo.institution = Institution(
      medicalCategory: otherTextCategory,
      name: institutionName,
      registrationNo: registrationNumber,
    );
    pinClinicInfo.owners = listOfOwners;
    pinClinicInfo.medicalSpecialties = listOfSpecialists;
    pinClinicInfo.institutionTreatments = listOfServices;
    pinClinicInfo.phones = listOfPhones;
    pinClinicInfo.address = Address(
      nearBy: closestPoint,
      regionId: selectedRegion?.id,
      cityId: selectedDistrict?.id,
      governorateId: selectedCity?.id,
      countryId: 106,
      location: Location(
        latitude: latitude,
        longitude: longitude,
      ),
    );
    saveSchedule();
    pinClinicInfo.availableSchedules = avInstitution;
    pinClinicInfo.staffs = listOfStaff;
    setReserveCheckVariables();
    pinClinicInfo.reservationSetting = ReservationSetting(
      registerOnAttendance: registerOnAttendance! ? 1 : 0,
      reserveByPhone: reserveByPhone! ? 1 : 0,
      reserveByPhoneDurationId: reserveByPhoneDurationId,
      reserveOnAttendance: reserveOnAttendance! ? 1 : 0,
      reserveOnAttendanceDurationId: reserveOnAttendanceDurationId,
      reserveOnline: reserveOnline! ? 1 : 0,
      reserveOnlineDurationId: reserveOnlineDurationId,
    );
    setPrefCheckVariables();
    pinClinicInfo.setting = Setting(
      showPhone: showPhone! ? 1 : 0,
      showMessages: showMessages! ? 1 : 0,
      showRecommendations: showRecommendations! ? 1 : 0,
    );
    pinClinicAllInfo.clinics = pinClinicInfo;
    print("selectedStaffServices***$selectedStaffServices***");
    pinClinicAllInfo.extraData = ExtraData(
      categoryItemsMap: selectedCategory,
      selectedMedicalSpecialist: selectedMedicalSpecialist,
      selectedDays: selectedDays,
      selectedExceptionDays: selectedExceptionDays,
      selectedCity: selectedCity,
      selectedDistrict: selectedDistrict,
      selectedRegion: selectedRegion,
      selectedEReservation: selectedEReservation,
      selectedPhoneReservation: selectedPhoneReservation,
      selectedOnPresenceReservation: selectedOnPresenceReservation,
      currencyMap: currencyMap,
      selectedStaffServices: selectedStaffServices,
      listOfOwnerNames: listOfOwnerNames,
      staffNames: staffNames.values.toList(),
      isNotDoctor: isNotDoctor,
      imageAvatar: imageAvatar,
    );
    //#endregion

    box.write('institutionInfo', pinClinicAllInfo.toJson());
    print(jsonEncode(pinClinicAllInfo));
  }

  bringInfo() {
    if (box.read('institutionInfo') == null) {
      return;
    }
    print("box.read('institutionInfo')${box.read('institutionInfo')}");
    pinClinicAllInfo = ClinicsPin2.fromJson(box.read('institutionInfo'));

    print(pinClinicAllInfo.toJson());
    pinClinicInfo = pinClinicAllInfo.clinics!;
    ExtraData lists = pinClinicAllInfo.extraData!;

    otherTextCategory = pinClinicInfo.institution?.medicalCategory;
    institutionName = pinClinicInfo.institution!.name!;
    print("institutionName $institutionName");
    registrationNumber = pinClinicInfo.institution!.registrationNo!;

    listOfOwners = pinClinicInfo.owners!;
    listOfSpecialists = pinClinicInfo.medicalSpecialties!;
    listOfServices = pinClinicInfo.institutionTreatments!;
    listOfPhones = pinClinicInfo.phones!;
    listOfStaff = pinClinicInfo.staffs!;

    closestPoint = pinClinicInfo.address!.nearBy ?? '';
    // selectedRegion?.id = pinClinicInfo.address!.regionId!;
    districtId = pinClinicInfo.address!.cityId ?? 0;
    cityId = pinClinicInfo.address!.governorateId ?? 0;
    latitude = pinClinicInfo.address!.location?.latitude;
    longitude = pinClinicInfo.address!.location?.longitude;

    avInstitution = pinClinicInfo.availableSchedules!;
    setAVSchedule();
    registerOnAttendance =
        pinClinicInfo.reservationSetting?.registerOnAttendance == 1;
    reserveByPhone = pinClinicInfo.reservationSetting?.reserveByPhone == 1;
    reserveOnAttendance =
        pinClinicInfo.reservationSetting?.reserveOnAttendance == 1;
    reserveOnline = pinClinicInfo.reservationSetting?.reserveOnline == 1;
    setReserveCheckBox();

    showPhone = pinClinicInfo.setting?.showPhone == 1;
    showMessages = pinClinicInfo.setting?.showMessages == 1;
    showRecommendations = pinClinicInfo.setting?.showRecommendations == 1;

    if (lists.categoryItemsMap != null) {
      selectedCategory = lists.categoryItemsMap;
      selectedOtherCategory = selectedCategory!.id == 1;
    }
    selectedMedicalSpecialist = lists.selectedMedicalSpecialist!;
    selectedCity = lists.selectedCity;
    selectedRegion = lists.selectedRegion;
    selectedDistrict = lists.selectedDistrict;
    selectedDays = lists.selectedDays!;
    onChangedSelectedDay(selectedDays);
    print("days ${dayInWeek.toString()}");
    selectedExceptionDays = lists.selectedExceptionDays!;
    onChangedSelectedExceptionDay(selectedExceptionDays);
    selectedEReservation = lists.selectedEReservation;
    selectedPhoneReservation = lists.selectedPhoneReservation;
    selectedOnPresenceReservation = lists.selectedOnPresenceReservation;
    if (selectedPhoneReservation != null) {
      reserveByPhoneDurationId = selectedPhoneReservation!.id;
    }
    if (selectedOnPresenceReservation != null) {
      reserveOnAttendanceDurationId = selectedOnPresenceReservation!.id;
    }
    if (selectedEReservation != null) {
      reserveOnlineDurationId = selectedEReservation!.id;
    }
    print("jjssoonn*****${selectedStaffServices.toString()}");

    if (lists.selectedStaffServices != null) {
      if (lists.selectedStaffServices!.isNotEmpty) {
        selectedStaffServices = lists.selectedStaffServices!;
        print("jjssoonn*****${selectedStaffServices.toString()}");
      }
    }
    listOfOwnerNames = lists.listOfOwnerNames!;
    isNotDoctor = lists.isNotDoctor ?? [];
    print("selectedStaffServices.length = ${selectedStaffServices[0]?.length}");
    // staffNames = lists.staffNames.map((e) => {1: e}).toSet();

    if (listOfStaff.isNotEmpty) {
      for (int i = 0; i < lists.staffNames!.length; i++) {
        staffNames.addAll({listOfStaff[i].staffId!: lists.staffNames![i]});
      }
    }
    // selectedCurrency = lists.currencyMap;

    if (listOfOwnerNames.isNotEmpty) {
      isCheckedId[0] = 1;
    }
    if (listOfServices.isNotEmpty) {
      serviceSelectedOther = false;
    }
    if (listOfPhones.isNotEmpty) {
      phoneSelectedOther = false;
    }

    if (lists.imageAvatar != null) {
      imageAvatar = lists.imageAvatar;
    }
    setPrefCheckBox();
    update();
  }

  alertBar(alert, {Color color = Colors.black38}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      titleText: Center(
        child: textWidget(
          textAlign: TextAlign.center,
          stringText: alert,
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: EdgeInsets.all(15),
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 3),
      dismissDirection: SnackDismissDirection.VERTICAL,
      // dismissDirection: DismissDirection.vertical,

      margin: EdgeInsets.all(15),
      borderRadius: 20,
    );
  }

  String stepError = '';

  bool step1Validate() {
    resetErrors();
    if (selectedCategory == null) {
      stepError = 'يرجى تحديد فئة المؤسسة الصحية';
      if (!formKeyInistitution!.currentState!.saveAndValidate()) {
        print('not validated');
        alertBar(stepError);
        return false;
      }
    } else {
      if (!formKeyInistitution!.currentState!.saveAndValidate()) {
        print('not validated');
        stepError = 'يرجى ملىء كل الحقول المطلوبة';
      } else {
        if (listOfOwners.isEmpty) {
          stepError = 'يرجى اضافة مالك';
        } else {
          if (listOfSpecialists.isEmpty) {
            stepError = 'يرجى اضافة اختصاص واحد على الأقل';
          } else {
            print("listOfSpecialists.length=${listOfSpecialists.length}");
            stepError = '';
            return true;
          }
        }
      }
    }
    currentstep = currentstep;
    update();
    alertBar(stepError);
    return false;
  }

  bool step2Validate() {
    resetErrors();
    if (selectedCity == null) {
      stepError = 'يرجى تحديد المحافظة';
    } else if (selectedDistrict == null) {
      stepError = 'يرجى تحديد المدينة';
    } else {
      if (longitude == null || latitude == null) {
        stepError = 'يرجى تحديد الموقع';
      } else {
        stepError = '';
        return true;
      }
    }
    currentstep = currentstep;
    update();
    alertBar(stepError);
    if (!formKeyInistitution!.currentState!.saveAndValidate()) {
      print('not validated');
      alertBar(stepError);
    }
    return false;
  }

  bool step3Validate() {
    resetErrors();
    if (selectedDays.isEmpty) {
      stepError = 'يرجى تحديد ايام الدوام';
    } else if (dateFrom == null || dateTo == null) {
      stepError = 'يرجى تحديد الساعات';
    } else {
      if (dateFrom == dateTo ||
          ((dateExceptionFrom != null && dateExceptionTo != null) &&
              (dateExceptionFrom == dateExceptionTo))) {
        stepError = 'يرجى تغيير الساعات المتطابقة';
      } else {
        stepError = '';
        return true;
      }
    }
    currentstep = currentstep;
    update();
    alertBar(stepError);
    return false;
  }

  bool step4Validate() {
    resetErrors();
    if (listOfStaff.isEmpty) {
      stepError = 'يرجى إضافة الكادر';
    } else {
      stepError = '';
      return true;
    }
    currentstep = currentstep;
    update();
    alertBar(stepError);
    return false;
  }

  bool step5Validate() {
    resetErrors();
    stepError = 'يرجى إختيار احد الحجوزات';
    for (var element in listOfCheckboxes) {
      if (element.value!) {
        stepError = '';
      }
    }
    if ((listOfCheckboxes[3].value! && selectedOnPresenceReservation == null) ||
        (listOfCheckboxes[2].value! && selectedPhoneReservation == null) ||
        (listOfCheckboxes[1].value! && selectedEReservation == null)) {
      stepError = 'يرجى تحديد مدة الحجز';
      update();
      print(stepError);
      alertBar(stepError);
      !formKeyInistitution!.currentState!.saveAndValidate();
    }
    if (stepError == '') {
      return true;
    }
    update();
    print(stepError);
    alertBar(stepError);
    return false;
  }

  bool step6Validate() {
    resetErrors();
    selectedStaffServices.forEach((key, value) {
      if (value.isEmpty) {
        stepError = 'يجب تحديد لكل طبيب خدمة على الأقل';
      }
    });
    if (!formKeyInistitution!.currentState!.saveAndValidate()) {
      stepError = 'يرجى ملئ اسعار الخدمات';
    }
    if (stepError == '') {
      return true;
    }
    update();
    print(stepError);
    alertBar(stepError);
    return false;
  }

  resetErrors() {
    stepError = '';
    staffError = '';
    ownerError = '';
    phoneError = '';
    update();
  }

  //#endregion

  //#region step1

  //#region institutionCategory

  List<GetDataModel> categoryItemsMap = [
    GetDataModel(
      id: 1,
      name: 'اخرى',
    ),
    GetDataModel(
      id: 2,
      name: 'عيادة',
    ),
    GetDataModel(
      id: 3,
      name: 'مركز',
    ),
    GetDataModel(
      id: 4,
      name: 'مجمع',
    ),
  ];

  bool? selectedOtherCategory = false;
  String? otherTextCategory;
  GetDataModel? selectedCategory;

  onChangedOtherSelectedCategory(string) {
    print(
      'selectedOtherCategory = $string',
    );
    selectedOtherCategory = true;
    selectedCategory = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: selectedOtherCategory,
    );
    otherTextCategory = string;
    update();
  }

  //var id = 0;
  onChangedSelectedCategory(category) {
    selectedCategory = null;
    selectedCategory = category;

    if (category.id == 1) {
      selectedOtherCategory = true;
      otherTextCategory = '';
    } else {
      selectedOtherCategory = false;
      otherTextCategory = category.name;
    }

    update();
  }

  //#endregion

  //#region institutionName
  String institutionName = '';

  onChangedInstitutionName(name) {
    institutionName = name;
    update();
  }

  //#endregion

  //#region registrationNumber
  String registrationNumber = '';

  onChangedRegistrationNumber(name) {
    registrationNumber = name;
    update();
  }

  //#endregion

  //#region institutionOwner
  List<int> listOfOwners = [];
  List<String> listOfOwnerNames = [];
  String? ownerError;

  String ownerController = '';

  // cancelOwner() {
  //   ownerController = '';
  //   Get.back();
  //   update();
  // }

  checkOwner(int index) {
    checkPatientId(0).then((value) => {if (isCheckedId[0] == 1) addOwner()});
    update();
  }

  openOwnerText() {
    ownerController = '';
    isCheckedId[0] = 0;
    update();
  }

  addOwner() {
    print("listOfOwners =${listOfOwners.length}");
    if (ownerController == '') {
      ownerError = 'يرجى ملئ الحقل لاضافة المالك';
      ownerController = '';
    } else {
      ownerError = '';
      listOfOwners.add(
        staffId,
      );
      listOfOwnerNames.add(staffName);
      ownerController = '';
    }
    update();
  }

  onChangedOwnerController(name) {
    ownerController = name;
    ownerError = '';
    update();
  }

  removeOwner(int index) {
    listOfOwners.removeAt(index);
    listOfOwnerNames.removeAt(index);
    ownerController = '';
    if (listOfOwnerNames.isEmpty) {
      isCheckedId[0] = 0;
    }
    update();
  }

  editOwner(int owner) {
    if (ownerController != '') {
      owner = int.parse(ownerController);
    }
    ownerController = '';
    update();
  }

  //#endregion

  //#region institutionSpecialist

  bool specialistSelectedOther = false;
  String specialistController = '';

  List<MedicalSpecialties> listOfSpecialists = [];
  List<GetDataModel> selectedMedicalSpecialist = [];
  List<String> listOfOtherSpecialists = [];
  GetDataModel? specialist;
  String? specialistError;
  bool isAddSpecialist = true;
  MedicalSpecialties specialistForEdit = MedicalSpecialties(other: '');

  openSpecialistText() {
    specialistSelectedOther = true;
    update();
  }

  onFindSpecialist(String? filter) => getData(
        filter,
        '$url/medical_specialties',
      );

  onChangedMedicalSpecialist(specialties) {
    selectedMedicalSpecialist = [];
    listOfSpecialists.removeWhere((sp) => sp.other == null);
    selectedMedicalSpecialist = specialties;
    selectedMedicalSpecialist.forEach((element) {
      listOfSpecialists.add(MedicalSpecialties(
        id: element.id,
      ));
    });
    update();
  }

  onChangedSpecialist(specialist_) {
    // if (specialist_?.id == 1) {
    //   specialistSelectedOther = true;
    // } else {
    //   specialistSelectedOther = false;
    // }
    specialist = specialist_;
    update();
  }

  onChangedSpecialistController(name) {
    specialistController = name;
    update();
  }

  // onChangedOtherSpecialist(string) {
  //   specialistSelectedOther = true;
  //   specialist = MedicalSpecialties(
  //     id: 1,
  //     name: 'اخرى',
  //     other: string,
  //     selectedOther: specialistSelectedOther,
  //   );
  //   update();
  // }

  // onChangedSpecialistEdit(specialist_) {
  //   if (specialist_?.id == 1) {
  //     specialistSelectedOther = true;
  //     update();
  //   } else {
  //     specialistSelectedOther = false;
  //     update();
  //   }
  //   specialist = specialist_;
  //   update();
  // }

  // cancelSpecialist() {
  //   specialist = null;
  //   update();
  //
  //   Get.back();
  // }

  // addSpecialist() {
  //   if (specialist == null) {
  //     specialistError = 'يرجى ملئ احد الحقول لاضافة البرنامج';
  //     update();
  //     Get.back();
  //   } else {
  //     specialistError = '';
  //     if (listOfSpecialists.length < 20) {
  //       listOfSpecialists.add(
  //         MedicalSpecialties(
  //           id: specialist?.id,
  //           other: specialist?.other,
  //         ),
  //       );
  //     } else {
  //       specialistError = 'لا يمكنك اضافة المزيد';
  //       specialist = null;
  //       specialistSelectedOther = false;
  //
  //       update();
  //       Get.back();
  //     }
  //
  //     specialist = null;
  //     specialistSelectedOther = false;
  //     update();
  //     Get.back();
  //   }
  //   update();
  // }

  addOrEditSpecialist() {
    if (isAddSpecialist) {
      addSpecialist();
      isAddSpecialist = true;
    } else {
      editOtherSpecialist(specialistForEdit);
      isAddSpecialist = true;
    }
    specialistController = '';
    specialistSelectedOther = false;
    update();
  }

  addSpecialist() {
    if (specialistController != '') {
      listOfSpecialists.add(MedicalSpecialties(other: specialistController));
      listOfOtherSpecialists.add(specialistController);
    }
  }

  removeSpecialist(MedicalSpecialties specialist2) {
    listOfSpecialists.remove(specialist2);
    update();
  }

  editSpecialist(MedicalSpecialties specialist2) {
    specialistController = specialist2.other!;
    specialistSelectedOther = true;
    isAddSpecialist = false;
    specialistForEdit = specialist2;
    update();
  }

  editOtherSpecialist(MedicalSpecialties specialist2) {
    specialist2.other = specialistController;
    update();
  }

  //#endregion

  //#region institutionTreatments

  bool serviceSelectedOther = true;
  String serviceController = '';

  List<InstitutionTreatments> listOfServices = [];
  String? serviceError;
  bool isAddServices = true;
  InstitutionTreatments serviceForEdit = InstitutionTreatments(name: '');

  openServiceText() {
    serviceSelectedOther = true;
    update();
  }

  addOrEditService() {
    if (isAddServices) {
      addService();
      isAddServices = true;
    } else {
      editOtherService(serviceForEdit);
      isAddServices = true;
    }
    serviceController = '';
    serviceSelectedOther = false;
    update();
  }

  addService() {
    if (serviceController != '') {
      listOfServices.add(InstitutionTreatments(name: serviceController));
    }
  }

  onChangedServiceController(name) {
    serviceController = name;
    update();
  }

  removeService(InstitutionTreatments service2) {
    listOfServices.remove(service2);
    if (listOfServices.isEmpty) {
      serviceSelectedOther = true;
    }
    update();
  }

  editService(InstitutionTreatments service2) {
    serviceController = service2.name!;
    serviceSelectedOther = true;
    isAddServices = false;
    serviceForEdit = service2;
    update();
  }

  editOtherService(InstitutionTreatments service2) {
    service2.name = serviceController;
    update();
  }

  //#endregion

  //#region phones

  bool phoneSelectedOther = true;
  String phoneController = '';

  List<Phones> listOfPhones = [];
  String? phoneError;
  bool isAddPhones = true;
  Phones phoneForEdit = Phones(phone: '');

  openPhoneText() {
    phoneSelectedOther = true;
    update();
  }

  addOrEditPhone() {
    if (phoneController.length == 10 &&
        phoneError == '' &&
        formKeyInistitution!.currentState!.fields["Phone_name"]!.validate()) {
      if (isAddPhones) {
        addPhone();
        isAddPhones = true;
      } else {
        editOtherPhone(phoneForEdit);
        isAddPhones = true;
      }
      phoneController = '';
      phoneSelectedOther = false;
    }
    update();
  }

  addPhone() {
    if (phoneController.length == 10 && phoneError == '') {
      listOfPhones.add(Phones(phone: phoneController));
    }
  }

  removePhone(Phones phone2) {
    listOfPhones.remove(phone2);
    if (listOfPhones.isEmpty) {
      phoneSelectedOther = true;
    }
    update();
  }

  editPhone(Phones phone2) {
    phoneController = phone2.phone!;
    phoneSelectedOther = true;
    isAddPhones = false;
    phoneForEdit = phone2;
    update();
  }

  editOtherPhone(Phones phone2) {
    if (phoneController.length < 10) {
      phoneError = 'الرقم غير صالح';
    }
    if (phoneController.length == 10 && phoneError == '') {
      phone2.phone = phoneController;
    }
    update();
  }

  onChangedPhoneController(name) {
    phoneError = '';
    phoneController = name;
    if (phoneController.length == 10) {
      listOfPhones.forEach((element) {
        if (element.phone == phoneController) {
          print("موجود");
          phoneError = "الهاتف مضاف مسبقاً";
        }
      });
    }
    update();
  }

//#endregion

  //#region logo

  final ImagePicker _pickerAvatar = ImagePicker();
  String? imageAvatar;
  String? storedImageAvatar;

  onPressedCameraAvatar() async {
    imageAvatar = '';
    await _pickerAvatar
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        imageAvatar = value?.path;
        update();
      },
    );
    if (imageAvatar != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageAvatar!,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: generalColor,
          toolbarWidgetColor: Colors.grey,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      if (croppedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = paths.basename(croppedFile.path);
        final File localImage =
            await croppedFile.copy('${appDir.path}/$fileName');
        storedImageAvatar = localImage.path;
        update();
      }
    }
  }

  onPressedGalleryAvatar() async {
    imageAvatar = '';
    await _pickerAvatar
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        imageAvatar = value?.path;
        update();
      },
    );
    if (imageAvatar != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageAvatar!,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: generalColor,
          toolbarWidgetColor: Colors.grey,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      if (croppedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = paths.basename(croppedFile.path);
        final File localImage =
            await croppedFile.copy('${appDir.path}/$fileName');
        storedImageAvatar = localImage.path;
        update();
      }
    }
  }

  //#endregion

  //#endregion

  //#region step2

  GetDataModel? selectedCity;
  int cityId = 0;

  onFindCity(String? filter) => getData(
        filter,
        '$url/governorates_by_country_id/106',
      );

  onChangedSelectedCity(city) {
    selectedCity = city;
    cityId = city.id;
    selectedDistrict = null;
    update();
  }

  GetDataModel? selectedDistrict;
  int districtId = 0;

  onFindDistrict(String? filter) => getData(
        filter,
        '$url/cities_by_gov_id/$cityId',
      );

  onChangedSelectedDistrict(district) {
    selectedDistrict = district;
    districtId = district.id;
    selectedRegion = null;
    update();
  }

  GetDataModel? selectedRegion;

  onFindRegion(String? filter) => getData(
        filter,
        '$url/region_by_city_id/$districtId',
      );

  onChangedSelectedRegion(region) {
    selectedRegion = region;
    print("selectedRegion ${selectedRegion!.name}");
    update();
  }

  String closestPoint = '';

  onChangedColsestPoint(name) {
    closestPoint = name;
    update();
  }

  //#region map

  double? latitude;
  double? longitude;
  LatLng? loc;

  mapDialog() {
    Get.defaultDialog(
      title: "تحديد موقع المؤسسة",
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
          height: 600,
          width: 450,
          child: GetBuilder(
              builder: (InstitutionsSignupController c) => Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 600,
                          width: 450,
                          child: MapView(),
                          // child: FlutterMap(
                          //   options: MapOptions(
                          //     onTap:(_,p) async {
                          //       latLng=p;
                          //       update();
                          //       },
                          //     center: LatLng(33.303125, 44.379031),
                          //     zoom: 5,
                          //     screenSize: Size(450,500),
                          //   ),
                          //   layers: [
                          //     TileLayerOptions(
                          //       urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          //       subdomains: ['a', 'b', 'c'],
                          //
                          //     ),
                          //     MarkerLayerOptions(
                          //         markers: latLng!=null?[Marker(
                          //             width: 80.0,
                          //             height: 80.0,
                          //             point: latLng!,
                          //             builder: (context) =>
                          //                 Icon(Icons.location_on,color: Colors.red,)
                          //         ),
                          //         ]:[]),
                          //   ],
                          // ),
                        ),
                      ],
                    ),
                  ))),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            loc = null;
            latitude = null;
            longitude = null;
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            loc = getLoc();
            longitude = loc!.longitude;
            latitude = loc!.latitude;
            update();
            Get.back();
          },
        )
      ],
    );
  }
  //endregion

  //endregion

  //#region step3

  String dateStringFrom = "";
  DateTime? dateFrom;

  String dateStringTo = "";
  DateTime? dateTo;

  String dateStringExceptionFrom = "";
  DateTime? dateExceptionFrom;

  String dateStringExceptionTo = "";
  DateTime? dateExceptionTo;

  // bool isDateEnter = false;

  String daysError = '';

  List<GetDataModel> selectedDays = [];
  List<GetDataModel> selectedExceptionDays = [];

  pickDateFrom(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateFrom = DateTime(2021, time.month, time.day, time.hour,
                time.minute, time.second);
            update();
          },
          initialDateTime: dateFrom ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateFrom = null;
            // isDateEnter = false;
            dateStringFrom = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateFrom ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringFrom = formatDate(dateFrom);
            update();
            Get.back();
            print(dateFrom);
          },
        )
      ],
    );
  }

  pickDateTo(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateTo =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            update();
          },
          initialDateTime: dateTo ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateTo = null;
            // isDateEnter = false;
            dateStringTo = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateTo ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringTo = formatDate(dateTo);
            update();
            Get.back();
            print(dateTo);
          },
        )
      ],
    );
  }

  pickDateExceptionFrom(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateExceptionFrom =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime: dateExceptionFrom ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateExceptionFrom = null;
            // isDateEnter = false;
            dateStringExceptionFrom = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateExceptionFrom ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringExceptionFrom = formatDate(dateExceptionFrom);
            update();
            Get.back();
            print(dateExceptionFrom);
          },
        )
      ],
    );
  }

  pickDateExceptionTo(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateExceptionTo =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime: dateExceptionTo ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateExceptionTo = null;
            // isDateEnter = false;
            dateStringExceptionTo = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateExceptionTo ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringExceptionTo = formatDate(dateExceptionTo);
            update();
            Get.back();
            print(dateExceptionTo);
          },
        )
      ],
    );
  }

  onChangedSelectedExceptionDay(days) {
    selectedExceptionDays = [];
    selectedExceptionDays = days;
    update();
  }

  onChangedSelectedDay(days) {
    selectedDays = [];
    selectedDays = days;
    selectedExceptionDays = [];
    dayInWeekException = [];
    removeDays(selectedDays);
    print("llll ${dayInWeek.length}");
    update();
  }

  removeDays(List<GetDataModel> days) {
    List<int> idiat = [];
    idiat = days.map((e) => e.id!).toList();
    dayInWeek.forEach((e) {
      if (!idiat.contains(e.id)) dayInWeekException.add(e);
    });
    print("llll ${dayInWeekException.length}");
    update();
  }

  List<GetDataModel> dayInWeekException = [];
  List<GetDataModel> dayInWeekStaffException = [];

  final List<GetDataModel> dayInWeek = [
    GetDataModel(
      id: 1,
      name: "السبت",
    ),
    GetDataModel(
      id: 2,
      name: "الأحد",
    ),
    GetDataModel(
      id: 3,
      name: "الإثنين",
    ),
    GetDataModel(
      id: 4,
      name: "الثلاثاء",
    ),
    GetDataModel(
      id: 5,
      name: "الأربعاء",
    ),
    GetDataModel(
      id: 6,
      name: "الخميس",
    ),
    GetDataModel(
      id: 7,
      name: "الجمعة",
    ),
  ];

  List<AvailableSchedules> avInstitution = [];
  saveSchedule() {
    avInstitution = [];
    print("dateFrom2222${dateFrom.toString()}");
    selectedDays.forEach((element) {
      avInstitution.add(AvailableSchedules(
          startDate: dateFrom.toString().substring(0, 19),
          endDate: dateTo.toString().substring(0, 19),
          isRecurring: 1,
          recurringWeekDay: daysCons[element.id! - 1],
          slotTime: "00:00:00"));
    });

    if (selectedExceptionDays.isNotEmpty ||
        dateExceptionFrom.toString().length < 19 ||
        dateExceptionTo.toString().length < 19) {
      selectedExceptionDays.forEach((element) {
        avInstitution.add(AvailableSchedules(
            startDate: dateExceptionFrom.toString().substring(0, 19),
            endDate: dateExceptionTo.toString().substring(0, 19),
            isRecurring: 1,
            recurringWeekDay: daysCons[element.id! - 1],
            slotTime: "00:00:00"));
      });
    }
  }

  setAVSchedule() {
    if (avInstitution.isEmpty) {
      return;
    }
    print("********${avInstitution[0].toJson()}");
    dateFrom = DateTime.parse(avInstitution[0].startDate!);
    dateTo = DateTime.parse(avInstitution[0].endDate!);
    avInstitution.forEach((e) {
      if (dateFrom != DateTime.parse(e.startDate!)) {
        dateExceptionFrom = DateTime.parse(e.startDate!);
        dateStringExceptionFrom = formatDate(dateExceptionFrom);
      }
      if (dateTo != DateTime.parse(e.endDate!)) {
        dateExceptionTo = DateTime.parse(e.endDate!);
        dateStringExceptionTo = formatDate(dateExceptionTo);
      }
    });
    dateStringTo = formatDate(dateTo);
    dateStringFrom = formatDate(dateFrom);
  }

  //#endregion

  //region step4

  onChangedStaffController(name) {
    staffError = null;
    staffController = name;
    update();
  }

  GetDataModel? selectedRole;
  List<GetDataModel> role = [
    GetDataModel(
      id: 1,
      name: "مالك",
    ),
    GetDataModel(
      id: 2,
      name: "طبيب",
    ),
    GetDataModel(
      id: 3,
      name: "مستخدم",
    ),
    GetDataModel(
      id: 4,
      name: "مشرف",
    ),
    GetDataModel(
      id: 5,
      name: "ادارة",
    ),
  ];

  findRole(int id) {
    selectedRole = role.where((element) => element.id == id).first;
    update();
  }

  onChangedSelectedRole(role) {
    //id = specialization?.id;
    // selectedOtherCategory = false;
    // toPinedJson?.medicalSpecialties = [];
    stepError = '';
    selectedRole = role;
    update();
  }

  List<GetDataModel> selectedStaffDays = [];
  List<GetDataModel> selectedStaffExceptionDays = [];

  String dateStringStaffFrom = "";
  DateTime? dateStaffFrom;

  String dateStringStaffTo = "";
  DateTime? dateStaffTo;

  String dateStringStaffExceptionFrom = "";
  DateTime? dateStaffExceptionFrom;

  String dateStringStaffExceptionTo = "";
  DateTime? dateStaffExceptionTo;

  pickDateStaffFrom(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateStaffFrom =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime: dateStaffFrom ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffFrom = null;
            // isDateEnter = false;
            dateStringStaffFrom = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffFrom ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringStaffFrom = formatDate(dateStaffFrom);
            update();
            Get.back();
            print(dateStaffFrom);
          },
        )
      ],
    );
    stepError = '';
    update();
  }

  pickDateStaffTo(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateStaffTo =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime: dateStaffTo ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffTo = null;
            // isDateEnter = false;
            dateStringStaffTo = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffTo ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringStaffTo = formatDate(dateStaffTo);
            update();
            Get.back();
            print(dateStaffTo);
          },
        )
      ],
    );
    stepError = '';
    update();
  }

  pickDateStaffExceptionFrom(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateStaffExceptionFrom =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime:
              dateStaffExceptionFrom ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffExceptionFrom = null;
            // isDateEnter = false;
            dateStringStaffExceptionFrom = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffExceptionFrom ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringStaffExceptionFrom = formatDate(dateStaffExceptionFrom);
            update();
            Get.back();
            print(dateStaffExceptionFrom);
          },
        )
      ],
    );
    stepError = '';
    update();
  }

  pickDateStaffExceptionTo(String title) {
    Get.defaultDialog(
      title: title,
      titleStyle: style(fontSize: 25),
      backgroundColor: Colors.white,
      barrierDismissible: false,
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 250,
        width: 270,
        child: CupertinoDatePicker(
          onDateTimeChanged: (DateTime time) {
            dateStaffExceptionTo =
                DateTime(2021, time.month, time.day, time.hour, time.minute);
            // dateString = "${value.hour}:${value.minute}";
            // print(dateString);
            // isDateEnter = true;
            update();
          },
          initialDateTime: dateStaffExceptionTo ?? DateTime(2021, 0, 0, 16, 0),
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 15,
        ),
      ),
      actions: [
        TextButton(
          child: textWidget(
            stringText: "الغاء",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffExceptionTo = null;
            // isDateEnter = false;
            dateStringStaffExceptionTo = "";
            update();
            Get.back();
          },
        ),
        TextButton(
          child: textWidget(
            stringText: "تأكيد",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            dateStaffExceptionTo ??= DateTime(2021, 0, 0, 16, 0);
            // isDateEnter = true;
            dateStringStaffExceptionTo = formatDate(dateStaffExceptionTo);
            update();
            Get.back();
            print(dateStaffExceptionTo);
          },
        )
      ],
    );
    stepError = '';
    update();
  }

  String formatDate(DateTime? dateInput) {
    String dateOut = '';
    if (dateInput!.hour == 12) {
      dateOut =
          "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour} "
          "مساءاً ";
    } else if (dateInput.hour == 00) {
      dateOut =
          "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${12} "
          "صباحاً ";
    } else {
      if (dateInput.hour > 12) {
        dateOut =
            "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour - 12} "
            "مساءاً ";
      } else {
        dateOut =
            "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour} "
            "صباحاً ";
      }
    }
    return dateOut;
  }

  saveDatesStrings(Staffs staff) {
    dateStringStaffFrom =
        formatDate(DateTime.parse(staff.availableSchedules![0].startDate!));
    dateStringStaffTo =
        formatDate(DateTime.parse(staff.availableSchedules![0].endDate!));
    dateStaffFrom = DateTime.parse(staff.availableSchedules![0].startDate!);
    dateStaffTo = DateTime.parse(staff.availableSchedules![0].endDate!);
    String date1 = staff.availableSchedules![0].startDate!;
    int index = -1;
    staff.availableSchedules!.forEach((element) {
      if (element.startDate != date1) {
        index = staff.availableSchedules!.indexOf(element);
      }
    });
    if (index != -1) {
      print("مو سالب");
      dateStringStaffExceptionFrom = formatDate(
          DateTime.parse(staff.availableSchedules![index].startDate!));
      dateStringStaffExceptionTo =
          formatDate(DateTime.parse(staff.availableSchedules![index].endDate!));
      dateStaffExceptionFrom =
          DateTime.parse(staff.availableSchedules![index].startDate!);
      dateStaffExceptionTo =
          DateTime.parse(staff.availableSchedules![index].endDate!);
    }
  }

  removeStaffDays(List<GetDataModel> days) {
    print("وهناااااانه؟");
    dayInWeekStaffException = [];
    List<int> idiat = [];
    idiat = days.map((e) => e.id!).toList();
    dayInWeek.forEach((e) {
      if (!idiat.contains(e.id)) dayInWeekStaffException.add(e);
    });
    update();
  }

  onChangedSelectedStaffDay(days) {
    selectedStaffDays = [];
    selectedStaffDays = days;
    selectedStaffExceptionDays = [];
    dayInWeekStaffException = [];
    removeStaffDays(selectedStaffDays);
    print("llll ${dayInWeek.length}");
    update();
    //
    // selectedStaffDays =[];
    // selectedStaffDays = days;
    // stepError = '';
    // update();
  }

  onChangedSelectedStaffExceptionDay(days) {
    selectedStaffExceptionDays = [];
    selectedStaffExceptionDays = days;
    stepError = '';
    print(
        "selectedStaffExceptionDays455 = ${selectedStaffExceptionDays.map((e) => e.name)}");
    update();
  }

  String staffText = '';
  List<Staffs> listOfStaff = [];
  String? staffError;

  String staffController = '';

  removeStaffFields() {
    print("يعني دتدخل لو مدتدخل؟");
    staffError = null;
    stepError = '';
    staffController = '';
    staffId = 0;
    selectedRole = null;
    selectedStaffDays = [];
    dateStringStaffTo = '';
    dateStringStaffFrom = '';
    dateStaffTo = null;
    dateStaffFrom = null;
    selectedStaffExceptionDays = [];
    dateStringStaffExceptionTo = '';
    dateStringStaffExceptionFrom = '';
    dateStaffExceptionTo = null;
    dateStaffExceptionFrom = null;
    selectedSlot = null;
    isCheckedId[1] = 0;
    // update();
  }

  cancelStaff() {
    removeStaffFields();
    Get.back();
    update();
  }

  List<int> isCheckedId = [0, 0];
  var staffName = '';
  var staffId = 0;
  bool isDoctor = false;
  List<int> isNotDoctor = [];

  Future checkPatientId(int index) async {
    isCheckedId[index] = 2;
    update();

    String string = '';
    if (index == 0) {
      string = ownerController;
    } else if (index == 1) {
      string = staffController;
    }

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $savedToken',
    };
    print('staffController.text$string');
    var request = http.Request(
        'GET',
        Uri.parse('https://shs-iq'
            '.com/api/api/search_by_personal_id/$string'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        // removeStaffFields();
        // update();
        // print(await response.stream.bytesToString());
        isCheckedId[index] = 1;
        print("بالنجاح ${isCheckedId[index]}");
        var data = jsonDecode(await response.stream.bytesToString());
        var dataMap = data['data'];
        staffName =
            '${dataMap["first_name"]} ${dataMap["second_name"]} ${dataMap["sure_name"]}';
        staffId = dataMap["id"];
        isAdded(index, staffId);
        print("staffName = $staffName");
        isDoctor = dataMap["is_doctor"];
        if (!isDoctor && index == 1) {
          isCheckedId[index] = 3;
          isNotDoctor.add(staffId);
        }
        update();
      } else {
        if (response.statusCode == 400) {
          staffError = ownerError = 'الرقم غير موجود';
        }
        isCheckedId[index] = 0;
        print(response.statusCode);
        update();
      }
    } on SocketException {
      staffError = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      staffError = 'يرجى التأكد من البيانات';
    } catch (e) {
      staffError = 'حدث خطأ ما $e';
    }
    update();
    print("staffError = $staffError");
    print("isCheckedId = $isCheckedId");
  }

  isAdded(index, int id) {
    if (index == 0) {
      if (listOfOwners.contains(id)) {
        isCheckedId[index] = 0;
        ownerError = "تمت اضافة المالك مسبقاً";
      }
    } else if (index == 1) {
      listOfStaff.forEach((element) {
        if (element.staffId == id) {
          isCheckedId[index] = 0;
          staffError = "تمت اضافة الطبيب مسبقاً";
        }
      });
    }
    update();
  }

  GetDataModel? selectedSlot;
  List<GetDataModel> slotTimes = [
    GetDataModel(id: 10, name: '10  دقيقة '),
    GetDataModel(id: 15, name: '15  دقيقة '),
    GetDataModel(id: 20, name: '20  دقيقة '),
    GetDataModel(id: 25, name: '25  دقيقة '),
    GetDataModel(id: 30, name: '30  دقيقة '),
    GetDataModel(id: 35, name: '35  دقيقة '),
    GetDataModel(id: 40, name: '40  دقيقة '),
    GetDataModel(id: 45, name: '45  دقيقة '),
    GetDataModel(id: 50, name: '50  دقيقة '),
    GetDataModel(id: 55, name: '55  دقيقة '),
    GetDataModel(id: 1, name: '1 ساعة'),
  ];

  onChangedSelectedSlot(slot) {
    selectedSlot = slot;
    print(selectedSlot!.id);
    stepError = '';
    update();
  }

  List<String> daysCons = [
    "SA",
    "SU",
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
  ];

  Map<String, String> days = {
    "SA": "السبت",
    "SU": "الأحد",
    "MO": "الإثنين",
    "TU": "الثلاثاء",
    "WE": "الأربعاء",
    "TH": "الخميس",
    "FR": "الجمعة",
  };

  Map<int, String> staffNames = {};

  addStaff() {
    if (isCheckedId[1] == 3 &&
        selectedStaffDays.isNotEmpty &&
        selectedRole != null) {
      staffError = null;
      List<AvailableSchedules> av = [];
      selectedStaffDays.forEach((element) {
        av.add(AvailableSchedules(
            startDate: "2021-11-30 00:00:00",
            endDate: "2021-11-30 00:00:00",
            isRecurring: 1,
            recurringWeekDay: daysCons[element.id! - 1],
            slotTime: "00:00:00"));
      });
      listOfStaff.add(
        Staffs(
          staffId: staffId,
          roleId: selectedRole!.id,
          availableSchedules: av,
          serviceFees: [],
        ),
      );
      staffNames.addAll({staffId: staffName});
      isCheckedId[1] = 0;
      update();
      Get.back();
      return;
    }
    if (staffController == '' ||
        staffId == 0 ||
        selectedRole == null ||
        selectedStaffDays.isEmpty ||
        dateStaffTo == null ||
        dateStaffFrom == null ||
        dateStringStaffFrom == '' ||
        dateStringStaffTo == '' ||
        selectedSlot == null) {
      stepError = 'يرجى ملىء جميع الحقول';
      print("ssttaaff error = $stepError");
      update();
      return;
    } else {
      staffError = null;
      String slotString = '01:00:00';
      if (selectedSlot!.id == 1) {
        slotString = "01:00:00";
      } else {
        slotString = "00:${selectedSlot!.id}:00";
      }

      List<AvailableSchedules> av = [];
      selectedStaffDays.forEach((element) {
        av.add(AvailableSchedules(
            startDate: dateStaffFrom.toString().substring(0, 19),
            endDate: dateStaffTo.toString().substring(0, 19),
            isRecurring: 1,
            recurringWeekDay: daysCons[element.id! - 1],
            slotTime: slotString));
      });
      print(
          "selectedStaffExceptionDays${selectedStaffExceptionDays.map((e) => e.name)}");
      if (selectedStaffExceptionDays.isNotEmpty &&
          dateStaffExceptionFrom != null &&
          dateStaffExceptionTo != null) {
        print("jjjjjjjjjjjjjjj");
        selectedStaffExceptionDays.forEach((element) {
          av.add(AvailableSchedules(
              startDate: dateStaffExceptionFrom.toString().substring(0, 19),
              endDate: dateStaffExceptionTo.toString().substring(0, 19),
              isRecurring: 1,
              recurringWeekDay: daysCons[element.id! - 1],
              slotTime: slotString));
        });
      }
      listOfStaff.add(
        Staffs(
          staffId: staffId,
          roleId: selectedRole!.id,
          availableSchedules: av,
          serviceFees: [],
        ),
      );
      dates.add([]);
      selectedStaffServices.addAll({staffId.toString(): []});
      staffNames.addAll({staffId: staffName});

      removeStaffFields();
      update();
    }
    isCheckedId[1] = 0;
    update();
    Get.back();
  }

  List<List<String>> dates = [];

  saveScheduleView(staff) {
    if (dates.length < listOfStaff.length) {
      dates = [];
      listOfStaff.forEach((element) {
        dates.add([]);
      });
    }
    print("لتكول هنا هم تدخل تسيف مرة لخ؟");
    int index = listOfStaff.indexOf(staff);
    prepareToEdit(staff);
    dates[index].add(selectedStaffDays.map((e) => e.name).toList().join(" - "));
    dates[index].add(
        formatDate(DateTime.parse(staff.availableSchedules![0].startDate!)));
    dates[index]
        .add(formatDate(DateTime.parse(staff.availableSchedules![0].endDate!)));
    if (selectedStaffExceptionDays.isNotEmpty) {
      dates[index].add(
          selectedStaffExceptionDays.map((e) => e.name).toList().join(" - "));
      dates[index].add(dateStringStaffExceptionFrom);
      dates[index].add(dateStringStaffExceptionTo);
    }
  }

  prepareToEdit(Staffs staffs) {
    print("المفروض يدخل هنيي");
    List<GetDataModel> ideat = [];
    List<GetDataModel> exceptionIdeat = [];
    String date1 = staffs.availableSchedules![0].startDate!;
    staffs.availableSchedules?.forEach((element) {
      for (int i = 0; i < 7; i++) {
        if (daysCons[i] == element.recurringWeekDay) {
          print("يوم ${daysCons[i]}");
          if (date1 == element.startDate) {
            ideat.add(dayInWeek[i]);
          } else {
            exceptionIdeat.add(dayInWeek[i]);
          }
        }
      }
    });
    print(
        "${isNotDoctor.contains(staffs.staffId)}مو دكتور${(staffs.staffId)}  ");
    if (isNotDoctor.contains(staffs.staffId)) {
      selectedStaffDays = ideat;
      selectedRole = role.where((element) => element.id == staffs.roleId).first;
      return;
    }
    print(ideat.length);
    selectedStaffDays = ideat;
    selectedStaffExceptionDays = exceptionIdeat;
    saveDatesStrings(staffs);
    // dateStaffFrom = DateTime.parse(staffs
    //     .availableSchedules![0]
    //     .startDate!);
    // dateStaffTo = DateTime.parse(staffs
    //     .availableSchedules![0]
    //     .endDate!);
    // dateStringStaffFrom = formatDate(DateTime.parse(staffs
    //     .availableSchedules![0]
    //   .startDate!));
    // dateStringStaffTo = formatDate(DateTime.parse(staffs
    //   .availableSchedules![0]
    //   .endDate!));
    selectedRole = role.where((element) => element.id == staffs.roleId).first;
    print(
        "staffs.availableSchedules![0].slotTime${staffs.availableSchedules![0].slotTime}");
    staffs.availableSchedules!.forEach((element) {
      print("jjjjj" + element.slotTime!);
    });
    if (staffs.availableSchedules![0].slotTime != "01:00:00") {
      print("hello my friendo");
      selectedSlot = slotTimes
          .where((element) =>
              element.id ==
              int.parse(
                  staffs.availableSchedules![0].slotTime!.substring(3, 5)))
          .first;
    } else {
      selectedSlot = slotTimes.last;
    }
  }

  removeStaff(Staffs staff) {
    print("before ${staffNames}");
    staffNames.remove(staff.staffId);
    listOfStaff.removeWhere((e) => e.staffId == staff.staffId);
    selectedStaffServices.remove(staff.staffId.toString());
    staffController = '';
    isCheckedId[1] = 0;
    if (isNotDoctor.contains(staff.staffId)) {
      isNotDoctor.remove(staffId);
    }
    print("after ${staffNames}");
    update();
  }

  editStaff(Staffs staff) {
    if (isNotDoctor.contains(staff.staffId)) {
      if (selectedRole != null || selectedStaffDays.isNotEmpty) {
        List<AvailableSchedules> av = [];
        selectedStaffDays.forEach((element) {
          av.add(AvailableSchedules(
              startDate: "2021-11-30 00:00:00",
              endDate: "2021-11-30 00:00:00",
              isRecurring: 1,
              recurringWeekDay: daysCons[element.id! - 1],
              slotTime: "00:00:00"));
        });
        staff.availableSchedules = av;
        staff.roleId = selectedRole!.id;
        staffController = '';
        staffId = 0;
        selectedRole = null;
        selectedStaffDays = [];
        dateStringStaffTo = '';
        dateStringStaffFrom = '';
        dateStaffTo = null;
        dateStaffFrom = null;
        selectedSlot = null;
      }
      isCheckedId[1] = 0;
      update();
      Get.back();
      return;
    }
    if (
        // staffController ==''||
        //     staffId ==0 ||
        selectedRole == null ||
            selectedStaffDays.isEmpty ||
            dateStaffTo == null ||
            dateStaffFrom == null ||
            dateStringStaffFrom == '' ||
            dateStringStaffTo == '' ||
            selectedSlot == null) {
      stepError = 'يرجى ملىء جميع الحقول';
      print("ssttaaff error = $stepError");
      update();
      return;
    } else {
      staffError = null;
      String slotString = '01:00:00';
      print("selectedSlot.id${selectedSlot!.id}");
      if (selectedSlot!.id == 1) {
        slotString = "01:00:00";
      } else {
        slotString = "00:${selectedSlot!.id}:00";
      }
      print("$slotStringبلللللللة؟");
      List<AvailableSchedules> av = [];
      selectedStaffDays.forEach((element) {
        av.add(AvailableSchedules(
            startDate: dateStaffFrom.toString().substring(0, 19),
            endDate: dateStaffTo.toString().substring(0, 19),
            isRecurring: 1,
            recurringWeekDay: daysCons[element.id! - 1],
            slotTime: slotString));
      });
      if (selectedStaffExceptionDays.isNotEmpty &&
          dateStaffExceptionFrom != null &&
          dateStaffExceptionTo != null) {
        selectedStaffExceptionDays.forEach((element) {
          av.add(AvailableSchedules(
              startDate: dateStaffExceptionFrom.toString().substring(0, 19),
              endDate: dateStaffExceptionTo.toString().substring(0, 19),
              isRecurring: 1,
              recurringWeekDay: daysCons[element.id! - 1],
              slotTime: slotString));
        });
      }
      staff.availableSchedules = av;
      staff.roleId = selectedRole!.id;

      removeStaffFields();
    }
    isCheckedId[1] = 0;
    update();
    Get.back();
  }

  //endregion

  //#region step5

  bool? registerOnAttendance = false;
  bool? reserveOnAttendance = false;
  bool? reserveOnline = false;
  bool? reserveByPhone = false;
  int? reserveOnAttendanceDurationId;
  int? reserveOnlineDurationId;
  int? reserveByPhoneDurationId;

  Widget settingsCheckboxes(CheckBoxState checkBoxState) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: generalColor,
      value: checkBoxState.value,
      title: textWidget(
        stringText: checkBoxState.title,
        fontSize: 17,
        color: Colors.black,
      ),
      onChanged: (value) {
        checkBoxState.value = value;
        update();
      },
    );
  }

  final listOfCheckboxes = [
    CheckBoxState(
      title: 'تسجيل الحجوزات عند الحضور',
      id: 1,
      value: false,
    ),
    CheckBoxState(
      title: 'الحجوزات الالكترونية',
      id: 2,
      value: false,
    ),
    CheckBoxState(
      title: 'الحجوزات بالهاتف',
      id: 3,
      value: false,
    ),
    CheckBoxState(
      title: 'الحجوزات المسبقة بالحضور',
      id: 4,
      value: false,
    ),
  ];

  setReserveCheckBox() {
    listOfCheckboxes[0].value = registerOnAttendance;
    listOfCheckboxes[1].value = reserveOnline;
    listOfCheckboxes[2].value = reserveByPhone;
    listOfCheckboxes[3].value = reserveOnAttendance;
    update();
  }

  setReserveCheckVariables() {
    registerOnAttendance = listOfCheckboxes[0].value;
    reserveOnline = listOfCheckboxes[1].value;
    reserveByPhone = listOfCheckboxes[2].value;
    reserveOnAttendance = listOfCheckboxes[3].value;
    update();
  }

  bool selectedCancelActivation = false;
  onPressedCancelActivation() {
    selectedCancelActivation = !selectedCancelActivation;
    update();
  }

  GetDataModel? selectedEReservation;
  GetDataModel? selectedPhoneReservation;
  GetDataModel? selectedOnPresenceReservation;
  int reservationId = 0;

  List<GetDataModel> reservationItemsMap = [
    GetDataModel(
      id: 1,
      name: 'قبل يوم',
    ),
    GetDataModel(
      id: 2,
      name: 'قبل إسبوع',
    ),
    GetDataModel(
      id: 3,
      name: 'قبل 10 أيام',
    ),
    GetDataModel(
      id: 4,
      name: 'قبل إسبوعين',
    ),
    GetDataModel(
      id: 5,
      name: 'قبل شهر',
    ),
    GetDataModel(
      id: 6,
      name: 'قبل شهرين',
    ),
    GetDataModel(
      id: 7,
      name: 'قبل 3 أشهر',
    ),
  ];

  onChangedSelectedEReservation(reservation) {
    selectedEReservation = reservation;
    print("selectedReservation.id = ${selectedEReservation!.id}");
    reserveOnlineDurationId = selectedEReservation!.id;
    update();
  }

  onChangedSelectedOnPresenceReservation(reservation) {
    selectedOnPresenceReservation = reservation;
    print("selectedReservation.id = ${selectedOnPresenceReservation!.id}");
    reserveOnAttendanceDurationId = selectedOnPresenceReservation!.id;
    update();
  }

  onChangedSelectedPhoneReservation(reservation) {
    selectedPhoneReservation = reservation;
    print("selectedReservation.id = ${selectedPhoneReservation!.id}");
    reserveByPhoneDurationId = selectedPhoneReservation!.id;
    update();
  }
  //#endregion

  //#region step6

  bool servicePriceSelectedOther = false;

  openServicePriceText() {
    servicePriceSelectedOther = true;
    update();
  }

  String servicePriceController = '';
  List<GetDataModel> services = [];

  List<String> servicePrices = [];

  Map<String, List<GetDataModel>> selectedStaffServices = {};

  // onFindServices(String? filter)  =>
  //     getData(
  //       filter,
  //       '$url/services',
  //     );

  onFindServicesList(String? filter) async {
    getData(
      filter,
      '$url/services',
    ).then((value) {
      services = value;
      if (services.isNotEmpty) {
        services.removeWhere((element) => element.id == 1);
      }
    }).onError((_, __) {
      return;
    });
  }

  List<String> otherServices = [];

  onChangedSelectedServices(List<GetDataModel> services, Staffs forIndex) {
    print(
        "111111111${selectedStaffServices[forIndex.staffId.toString()]!.length}");
    selectedStaffServices[forIndex.staffId.toString()]
        ?.removeWhere((element) => element.id != null);

    print(
        "222222222${selectedStaffServices[forIndex.staffId.toString()]!.length}");
    selectedStaffServices[forIndex.staffId.toString()]
        ?.addAll(services.where((element) => element.id != null));

    print(
        "333333333${selectedStaffServices[forIndex.staffId.toString()]!.length}");
    forIndex.serviceFees?.removeWhere((element) => element.serviceId != null);
    selectedStaffServices[forIndex.staffId.toString()]?.forEach((element) {
      if (element.id != null) {
        print("111111111${element.id}");
        forIndex.serviceFees?.add(ServiceFees(
          serviceId: element.id,
          price: 0,
          other: '',
          currency: 'IQD',
        ));
      }
    });
    update();
  }

  onChangedSelectedServices2(List<GetDataModel> services, Staffs forIndex) {
    print("111111111${selectedStaffServices[forIndex.staffId.toString()]!}");
    // selectedStaffServices[forIndex.staffId.toString()]?.removeWhere((element)
    // => element.id!=null);
    selectedStaffServices[forIndex.staffId.toString()]?.removeWhere(
        (element) => !services.map((e) => e.id).contains(element.id));

    print("222222222${selectedStaffServices[forIndex.staffId.toString()]!}");
    // selectedStaffServices[forIndex.staffId.toString()]?.addAll(services
    // .where((element) => element.id!=null));
    selectedStaffServices[forIndex.staffId.toString()]?.addAll(services.where(
        (element) => !selectedStaffServices[forIndex.staffId.toString()]!
            .map((e) => e.id)
            .contains(element.id)));

    print("333333333${selectedStaffServices[forIndex.staffId.toString()]!}");
    forIndex.serviceFees?.removeWhere(
        (element) => !services.map((e) => e.id).contains(element.serviceId));
    selectedStaffServices[forIndex.staffId.toString()]!
        .where((element) =>
            !forIndex.serviceFees!.map((e) => e.serviceId).contains(element.id))
        .forEach((element) {
      if (element.id != null) {
        print("111111111${element.id}");
        forIndex.serviceFees?.add(ServiceFees(
          serviceId: element.id,
          price: 0,
          other: '',
          currency: 'IQD',
        ));
      }
    });
    update();
  }

  onChangedOtherServices(service, Staffs forIndex) {
    if (service == null || service == '') {
      stepError = 'يرجى ادخال اسم الخدمة';
      update();
      return;
    }
    selectedStaffServices[forIndex.staffId.toString()]
        ?.addAll({GetDataModel(other: service, name: service)});
    forIndex.serviceFees?.add(ServiceFees(
      price: 0,
      other: service,
      currency: 'IQD',
    ));
    servicePriceSelectedOther = false;
    servicePriceController = '';
    otherServices.add(service);
    update();
  }

  List<GetDataModel> currencyMap = [
    GetDataModel(
      id: 1,
      name: 'دينار',
    ),
    GetDataModel(
      id: 2,
      name: 'دولار',
    ),
  ];

  GetDataModel selectedCurrency = GetDataModel(
    id: 1,
    name: 'دينار',
  );

  onChangedSelectedCurrency(currency, int index, Staffs staffs) {
    listOfStaff[listOfStaff.indexOf(staffs)].serviceFees?[index].currency =
        currency.id == 1 ? 'IQD' : 'USD';
    selectedCurrency = currency;
    update();
  }

  onChangePrice(price, int index, Staffs staffs) {
    listOfStaff[listOfStaff.indexOf(staffs)].serviceFees?[index].price =
        int.parse(price);
  }

  onChangedServicePriceController(name) {
    servicePriceController = name;
    stepError = '';
    update();
  }

  removeService2(Staffs staff, int index) {
    print("before${jsonEncode(staff.serviceFees)}");
    print("index = $index");
    selectedStaffServices[staff.staffId.toString()]?.removeAt(index);
    update();
    staff.serviceFees?.removeAt(index);
    print("after${jsonEncode(staff.serviceFees)}");
    for (int i = index; i < staff.serviceFees!.length; i++) {
      onChangePrice(staff.serviceFees![index].price.toString(), i, staff);
    }
    // onChangedSelectedServices(selectedStaffServices[staff.staffId.toString()
    // ]!, staff);
    update();
  }

  updatePrice(int index, Staffs staffs) {
    return listOfStaff[listOfStaff.indexOf(staffs)]
        .serviceFees?[index]
        .price
        .toString();
  }

  // List<Widget> servicesList(Staffs staff,context){
  //   List<Widget> services=[];
  //   for(int i =0 ; i<selectedStaffServices[
  //   staff.staffId
  //       .toString()]!.length;i++) {
  //     // print("2-staff.staffId"+ staff.staffId.toString());
  //     // print("3-selectedStaffServices[staff.staffId.toString()"
  //     //     "]${selectedStaffServices[
  //     // staff.staffId
  //     //     .toString()]}");
  //     // print("4-${selectedStaffServices[
  //     // staff.staffId
  //     //     .toString()]![i]
  //     //     .name} 44444 ${
  //     //     selectedStaffServices[
  //     //     staff.staffId
  //     //         .toString()]![i].other}");
  //     ServiceFees service = staff.serviceFees![i];
  //     services.add(Container(
  //         alignment: Alignment.centerRight,
  //         child: Column(
  //           crossAxisAlignment:
  //           CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 textWidget(
  //                     stringText:
  //                     selectedStaffServices[
  //                     staff.staffId
  //                         .toString()]![i]
  //                         .id==null? selectedStaffServices[
  //                         staff.staffId
  //                             .toString()]![i].other:selectedStaffServices[
  //                     staff.staffId
  //                         .toString()]![i]
  //                         .name,
  //                     // service.serviceId.toString(),
  //                     fontSize: 18,
  //                     color: Colors.black),
  //                 TextButton(
  //                     onPressed: ()=>removeService2(staff,i)
  //                     // onPressed: () {}
  //                     , child:
  //                 Container
  //                   (child: Icon(Icons
  //                     .delete_forever,color: Colors.red,),
  //                   alignment:
  //                   Alignment
  //                       .center,padding: EdgeInsets
  //                       .symmetric(horizontal: 10),))
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             GetBuilder(
  //               builder:
  //                   (InstitutionsSignupController
  //               c) {
  //                 return Row(
  //                   mainAxisAlignment:
  //                   MainAxisAlignment
  //                       .spaceBetween,
  //                   children: [
  //                     CustomDialogTextField(
  //                       width: SizeConfig()
  //                           .widthSize(
  //                           context, 40),
  //                       hintText: 'سعر الخدمة',
  //                       initialValue: service
  //                           .price
  //                           .toString() ==
  //                           '0'
  //                           ? ''
  //                           : service.price
  //                           .toString(),
  //                       name:
  //                       'price${service.serviceId}',
  //                       validator:
  //                       FormBuilderValidators
  //                           .compose([
  //                         FormBuilderValidators
  //                             .required(
  //                           context,
  //                           errorText:
  //                           textfieldErrorText,
  //                         ),
  //                       ]),
  //                       onChanged: (string) =>
  //                           c.onChangePrice(
  //                               string,
  //                               i,
  //                               staff),
  //                       autovalidateMode:
  //                       AutovalidateMode
  //                           .onUserInteraction,
  //                       keyboardType:
  //                       TextInputType.number,
  //                     ),
  //                     Container(
  //                       width: SizeConfig()
  //                           .widthSize(
  //                           context, 30),
  //                       height: SizeConfig()
  //                           .heightSize(
  //                           context, 7),
  //                       child: DropdownSearch<
  //                           GetDataModel?>(
  //                         dropdownSearchDecoration:
  //                         InputDecoration(
  //                           filled: true,
  //                           errorStyle: style(
  //                             fontSize: 12,
  //                             color: Colors.red,
  //                           ),
  //                           contentPadding:
  //                           EdgeInsets.all(
  //                               10),
  //                           isDense: false,
  //                           border:
  //                           OutlineInputBorder(
  //                             borderSide:
  //                             BorderSide.none,
  //                           ),
  //                         ),
  //                         maxHeight: 500,
  //                         items: c.currencyMap,
  //                         onChanged: (currency) =>
  //                             c.onChangedSelectedCurrency(
  //                                 currency,
  //                                 i,
  //                                 staff),
  //                         selectedItem:
  //                         GetDataModel(
  //                           id: service.currency ==
  //                               "IQD"
  //                               ? 1
  //                               : 2,
  //                           name:
  //                           service.currency ==
  //                               "IQD"
  //                               ? 'دينار'
  //                               : 'دولار',
  //                         ),
  //                         popupBarrierColor:
  //                         Colors.grey
  //                             .withOpacity(
  //                             0.5),
  //                         showAsSuffixIcons: true,
  //                         itemAsString: (u) {
  //                           return (u?.name).toString();
  //                         },
  //                         showSearchBox: true,
  //                         autoValidateMode:
  //                         AutovalidateMode
  //                             .onUserInteraction,
  //                         validator:
  //                         FormBuilderValidators
  //                             .compose([
  //                           FormBuilderValidators
  //                               .required(
  //                             context,
  //                             errorText:
  //                             dropdownErrorText,
  //                           ),
  //                         ]),
  //                         mode: Mode.DIALOG,
  //                         showClearButton: false,
  //                         popupSafeArea:
  //                         PopupSafeArea(
  //                           top: true,
  //                           bottom: true,
  //                         ),
  //                         clearButtonSplashRadius:
  //                         20,
  //                         popupItemBuilder:
  //                             (__, model, _) {
  //                           return Directionality(
  //                             textDirection:
  //                             TextDirection
  //                                 .rtl,
  //                             child: Container(
  //                               padding:
  //                               EdgeInsets
  //                                   .all(15),
  //                               child: Center(
  //                                 child:
  //                                 textWidget(
  //                                   stringText:
  //                                   model?.name ??
  //                                       '',
  //                                   fontSize: 20,
  //                                 ),
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                         dropdownBuilder: (__,
  //                             GetDataModel?
  //                             model) {
  //                           if (model == null) {
  //                             return Container();
  //                           }
  //                           return Directionality(
  //                             textDirection:
  //                             TextDirection
  //                                 .rtl,
  //                             child: Container(
  //                               child: Center(
  //                                 child:
  //                                 textWidget(
  //                                   stringText:
  //                                   model
  //                                       .name,
  //                                   fontSize: 17,
  //                                 ),
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                         emptyBuilder:
  //                             (_, item) {
  //                           return Center(
  //                             child: textWidget(
  //                               stringText:
  //                               "لا يوجد $item",
  //                               fontSize: 30,
  //                             ),
  //                           );
  //                         },
  //                         searchFieldProps:
  //                         TextFieldProps(
  //                           textDirection:
  //                           TextDirection.rtl,
  //                           decoration:
  //                           InputDecoration(
  //                             border:
  //                             OutlineInputBorder(),
  //                             contentPadding:
  //                             EdgeInsets
  //                                 .fromLTRB(
  //                                 12,
  //                                 12,
  //                                 8,
  //                                 0),
  //                             hintText:
  //                             "ابحث هنا",
  //                             hintStyle: style(),
  //                             hintTextDirection:
  //                             TextDirection
  //                                 .rtl,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 );
  //               },
  //             ),
  //
  //           ],
  //         ),
  //       ));
  //   }
  //   return services;
  // }

  //#endregion

  //region step7

  bool? showPhone = false;
  bool? showMessages = false;
  bool? showRecommendations = false;

  final listOfPrefCheckboxes = [
    CheckBoxState(
      title: 'إظهار الايميل الشخصي في الصفحة المهني',
      id: 2,
      value: false,
    ),
    CheckBoxState(
      title: 'امكانية التواصل بالرسائل عبر الصفحة المهنية',
      id: 3,
      value: false,
    ),
    CheckBoxState(
      title: 'إظهار التوصيات من الزملاء',
      id: 4,
      value: false,
    ),
  ];

  setPrefCheckBox() {
    listOfPrefCheckboxes[0].value = showPhone;
    listOfPrefCheckboxes[1].value = showMessages;
    listOfPrefCheckboxes[2].value = showRecommendations;
    update();
  }

  setPrefCheckVariables() {
    showPhone = listOfPrefCheckboxes[0].value;
    showMessages = listOfPrefCheckboxes[1].value;
    showRecommendations = listOfPrefCheckboxes[2].value;
    update();
  }

  //endregion

  //#region step8

  List<Widget> infoList = [];

  List<Widget> buildInfo() {
    List<Map<String, String>> listOfSingleInforms = [
      {
        "stringPreview": "المؤسسة",
        "stringShow": selectedOtherCategory!
            ? otherTextCategory!
            : selectedCategory!.name,
      },
      {
        "stringPreview":
            "اسم ال${selectedOtherCategory! ? otherTextCategory! : selectedCategory!.name}",
        "stringShow": institutionName,
      },
      {
        "stringPreview": "المالك",
        "stringShow": listOfOwnerNames.join('\n'),
      },
      {
        "stringPreview": "رقم التسجيل في النقابة",
        "stringShow": registrationNumber,
      },
      {
        "stringPreview": "الاختصاصات",
        "stringShow": listOfSpecialists
            .map((e) =>
                e.other ??
                selectedMedicalSpecialist
                    .where((element) => element.id == e.id)
                    .first
                    .name)
            .join('\n'),
      },
      {
        "stringPreview": "الخدمات العلاجية",
        "stringShow": listOfServices.map((e) => e.name!).join('\n') == ''
            ? 'لا '
                'يوجد'
            : listOfServices.map((e) => e.name!).join('\n'),
      },
      {
        "stringPreview": "المحافظة",
        "stringShow": '${selectedCity!.name}',
      },
      {
        "stringPreview": "المدينة",
        "stringShow": '${selectedDistrict!.name}',
      },
      {
        "stringPreview": "المنطقة",
        "stringShow": selectedRegion?.name ?? 'لا يوجد',
      },
      {
        "stringPreview": "وصف (اقرب نقطة)",
        "stringShow": closestPoint == '' ? 'لا يوجد' : closestPoint,
      },
      {
        "stringPreview": "ايام الدوام",
        "stringShow": selectedDays.map((e) => e.name).join(' - ') +
            '\n'
                '($dateStringFrom - $dateStringTo)',
      },
      {
        "stringPreview": "الاستثناءات",
        "stringShow": selectedExceptionDays.map((e) => e.name).join(' - ') == ''
            ? 'لا يوجد'
            : selectedExceptionDays.map((e) => e.name).join(' - ') +
                '\n'
                    '($dateStringExceptionFrom - $dateStringExceptionTo)',
      },
      {
        "stringPreview":
            "كادر ال${selectedOtherCategory! ? otherTextCategory! : selectedCategory!.name}",
        "stringShow": listOfStaff.map((e) {
          String ds1, ds2 = '';
          List<GetDataModel> ideat = [];
          e.availableSchedules?.forEach((element) {
            for (int i = 0; i < 7; i++) {
              if (daysCons[i] == element.recurringWeekDay) {
                ideat.add(dayInWeek[i]);
              }
            }
          });

          ds1 = formatDate(DateTime.parse(e.availableSchedules![0].startDate!));
          ds2 = formatDate(DateTime.parse(e.availableSchedules![0].endDate!));
          String showDates = isNotDoctor.contains(e.staffId)
              ? ''
              : '($ds1 - '
                  '$ds2)';
          return 'الإسم : ${staffNames[e.staffId]!}' +
              '\n الدور في الصفحة : ' +
              role.where((element) => element.id == e.roleId).first.name +
              '\nاوقات التواجد : ' +
              ideat.map((e) => e.name).join(' - ') +
              '\n' +
              showDates;
        }
            // +e.availableSchedules[0].
            ).join('\n\n'),
      },
    ];
    return listOfSingleInforms.map((e) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.1))),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDialogTextFieldTextContainer(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              margin: EdgeInsets.symmetric(vertical: 15),
              stringText: e['stringPreview'],
            ),
            Container(
              width: 200,
              child: textWidget(
                textAlign: TextAlign.end,
                stringText: e['stringShow'],
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
  //#endregion

  //#region Register Send
  Future send() async {
    try {
      onStepPin();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('$url/register_institution'));
      if (imageAvatar != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            (imageAvatar) as String,
          ),
        );
      }
      print(
          "jsonEncode(pinClinicInfo.toJson())******${jsonEncode(pinClinicInfo.toJson())}");
      request.fields.addAll({"json": jsonEncode(pinClinicInfo.toJson())});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        alertBar("تم التسجيل بنجاح", color: Colors.green.withOpacity(0.5));
        final box = GetStorage();
        box.remove('institutionInfo');
        clearAll();
        currentstep = 0;
        Future.delayed(Duration(seconds: 2),
            () => Get.offAllNamed(Routes.DOCTOR_DASHBOARD));
        // Get.clearRouteTree();
      } else {
        // print("here we go again"+await response.stream.bytesToString());
        if (response.statusCode == 401) {
          alertBar("يرجى تسجيل الدخول كطبيب لتسجيل هذه المؤسسة",
              color: Colors.red.withOpacity(0.5));
        } else {
          String error = await response.stream.bytesToString();
          if (error.contains("registration_no")) {
            alertBar('توجد مؤسسة بنفس رقم التسجيل في النقابة',
                color: Colors.red.withOpacity(0.5));
          } else if (error.contains("reserve")) {
            alertBar('يرجى اختيار حجوزات صالحة',
                color: Colors.red.withOpacity(0.5));
          } else {
            throw error;
          }
        }
        print({"json": jsonEncode(pinClinicInfo.toJson())});
      }
    } on SocketException {
      alertBar('يرجى الاتصال بالانترنت');
    } on FormatException {
      alertBar('يرجى التأكد من البيانات');
    } catch (e) {
      alertBar('حدث خطأ ما$e');
      print("\n\n$e\n\n");
    }
  }
  //#endregion

}
