// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as paths;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/signup/controllers/fetch_data.dart';
import 'package:shs108private/app/modules/signup/models/saved_data_in_mobile_model.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

String professionSignupToken = '';
final professionSignup = GetStorage();

final box = GetStorage();

class SignUpController extends GetxController {
// #region SignUp
  var formKey = GlobalKey<FormBuilderState>();

  int currentstep = 0;
  ScrollController scrollController = ScrollController();
  Map<String, dynamic>? map;
  SavedDataModel? toPinedJson;
  double? dropDownHeight = 60;
  double? textInputHeight = 60;
  changetextInputHeight() {
    textInputHeight = 75;
    update();
  }

  changedropDownHeight() {
    dropDownHeight = 80;
    update();
  }

  @override
  void onInit() {
    if (GetStorage().read('map') != null) {
      showEmail =
          SavedDataModel.fromJson(GetStorage().read('map')).setting?.showEmail;
      showMessages = SavedDataModel.fromJson(GetStorage().read('map'))
          .setting
          ?.showMessages;
      showPhone =
          SavedDataModel.fromJson(GetStorage().read('map')).setting?.showPhone;
      showRatings = SavedDataModel.fromJson(GetStorage().read('map'))
          .setting
          ?.showRatings;
      showRecommendations = SavedDataModel.fromJson(GetStorage().read('map'))
          .setting
          ?.showRecommendations;

      toPinedJson = SavedDataModel.fromJson(GetStorage().read('map'));
      if (toPinedJson?.doctor != null) {
        if (toPinedJson?.doctor?.username != null) {
          username = toPinedJson?.doctor?.username;
        } else {
          username = username;
        }
        if (toPinedJson?.doctor?.registrationNo != null) {
          registerNum = toPinedJson?.doctor?.registrationNo;
        } else {
          registerNum = registerNum;
        }
      }
      // ignore: prefer_is_empty
      if (toPinedJson?.doctorDescription?.length != 0) {
        if (toPinedJson?.doctorDescription?[0] != null) {
          arabicExperiences = toPinedJson?.doctorDescription?[0].experiences;
        } else {
          arabicExperiences = arabicExperiences;
        }
        if (toPinedJson?.doctorDescription?[1] != null) {
          englishExperiences = toPinedJson?.doctorDescription?[1].descriptions;
        } else {
          englishExperiences = englishExperiences;
        }
      }
      // ignore: prefer_is_empty
      if (toPinedJson?.emails?.length != 0) {
        if (toPinedJson?.emails?[0] != null) {
          email1 = toPinedJson?.emails?[0].email;
        } else {
          email1 = email1;
        }
        if (toPinedJson?.emails?[1] != null) {
          email2 = toPinedJson?.emails?[1].email;
        } else {
          email2 = email2;
        }
      }
      // ignore: prefer_is_empty
      if (toPinedJson?.phones?.length != 0) {
        if (toPinedJson?.phones?[0] != null) {
          phone1 = toPinedJson?.phones?[0].phone;
        } else {
          phone1 = phone1;
        }
        if (toPinedJson?.phones?[1] != null) {
          phone2 = toPinedJson?.phones?[1].phone;
        } else {
          phone2 = phone2;
        }
      }

      if (toPinedJson?.doctorCertificates != null) {
        listOfCertificates =
            toPinedJson?.doctorCertificates as List<DoctorCertificates>;
      } else {
        listOfCertificates = listOfCertificates;
      }
      if (toPinedJson?.treatments != null) {
        listOfTreatments = toPinedJson?.treatments as List<Treatments>;
      } else {
        listOfTreatments = listOfTreatments;
      }

      if (toPinedJson?.memberships != null) {
        listOfmemberships = toPinedJson?.memberships as List<Memberships>;
      } else {
        listOfmemberships = listOfmemberships;
      }

      if (toPinedJson?.trainingPrograms != null) {
        listOfTrainingPrograms =
            toPinedJson?.trainingPrograms as List<TrainingPrograms>;
      } else {
        listOfTrainingPrograms = listOfTrainingPrograms;
      }

      // ignore: prefer_is_empty
      if (toPinedJson?.doctorTitles?.length != 0) {
        selectedDegree = toPinedJson?.doctorTitles?[0];
      } else {
        selectedDegree = selectedDegree;
      }
      // ignore: prefer_is_empty
      if (toPinedJson?.medicalSpecialties?.length != 0) {
        selectedSpecilization = toPinedJson?.medicalSpecialties?[0];
      } else {
        selectedSpecilization = selectedSpecilization;
      }
      if (toPinedJson?.images != null) {
        listOfImages = toPinedJson?.images as List<Images>;
      } else {
        listOfImages = listOfImages;
      }
    }
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onStepPin() {
    print('phone1 = $phone1');
    print('email1 = $email1');
    map = SavedDataModel(
      doctor: Doctor(
        registrationNo: registerNum ?? '',
        username: username ?? '',
      ),
      doctorCertificates: listOfCertificates,
      memberships: listOfmemberships,
      doctorTitles: selectedDegree != null ? [selectedDegree] : [],
      medicalSpecialties:
          selectedSpecilization != null ? [selectedSpecilization] : [],
      treatments: listOfTreatments,
      trainingPrograms: listOfTrainingPrograms,
      images: listOfImages,
      imageAvatar: storedImageAvatar,
      imageCover: storedImageCover,
      doctorDescription: [
        DoctorDescription(
          languageCodeAr: 'ar',
          experiences: arabicExperiences ?? '',
        ),
        DoctorDescription(
          languageCodeEn: 'en',
          experiences: englishExperiences ?? '',
        ),
      ],
      emails: [
        Emails(email: email1 ?? ''),
        Emails(email: email2 ?? ''),
      ],
      phones: [
        Phones(phone: phone1 ?? ''),
        Phones(phone: phone2 ?? ''),
      ],
      setting: Setting(
        showEmail: showEmail,
        showMessages: showMessages,
        showPhone: showPhone,
        showRatings: showRatings,
        showRecommendations: showRecommendations,
      ),
    ).toJson();
    box.write('map', map);
    print("GetStorage().read('map') = ${GetStorage().read('map')}");
    toPinedJson = SavedDataModel.fromJson(GetStorage().read('map'));
    print('SavedDataModel.fromJsonToPinedJson = $toPinedJson');
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xFF0000FE),
      colorText: Colors.white,
      titleText: Center(
        child: textWidget(
          stringText: 'تم تثبيت التغييرات',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Center(
        child: textWidget(
          stringText: 'بامكانك اكمال عملية التسجيل لاحقا',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: EdgeInsets.all(20),
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 3),
      dismissDirection: SnackDismissDirection.VERTICAL,
      // dismissDirection: DismissDirection.vertical,
      margin: EdgeInsets.all(20),
      borderRadius: 20,
    );
    update();
  }

  onStepRemove() {
    box.remove('map');
    box.remove('image');
    update();
  }

  onStepContinue() {
    switch (currentstep) {
      case 0:
        if (!formKey.currentState!.saveAndValidate()) {
          print('not validated');
          certificateError = 'يرجى اختيار شهادة';
          dropDownHeight = 80;
          textInputHeight = 70;
          currentstep = currentstep;
          update();
        } else {
          // ignore: prefer_is_empty
          if (listOfCertificates.length != 0) {
            certificateError = '';
            currentstep++;
            update();
          } else {
            certificateError = 'يرجى اختيار شهادة';
            currentstep = currentstep;
            update();
          }
        }
        break;
      case 1:
        currentstep++;
        break;
      case 2:
        currentstep++;
        break;
      case 3:
        currentstep++;
        break;
      case 4:
        currentstep++;
        break;
      case 5:
        if (!formKey.currentState!.saveAndValidate()) {
          print('not validated');
        } else {
          currentstep++;
        }
        break;
      case 6:
        print('toPinedJson?.toJsonPost() = ${toPinedJson?.toJsonPost()}');
        postRegisteration();
        break;
    }
    update();
  }

  var registrationError = '';
  // String token = "57|EuZTZvHT1DNwjdGShS8Q7P6ODDqBeZfDTGzMGqrQ";
  Future postRegisteration() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $savedToken',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://shs-iq.com/api/api/register_doctor'),
    );
    onStepPin();
    Future.delayed(Duration(seconds: 1), () async {
      request.fields.addAll({"json": jsonEncode(toPinedJson?.toJsonPost())});

      // ignore: prefer_is_empty
      if (listOfImages.length != 0) {
        if (listOfImages[0] != null) {
          if (listOfImages[0].image != null) {
            request.files.add(
              await http.MultipartFile.fromPath(
                'image_1',
                listOfImages[0].image as String,
              ),
            );
            request.fields.addAll({
              "image_1_details": jsonEncode({
                "description": [
                  {
                    "language_code": "ar",
                    "description": listOfImages[0].arabicDescription
                  },
                  {
                    "language_code": "en",
                    "description": listOfImages[0].englishDescription
                  }
                ]
              })
            });
          }
        }
        if (listOfImages[1] != null) {
          if (listOfImages[1].image != null) {
            request.files.add(
              await http.MultipartFile.fromPath(
                'image_2',
                listOfImages[1].image as String,
              ),
            );
            request.fields.addAll({
              "image_2_details": jsonEncode({
                "description": [
                  {
                    "language_code": "ar",
                    "description": listOfImages[1].arabicDescription
                  },
                  {
                    "language_code": "en",
                    "description": listOfImages[1].englishDescription
                  }
                ]
              })
            });
          }
        }
        if (listOfImages[2] != null) {
          if (listOfImages[2].image != null) {
            request.files.add(
              await http.MultipartFile.fromPath(
                'image_3',
                listOfImages[2].image as String,
              ),
            );
            request.fields.addAll({
              "image_3_details": jsonEncode({
                "description": [
                  {
                    "language_code": "ar",
                    "description": listOfImages[2].arabicDescription
                  },
                  {
                    "language_code": "en",
                    "description": listOfImages[2].englishDescription
                  }
                ]
              })
            });
          }
        }
      }

      if (toPinedJson?.imageAvatar != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            (toPinedJson?.imageAvatar) as String,
          ),
        );
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print('response.statusCode = ${response.statusCode}');
        Map dataMap = jsonDecode(await response.stream.bytesToString());
        professionSignupToken = dataMap['success'];
        storedToken.write('token', dataMap['token']);

        savedToken = storedToken.read('token');

        Get.snackbar(
          '',
          '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          titleText: Center(
            child: textWidget(
              stringText: 'تم التسجيل بنجاح',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Container(),
          padding: EdgeInsets.all(15),
          snackStyle: SnackStyle.FLOATING,
          duration: Duration(seconds: 3),
          dismissDirection: SnackDismissDirection.VERTICAL,
          // dismissDirection: DismissDirection.vertical,
          margin: EdgeInsets.all(15),
          borderRadius: 20,
        );
        Future.delayed(Duration(seconds: 1), () {
          Get.offNamed(Routes.DOCTOR_DASHBOARD);
        });
      } else {
        print('response.statusCode = ${response.statusCode}');
        Map map = jsonDecode(await response.stream.bytesToString());
        print("map['data'] = ${map['data']}");
        if (map['data'] == 'This patient already has a professional account') {
          registrationError = 'لديك حساب مهني بالفعل. يرجى تسجيل الدخول';
          update();
        } else if (map['data'].toString().contains('registration_no') &&
            map['data'].toString().contains('username')) {
          registrationError =
              'رقم التسجيل مستخدم مسبقاً\nاسم المستخدم مسجل مسبقا';
          update();
        } else if (map['data'].toString().contains('registration_no')) {
          registrationError = 'رقم التسجيل موجود مسبقاً';
          update();
        } else if (map['data'].toString().contains('username')) {
          registrationError = 'اسم المستخدم مستخدم مسبقا';
          update();
        }
        Get.snackbar(
          '',
          '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          titleText: Center(
            child: textWidget(
              stringText: 'حدث خطأ بالتسجيل',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Center(
            child: textWidget(
              stringText: registrationError,
              color: Colors.white,
              fontSize: 20,
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
    });
  }

  onStepBack() {
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
    }
    update();
  }

  onStepTapped(index) {
    currentstep = index;
    update();
  }

// #endregion

// #region Step1 essential information
  /// register number
  String? registerNum;
  onChangedRegister(string) {
    registerNum = string;
    update();
  }

  // #region specialities
  bool? selectedOtherSpecialization = false;
  GetDataModel? selectedSpecilization;
  onFindSelectedSpecialization(String? filter) => getData(
        filter,
        '$url/medical_specialties',
      );

  onChangedOtherSelectedSpecialization(string) {
    selectedOtherSpecialization = true;
    selectedSpecilization = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: selectedOtherSpecialization,
    );
    changetextInputHeight();
    update();
  }

  onChangedSelectedSpecialization(specialization) {
    if (specialization?.id == 1) {
      selectedOtherSpecialization = true;
    } else {
      selectedOtherSpecialization = false;
    }
    selectedSpecilization = specialization;
    changedropDownHeight();
    update();
  }
  // #endregion

  // #region degrees
  bool? selectedOtherDegree = false;
  GetDataModel? selectedDegree;
  onFindSelectedDegree(String? filter) => getData(
        filter,
        '$url/doctor_titles',
      );
  onChangedOtherSelectedDegree(string) {
    selectedOtherDegree = true;
    selectedDegree = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: selectedOtherDegree,
    );
    update();
  }

  onChangedSelectedDegree(degree) {
    if (degree?.id == 1) {
      selectedOtherDegree = true;
    } else {
      selectedOtherDegree = false;
    }
    selectedDegree = degree;
    update();
  }
  // #endregion

  // #region Certificate Logic
  bool certificateUniversitySelectedOther = false;
  bool certificateSelectedOther = false;
  GetDataModel? certificate;
  GetDataModel? universe;
  String? certificateYear;
  List<DoctorCertificates> listOfCertificates = [];
  String? certificateError;
  String? certificateYearError;

  onFindUniversity(String? filter) => getData(
        filter,
        '$url/universities',
      );
  onFindCertificate(String? filter) => getData(
        filter,
        '$url/certificates',
      );

  onChangedYearGraduate(string) {
    if (string.length != 0) {
      if (int.parse(string) > DateTime.now().year) {
        certificateYearError = 'لا يسمح بادخال اكثر من السنه الحاليه';
        update();
      } else {
        certificateYear = string;
        certificateYearError = null;
        update();
      }
    }
  }

  onChangedUniversity(university) {
    if (university?.id == 1) {
      certificateUniversitySelectedOther = true;
    } else {
      certificateUniversitySelectedOther = false;
    }
    universe = university;
    update();
  }

  onChangedOtherUniversity(string) {
    certificateUniversitySelectedOther = true;
    universe = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: certificateUniversitySelectedOther,
    );
    update();
  }

  onChangedOtherCertificate(string) {
    certificateSelectedOther = true;
    certificate = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: certificateSelectedOther,
    );
    update();
  }

  onChangedCertificate(certificate1) {
    if (certificate1.id == 1) {
      certificateSelectedOther = true;
    } else {
      certificateSelectedOther = false;
    }
    certificate = certificate1;
    update();
  }

  onChangedUniversityEdit(university) {
    if (university?.id == 1) {
      certificateUniversitySelectedOther = true;
      update();
    } else {
      certificateUniversitySelectedOther = false;
      update();
    }
    universe = university;
    update();
  }

  onChangedCertificateEdit(certificate1) {
    if (certificate1?.id == 1) {
      certificateSelectedOther = true;
      update();
    } else {
      certificateSelectedOther = false;
      update();
    }
    certificate = certificate1;
    update();
  }

  cancelCertificate() {
    certificateSelectedOther = false;
    certificateUniversitySelectedOther = false;
    certificateYear = null;
    universe = null;
    certificate = null;
    update();
    Get.back();
  }

  addCertificate() {
    if (certificate == null && universe == null && certificateYear == null) {
      certificateError = 'يرجى ملئ جميع الحقول لاضافة الشهادة';
      update();
      Get.back();
    } else {
      certificateError = '';
      if (certificateYearError == null) {
        if (listOfCertificates.length < 20) {
          if (certificate != null &&
              universe != null &&
              certificateYear != null) {
            listOfCertificates.add(
              DoctorCertificates(
                universityInforms: universe,
                certificateInforms: certificate,
                graduationYear: certificateYear,
                selectedOtherUniversity: certificateUniversitySelectedOther,
                selectedOtherCertificate: certificateSelectedOther,
              ),
            );
            certificateYear = null;
            certificateSelectedOther = false;
            certificateUniversitySelectedOther = false;
            universe = null;
            certificate = null;
            update();
            Get.back();
          } else {
            certificateError = 'يرجى ملئ جميع الحقول لاضافة الشهادة';
            certificateYear = null;
            certificateSelectedOther = false;
            certificateUniversitySelectedOther = false;
            universe = null;
            certificate = null;
            update();
            Get.back();
          }
        } else {
          certificateYear = null;
          certificateSelectedOther = false;
          certificateUniversitySelectedOther = false;
          universe = null;
          certificate = null;
          update();
          Get.back();
        }
      } else {
        certificateYear = null;
        certificateSelectedOther = false;
        certificateUniversitySelectedOther = false;
        universe = null;
        certificate = null;
        certificateYearError = 'لا يسمح بادخال اكثر من السنه الحاليه';
        update();
        Get.back();
      }
    }
  }

  removeCertificate(DoctorCertificates certificate) {
    listOfCertificates.remove(certificate);
    update();
  }

  editCertificate(DoctorCertificates certificate1) {
    if (certificate1.certificateInforms != certificate) {
      certificate1.certificateInforms = certificate;
      update();
    }
    if (certificate1.certificateInforms == certificate) {}
    if (certificate1.universityInforms != universe) {
      certificate1.universityInforms = universe;
      update();
    }
    if (certificate1.universityInforms == universe) {}

    if (certificate1.certificateInforms?.other != certificate?.other) {
      certificate1.certificateInforms?.other = certificate?.other;
      update();
    }
    if (certificate1.certificateInforms?.other == certificate?.other) {}

    if (certificate1.universityInforms?.other != certificate?.other) {
      certificate1.universityInforms?.other = certificate?.other;
      update();
    }
    if (certificate1.universityInforms?.other == certificate?.other) {}
    if (certificate1.graduationYear != certificateYear) {
      certificate1.graduationYear = certificateYear;
      update();
    }
    if (certificate1.graduationYear == certificateYear) {}
    universe = null;
    certificate = null;
    certificateYear = null;
    update();

    Get.back();
  }

  // #endregion

  // #region Memberships Logic
  bool? membershipSelectedOther = false;
  List<Memberships> listOfmemberships = [];
  GetDataModel? member;
  String? membershipError;

  onFindMembership(String? filter) => getData(
        filter,
        '$url/memberships',
      );

  onChangedMembership(membership) {
    if (membership?.id == 1) {
      membershipSelectedOther = true;
    } else {
      membershipSelectedOther = false;
    }
    member = membership;
    update();
  }

  onChangedOtherMembership(string) {
    membershipSelectedOther = true;
    member = GetDataModel(
      id: 1,
      name: 'اخرى',
      other: string,
      selectedOther: membershipSelectedOther,
    );
    update();
  }

  onChangedMembershipEdit(membership) {
    if (membership?.id == 1) {
      membershipSelectedOther = true;
      update();
    } else {
      membershipSelectedOther = false;
      update();
    }
    member = membership;
    update();
  }

  cancelMembership() {
    member = null;
    update();

    Get.back();
  }

  addMembership() {
    if (member == null) {
      membershipError = 'يرجى ملئ احد الحقول لاضافة البرنامج';
      update();
      Get.back();
    } else {
      membershipError = '';
      if (listOfmemberships.length < 20) {
        listOfmemberships.add(
          Memberships(
            organizationsMemberships: member,
            selectedOther: membershipSelectedOther,
          ),
        );
      } else {
        membershipError = 'لا يمكنك اضافة المزيد';
        member = null;
        membershipSelectedOther = false;

        update();
        Get.back();
      }

      member = null;
      membershipSelectedOther = false;
      update();
      Get.back();
    }
    update();
  }

  removeMembership(Memberships membership) {
    listOfmemberships.remove(membership);
    update();
  }

  editMembership(Memberships membership) {
    if (membership.organizationsMemberships != member) {
      membership.organizationsMemberships = member;
      update();
    }
    if (membership.organizationsMemberships == member) {}
    if (membership.organizationsMemberships?.other != member?.other) {
      membership.organizationsMemberships?.other = member?.other;
      update();
    }
    if (membership.organizationsMemberships?.other == member?.other) {}

    member = null;
    update();

    Get.back();
  }

  // #endregion

// #endregion

// #region Step2 treatments
  String? treatment;
  String? treatmentError;
  List<Treatments> listOfTreatments = [];
  onChangedTreatment(string) {
    treatment = string;
    update();
  }

  cancelSpecialization() {
    treatment = null;
    Get.back();
    update();
  }

  addSpecialization() {
    if (treatment == null) {
      treatmentError = 'يرجى ملئ احد الحقول لاضافة البرنامج';
      treatment = null;
    } else {
      treatmentError = '';
      if (listOfTreatments.length < 20) {
        listOfTreatments.add(
          Treatments(name: treatment),
        );
      } else {
        treatmentError = 'لا يمكنك اضافة المزيد';
        treatment = null;
        update();
        Get.back();
      }
      treatment = null;
    }
    update();
    Get.back();
  }

  removeSpecialization(Treatments specialization) {
    listOfTreatments.remove(specialization);
    treatment = null;
    update();
  }

  editSpecialization(Treatments specialization) {
    if (specialization.name != treatment) {
      specialization.name = treatment;
    }
    if (specialization.name == treatment) {}
    treatment = null;
    update();
    Get.back();
  }
// #endregion

// #region Step3 experiances descriptions
  String? arabicExperiences;
  onChangedArabicExperiences(string) {
    arabicExperiences = string;
    update();
  }

  String? englishExperiences;
  onChangedEnglishExperiences(string) {
    englishExperiences = string;
    update();
  }

// #endregion

// #region Step4 training programs
  CountryModel? trainingCountry;
  String? trainingProgramError;
  String? trainingProgramDateError;
  List<TrainingPrograms> listOfTrainingPrograms = [];
  TrainingPrograms? singleProgram;
  String? trainingDate;
  onDateTimeChanged(value) {
    trainingDate = '${value.year}-${value.month}-${value.day}';
    update();
  }

  cancelDate() {
    trainingDate = null;
    print('trainingDate = $trainingDate');
    update();
    Get.back();
  }

  confirmDate() {
    print('trainingDate = $trainingDate');
    update();
    Get.back();
  }

  onFindCountry(String? filter) => getCountriesData(
        filter,
        '$url/countries',
      );

  onChangedCountry(cy) {
    trainingCountry = cy;
    update();
  }

  String? trainingName;
  onChangedtrainingName(string) {
    trainingName = string;
    update();
  }

  String? organization;
  onChangedorganization(string) {
    organization = string;
    update();
  }

  String? trainingDuration;
  onChangedtrainingDuration(string) {
    trainingDuration = string;
    update();
  }

  cancelProgram() {
    trainingName == null;
    organization == null;
    trainingDate == null;
    trainingCountry == null;
    organization == null;
    update();
    Get.back();
  }

  addProgram() {
    if (trainingName == null &&
        organization == null &&
        trainingDate == null &&
        trainingCountry == null &&
        organization == null) {
      trainingProgramError = 'يرجى ملئ جميع الحقول لاضافة البرنامج';
      update();
      Get.back();
    } else {
      trainingProgramError = '';
      if (listOfTrainingPrograms.length < 20) {
        if (trainingName != null &&
            organization != null &&
            trainingDate != null &&
            trainingCountry != null &&
            organization != null) {
          listOfTrainingPrograms.add(
            TrainingPrograms(
              name: trainingName,
              organization: organization,
              date: trainingDate,
              country: trainingCountry,
              duration: trainingDuration,
            ),
          );
          trainingName = null;
          organization = null;
          trainingDate = null;
          trainingCountry = null;
          organization = null;
          update();
          Get.back();
        } else {
          trainingProgramError = 'يرجى ملئ جميع الحقول لاضافة البرنامج';
          trainingName = null;
          organization = null;
          trainingDate = null;
          trainingCountry = null;
          organization = null;
          update();
          Get.back();
        }
      } else {
        trainingProgramError = 'لا يمكنك اضافة المزيد';
        trainingName = null;
        organization = null;
        trainingDate = null;
        trainingCountry = null;
        organization = null;
        update();
        Get.back();
      }
    }
  }

  removeProgram(TrainingPrograms program) {
    listOfTrainingPrograms.remove(program);
    update();
  }

  editProgram(TrainingPrograms program) {
    if (program.country != trainingCountry) {
      program.country = trainingCountry;
      update();
    }
    if (program.country == trainingCountry) {}
    if (program.name != trainingName) {
      program.name = trainingName;
      update();
    }
    if (program.name == trainingName) {}
    if (program.organization != organization) {
      program.organization = organization;
      update();
    }
    if (program.organization == organization) {}
    if (program.date != trainingDate) {
      program.date = trainingDate;
      update();
    }
    if (program.date == trainingDate) {}
    if (program.duration != trainingDuration) {
      program.duration = trainingDuration;
      update();
    }
    if (program.duration == trainingDuration) {}

    trainingName == null;
    organization == null;
    trainingDate == null;
    trainingCountry == null;
    organization == null;
    update();
    Get.back();
  }

// #endregion

// #region Step5 load images
  final ImagePicker _picker = ImagePicker();
  String? image;
  String? storedImage;
  final ImagePicker _pickerAvatar = ImagePicker();
  String? imageAvatar;
  String? storedImageAvatar;
  final ImagePicker _pickerCover = ImagePicker();
  String? imageCover;
  String? storedImageCover;

  List<Images> listOfImages = [];
  String? imageError;
  String? arabicDescriptionImage;
  onChangedarabicDescriptionImage(string) {
    arabicDescriptionImage = string;
    update();
  }

  String? englishDescriptionImage;
  onChangedenglishDescriptionImage(string) {
    englishDescriptionImage = string;
    update();
  }

  cancelImage() {
    arabicDescriptionImage = null;
    englishDescriptionImage = null;
    storedImage = null;
    image = null;
    update();
    Get.back();
  }

  addImage() {
    if (storedImage == null) {
      imageError = 'الرجاء اختيار صورة';
      arabicDescriptionImage = null;
      englishDescriptionImage = null;
      storedImage = null;
      image = null;
      update();
      Get.back();
    } else {
      imageError = '';
      if (listOfImages.length < 3) {
        print('11111111');
        if ((storedImage != null) &&
            (arabicDescriptionImage != null && arabicDescriptionImage != '') &&
            (englishDescriptionImage != null && arabicDescriptionImage != '')) {
          print('22222222');
          listOfImages.add(
            Images(
              image: storedImage,
              arabicDescription: arabicDescriptionImage ?? '',
              englishDescription: englishDescriptionImage ?? '',
            ),
          );
        } else {
          print('33333333');
          imageError = 'يرجى اضافة اوصاف الصورة ايضا';
          // storedImage = null;
          // image = null;
          // arabicDescriptionImage = null;
          // englishDescriptionImage = null;
          // update();
          // Get.back(canPop: false);
        }
        arabicDescriptionImage = null;
        englishDescriptionImage = null;
        storedImage = null;
        image = null;
        update();
        Get.back(canPop: false);
      } else {
        print('44444444');
        imageError = 'لا يمكنك اضافة المزيد';
        arabicDescriptionImage = null;
        englishDescriptionImage = null;
        storedImage = null;
        image = null;
        update();
        Get.back(canPop: false);
      }
    }
  }

  removeImage(Images image) {
    listOfImages.remove(image);
    update();
  }

  editImage(Images image) {
    if (image.arabicDescription != arabicDescriptionImage) {
      image.arabicDescription = arabicDescriptionImage;
    }
    if (image.arabicDescription == arabicDescriptionImage) {}
    if (image.englishDescription != englishDescriptionImage) {
      image.englishDescription = englishDescriptionImage;
    }
    if (image.englishDescription != englishDescriptionImage) {}

    if (storedImage != null) {
      image.image = storedImage;
      update();
    }
    Get.back();
  }

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

  onPressedCameraCover() async {
    imageCover = '';
    await _pickerCover
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        imageCover = value?.path;
        update();
      },
    );
    if (imageCover != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCover!,
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
        storedImageCover = localImage.path;
        update();
      }
    }
  }

  onPressedGalleryCover() async {
    imageCover = '';
    await _pickerCover
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        imageCover = value?.path;
        update();
      },
    );
    if (imageCover != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCover!,
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
        storedImageCover = localImage.path;
        update();
      }
    }
  }

  onPressedCamera() async {
    image = '';
    await _picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        image = value?.path;
        update();
      },
    );
    if (image != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image!,
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
        storedImage = localImage.path;
        update();
      }
    }
  }

  onPressedGallery() async {
    image = '';
    await _picker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        image = value?.path;
        update();
      },
    );
    if (image != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image!,
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
        storedImage = localImage.path;
        update();
      }
    }
  }

  onPressedCameraEdit() async {
    image = '';
    await _picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        image = value?.path;
        update();
      },
    );
    if (image != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image!,
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
        storedImage = localImage.path;
        update();
      }
    }
  }

  onPressedGalleryEdit() async {
    image = '';
    await _picker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        image = value?.path;
        update();
      },
    );
    if (image != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image!,
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
        storedImage = localImage.path;
        update();
      }
    }
  }
// #endregion

// #region Step6 privacy settings
  /// username
  String? username;
  onChangedUsername(string) {
    username = string;
    update();
  }

  /// emails
  String? email1;
  onChangedEmail1(string) {
    email1 = string;
    update();
  }

  String? email2;
  onChangedEmail2(string) {
    email2 = string;
    update();
  }

  /// phones
  String? phone1;
  onChangedPhone1(string) {
    phone1 = string;
    update();
  }

  String? phone2;
  onChangedPhone2(string) {
    phone2 = string;
    update();
  }

  /// settings
  int? showEmail = 0;
  int? showPhone = 0;
  int? showMessages = 0;
  int? showRecommendations = 0;
  int? showRatings = 0;

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
        checkbox.value = listOfCheckboxes.every((element) => element.value!);
        if (listOfCheckboxes[0].id == checkBoxState.id) {
          if (SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showPhone !=
              null) {
            if (SavedDataModel.fromJson(GetStorage().read('map'))
                    .setting
                    ?.showPhone ==
                1) {
              showPhone = 0;
            } else {
              showPhone = 1;
            }
          } else {
            if (checkBoxState.value == true) {
              showPhone = 1;
            } else {
              showPhone = 0;
            }
          }
        }
        if (listOfCheckboxes[1].id == checkBoxState.id) {
          if (SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showEmail !=
              null) {
            if (SavedDataModel.fromJson(GetStorage().read('map'))
                    .setting
                    ?.showEmail ==
                1) {
              showEmail = 0;
            } else {
              showEmail = 1;
            }
          } else {
            if (checkBoxState.value == true) {
              showEmail = 1;
            } else {
              showEmail = 0;
            }
          }
        }
        if (listOfCheckboxes[2].id == checkBoxState.id) {
          if (SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showMessages !=
              null) {
            if (SavedDataModel.fromJson(GetStorage().read('map'))
                    .setting
                    ?.showMessages ==
                1) {
              showMessages = 0;
            } else {
              showMessages = 1;
            }
          } else {
            if (checkBoxState.value == true) {
              showMessages = 1;
            } else {
              showMessages = 0;
            }
          }
        }
        if (listOfCheckboxes[3].id == checkBoxState.id) {
          if (SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showRecommendations !=
              null) {
            if (SavedDataModel.fromJson(GetStorage().read('map'))
                    .setting
                    ?.showRecommendations ==
                1) {
              showRecommendations = 0;
            } else {
              showRecommendations = 1;
            }
          } else {
            print('3checkBoxState.value = ${checkBoxState.value}');

            if (checkBoxState.value == true) {
              showRecommendations = 1;
            } else {
              showRecommendations = 0;
            }
          }
        }
        if (listOfCheckboxes[4].id == checkBoxState.id) {
          if (SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showRatings !=
              null) {
            if (SavedDataModel.fromJson(GetStorage().read('map'))
                    .setting
                    ?.showRatings ==
                1) {
              showRatings = 0;
            } else {
              showRatings = 1;
            }
          } else {
            print('4checkBoxState.value = ${checkBoxState.value}');

            if (checkBoxState.value == true) {
              showRatings = 1;
            } else {
              showRatings = 0;
            }
          }
        }
        update();
      },
    );
  }

  Widget selectAllCheckbox(CheckBoxState checkBoxState) {
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
        if (value == null) return;
        checkbox.value = value;
        // ignore: avoid_function_literals_in_foreach_calls
        listOfCheckboxes.forEach((element) {
          element.value = value;
          if (checkbox.value == true) {
            showEmail = 1;
            showPhone = 1;
            showMessages = 1;
            showRecommendations = 1;
            showRatings = 1;
          } else {
            showEmail = 0;
            showPhone = 0;
            showMessages = 0;
            showRecommendations = 0;
            showRatings = 0;
          }
        });
        update();
      },
    );
  }

  final listOfCheckboxes = [
    CheckBoxState(
      title: 'إظهار رقم الهاتف في الصفحة المهنية',
      id: 1,
      value: SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showPhone !=
              null
          ? (SavedDataModel.fromJson(GetStorage().read('map'))
                      .setting
                      ?.showPhone ==
                  1
              ? true
              : false)
          : false,
    ),
    CheckBoxState(
      title: 'إظهار الايميل الشخصي في الصفحة المهنية',
      id: 2,
      value: SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showEmail !=
              null
          ? (SavedDataModel.fromJson(GetStorage().read('map'))
                      .setting
                      ?.showEmail ==
                  1
              ? true
              : false)
          : false,
    ),
    CheckBoxState(
      title: 'امكانية التواصل بالرسائل عبر الصفحة المهنية',
      id: 3,
      value: SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showMessages !=
              null
          ? (SavedDataModel.fromJson(GetStorage().read('map'))
                      .setting
                      ?.showMessages ==
                  1
              ? true
              : false)
          : false,
    ),
    CheckBoxState(
      title: 'إظهار التوصيات من الزملاء',
      id: 4,
      value: SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showRecommendations !=
              null
          ? (SavedDataModel.fromJson(GetStorage().read('map'))
                      .setting
                      ?.showRecommendations ==
                  1
              ? true
              : false)
          : false,
    ),
    CheckBoxState(
      title: 'إظهار التوصيات والتقيميات من المرضى المراجعين',
      id: 5,
      value: SavedDataModel.fromJson(GetStorage().read('map'))
                  .setting
                  ?.showRatings !=
              null
          ? (SavedDataModel.fromJson(GetStorage().read('map'))
                      .setting
                      ?.showRatings ==
                  1
              ? true
              : false)
          : false,
    ),
  ];
  final checkbox = CheckBoxState(
    title: 'اختيار الكل',
    id: 0,
  );
  bool selectedCancelActivation = false;
  onPressedCancelActivation() {
    selectedCancelActivation = !selectedCancelActivation;
    update();
  }
// #endregion

// #region Step7 review information
  ScreenshotController screenshotController = ScreenshotController();
  Future<dynamic> showCapturedWidget(
    BuildContext context,
    String capturedImage,
  ) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage != null
                ? Image.file(File(capturedImage))
                : Container()),
      ),
    );
  }

  // Future<void> printInformation() async {
  //   PdfDocument document = PdfDocument();
  //   final page = document.pages.add();
  //   page.graphics.drawString(
  //     'Welcome to PDF Succinctly!',
  //     PdfStandardFont(PdfFontFamily.helvetica, 30),
  //   );
  //   page.graphics.drawImage(
  //     PdfBitmap(await _readImageData('doctor profile/cover.jpg')),
  //     Rect.fromLTWH(0, 100, 440, 550),
  //   );
  // PdfGrid grid = PdfGrid();
  // grid.style = PdfGridStyle(
  //   font: PdfStandardFont(PdfFontFamily.helvetica, 30),
  //   cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2),
  // );
  // grid.columns.add(count: 3);
  // grid.headers.add(1);
  // PdfGridRow header = grid.headers[0];
  // header.cells[0].value = 'Roll No';
  // header.cells[1].value = 'Name';
  // header.cells[2].value = 'Class';
  // PdfGridRow row = grid.rows.add();
  // row.cells[0].value = '1';
  // row.cells[1].value = 'Arya';
  // row.cells[2].value = '6';
  // row = grid.rows.add();
  // row.cells[0].value = '2';
  // row.cells[1].value = 'John';
  // row.cells[2].value = '9';
  // row = grid.rows.add();
  // row.cells[0].value = '3';
  // row.cells[1].value = 'Tony';
  // row.cells[2].value = '8';
  // grid.draw(
  //   page: document.pages.add(),
  //   bounds: const Rect.fromLTWH(0, 0, 0, 0),
  // );
  //   List<int> bytes = document.save();
  //   document.dispose();
  //   saveAndLaunchFile(bytes, 'Output.pdf');
  // }
  // Future<Uint8List> _readImageData(String name) async {
  //   final data = await rootBundle.load('assets/images/$name');
  //   return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  // }
  // Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  //   final path = (await getExternalStorageDirectory())?.path;
  //   final file = File('$path/$fileName');
  //   await file.writeAsBytes(bytes, flush: true);
  //   OpenFile.open('$path/$fileName');
  // }

// #endregion

}
