// ignore_for_file: unnecessary_overrides, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/deleted_notif_snackbar.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step6_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step7_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step8_doctor_edit.dart';

class EditDoctorScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // #region general
  var token = '131|cQJYCuZ6TPlZAgSG4BxRTODXh8nOZUoQ86dCkbk5';
  int currentstep = 7;
  var formKey = GlobalKey<FormBuilderState>();
  Future<DoctorProfile>? fetchDoctorProfileVar;
  onStepTapped(index) {
    currentstep = index;
    update();
  }

  Widget saveChangesStep(
    ButtonState state,
    Function? onPressed,
  ) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ProgressButton.icon(
          iconedButtons: {
            ButtonState.idle: IconedButton(
              text: "حفظ التغييرات",
              icon: Icon(Icons.save, color: Colors.white),
              color: generalColor,
            ),
            ButtonState.loading: IconedButton(
              text: "إنتظار",
              color: generalColor,
            ),
            ButtonState.fail: IconedButton(
              text: "فشل",
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red.shade300,
            ),
            ButtonState.success: IconedButton(
              text: "نجاح",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400,
            ),
          },
          maxWidth: 160.0,
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.white,
            strokeWidth: 2.0,
          ),
          minWidth: 50.0,
          height: 39.0,
          radius: 15.0,
          progressIndicatorSize: 25.0,
          textStyle: style(
            fontSize: 15,
            color: Colors.white,
          ),
          onPressed: onPressed,
          state: state,
        ),
      ),
    );
  }

  sureToDeleteDialog({void Function()? onPressed}) {
    Get.defaultDialog(
      title: "تأكيد الحذف",
      titleStyle: style(
        color: Colors.black,
        fontSize: 20,
      ),
      confirm: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: generalColor, width: 2),
            ),
          ),
        ),
        child: textWidget(
          stringText: 'تأكيد',
          color: Colors.black,
          fontSize: 17,
        ),
        onPressed: onPressed,
      ),
      cancel: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: generalColor,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: () => Get.back(),
        child: textWidget(
          stringText: 'الغاء',
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: generalColor,
      barrierDismissible: true,
      radius: 40,
      titlePadding: EdgeInsets.all(20),
      content: Container(),
    );
  }

  Future request({
    String? url,
    Map<String, String>? map,
    String? requestType,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      // 'Authorization': 'Bearer $savedToken',
    };

    var request = http.MultipartRequest(requestType ?? 'POST', Uri.parse(url!));
    if (map != null) {
      request.fields.addAll(map);
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print('@success@data = $data');
      return data;
    } else {
      var data = jsonDecode(await response.stream.bytesToString());
      print('@fail@data = $data');
      return data;
    }
  }

  Future<DoctorProfile> fetchDoctorProfile() async {
    var headers = {
      'Authorization': 'Bearer $token',
      // 'Authorization': 'Bearer $savedToken',
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse('$url/doctor_profile'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      DoctorProfile data = DoctorProfile.fromJson(
        jsonDecode(
          await response.stream.bytesToString(),
        )[0],
      );
      doctorDescriptionList = data.doctorDescription;
      phonesList = data.phones;
      emailsList = data.emails;
      certificatesList = data.doctorCertificates;
      membershipsList = data.memberships;

      // print('certificatesList = $certificatesList');
      getAllInputsData();
      return data;
    } else {
      var data = jsonDecode(await response.stream.bytesToString());
      print('else data = $data');
      return data;
    }
  }

  getAllInputsData() {
    intialValueOfArabicDescription();
    intialValueOfEnglishDescription();
    toShowSuffexDoctorDescription1();
    toShowSuffexDoctorDescription2();
    intialValueOfDoctorphone1();
    intialValueOfDoctorphone2();
    toShowSuffexDoctorPhone1();
    toShowSuffexDoctorPhone2();
    intialValueOfDoctoremail1();
    intialValueOfDoctoremail2();
    toShowSuffexDoctorEmail1();
    toShowSuffexDoctorEmail2();
  }

  Future<List<DropDownType>> getDropDownListData({
    required String? url,
    String? filter,
    List<DropDownType>? dropDownList,
  }) async {
    var request = http.Request(
      'GET',
      Uri.https(
        'shs-iq.com',
        '/api/api/$url',
        {"filter": filter},
      ),
    );

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseList = jsonDecode(await response.stream.bytesToString());
      List<DropDownType> list = responseList
          .map<DropDownType>((data) => DropDownType.fromJson(data))
          .toList();
      list.map((e) {
        dropDownList?.add(e);
      }).toList();
      update();
      return list;
    } else {
      var list = jsonDecode(await response.stream.bytesToString());
      return list;
    }
  }

  @override
  void onInit() {
    fetchDoctorProfileVar = fetchDoctorProfile();
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

// #endregion

// #region Step0
  ButtonState stateTextWithIcon0 = ButtonState.idle;
  FAStepstate step0State = FAStepstate.editing;

  String? registrationNo;
  registrationNoChanged(val) {
    registrationNo = val;
    update();
  }

  String? userName;
  userNameChanged(val) {
    userName = val;
    update();
  }

  Widget saveChangesStep0() => saveChangesStep(
        stateTextWithIcon0,
        () {
          switch (stateTextWithIcon0) {
            case ButtonState.idle:
              stateTextWithIcon0 = ButtonState.loading;
              update();
              doctorInfoEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon0 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon0 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  doctorInfoEdit() {
    if (registrationNo != null) {
      request(
        url: '$url/update_doctor_profile/info',
        map: {
          'registration_no': '$registrationNo',
          'username': userName ?? 'taha_saad96',
          '_method': 'PUT',
        },
      ).then((value) {
        if (value["registration_no"] == '') {
          stateTextWithIcon0 = ButtonState.success;
          step0State = FAStepstate.complete;
          update();
        }
        if (value['success'] == false || value['success'] == 'false') {
          stateTextWithIcon0 = ButtonState.fail;
          step0State = FAStepstate.error;
          update();
        }
      });
    } else {
      stateTextWithIcon0 = ButtonState.success;
      step0State = FAStepstate.complete;
      update();
    }
  }

// #endregion

// #region Step1
  ButtonState stateTextWithIcon1 = ButtonState.idle;
  FAStepstate step1State = FAStepstate.editing;

  dynamic medicalSpecialty;
  List<dynamic>? medicalSpecialtyList = [];
  String? medicalSpecialtyOther;
  bool? selectedMedicalSpecialtyOther;

  medicalSpecialtyChanged(val) {
    medicalSpecialty = val;
    selectedMedicalSpecialtyOther = medicalSpecialty["id"] == 1 ? true : false;
    update();
  }

  medicalSpecialtyOtherChanged(val) {
    medicalSpecialtyOther = val;
    update();
  }

  Widget saveChangesStep1() => saveChangesStep(
        stateTextWithIcon1,
        () {
          switch (stateTextWithIcon1) {
            case ButtonState.idle:
              stateTextWithIcon1 = ButtonState.loading;
              update();
              doctorMedicalSpecialityEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon1 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon1 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  doctorMedicalSpecialityEdit() {
    if (medicalSpecialty != null || medicalSpecialtyOther != null) {
      if (medicalSpecialtyOther != null && (medicalSpecialty == null)) {
        request(
          url: '$url/update_doctor_profile/medical_specialties',
          map: {
            '_method': 'PUT',
            'medical_specialties': '[{"other": "$medicalSpecialtyOther"}]'
          },
        ).then((value) {
          stateTextWithIcon1 = ButtonState.success;
          step1State = FAStepstate.complete;
          update();
        });
      }
      if (medicalSpecialty != null && medicalSpecialtyOther != null) {
        if (medicalSpecialty["id"] == 1) {
          request(
            url: '$url/update_doctor_profile/medical_specialties',
            map: {
              '_method': 'PUT',
              'medical_specialties': '[{"other": "$medicalSpecialtyOther"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        } else {
          request(
            url: '$url/update_doctor_profile/medical_specialties',
            map: {
              '_method': 'PUT',
              'medical_specialties': '[{"id": "${medicalSpecialty["id"]}"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        }
      }
      if (medicalSpecialty != null && medicalSpecialtyOther != null) {
        if (medicalSpecialty["id"] == 1) {
          request(
            url: '$url/update_doctor_profile/medical_specialties',
            map: {
              '_method': 'PUT',
              'medical_specialties': '[{"other": "$medicalSpecialtyOther"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        } else {
          request(
            url: '$url/update_doctor_profile/medical_specialties',
            map: {
              '_method': 'PUT',
              'medical_specialties': '[{"id": "${medicalSpecialty["id"]}"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        }
      }
      if (medicalSpecialty != null && medicalSpecialtyOther == null) {
        request(
          url: '$url/update_doctor_profile/medical_specialties',
          map: {
            '_method': 'PUT',
            'medical_specialties': '[{"id": "${medicalSpecialty["id"]}"}]'
          },
        ).then((value) {
          stateTextWithIcon1 = ButtonState.success;
          step1State = FAStepstate.complete;
          update();
        });
      }
    } else {
      stateTextWithIcon1 = ButtonState.success;
      step1State = FAStepstate.complete;
      update();
    }
  }

// #endregion

// #region Step2
  ButtonState stateTextWithIcon2 = ButtonState.idle;
  FAStepstate step2State = FAStepstate.editing;

  dynamic doctorTitle;
  List<dynamic>? doctorTitleList = [];
  String? doctorTitleOther;
  bool? selectedDoctorTitleOther;

  doctorTitleChanged(val) {
    doctorTitle = val;
    selectedDoctorTitleOther = doctorTitle["id"] == 1 ? true : false;
    update();
  }

  doctorTitleOtherChanged(val) {
    doctorTitleOther = val;
    update();
  }

  Widget saveChangesStep2() => saveChangesStep(
        stateTextWithIcon2,
        () {
          switch (stateTextWithIcon2) {
            case ButtonState.idle:
              stateTextWithIcon2 = ButtonState.loading;
              update();
              doctorTitleEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon2 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon2 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  doctorTitleEdit() {
    if (doctorTitle != null || doctorTitleOther != null) {
      if (doctorTitleOther != null && (doctorTitle == null)) {
        request(
          url: '$url/update_doctor_profile/titles',
          map: {'_method': 'PUT', 'titles': '[{"other": "$doctorTitleOther"}]'},
        ).then((value) {
          stateTextWithIcon1 = ButtonState.success;
          step1State = FAStepstate.complete;
          update();
        });
      }
      if (doctorTitle != null && doctorTitleOther != null) {
        if (doctorTitle["id"] == 1) {
          request(
            url: '$url/update_doctor_profile/titles',
            map: {
              '_method': 'PUT',
              'titles': '[{"other": "$doctorTitleOther"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        } else {
          request(
            url: '$url/update_doctor_profile/titles',
            map: {
              '_method': 'PUT',
              'titles': '[{"id": "${doctorTitle["id"]}"}]'
            },
          ).then((value) {
            stateTextWithIcon1 = ButtonState.success;
            step1State = FAStepstate.complete;
            update();
          });
        }
      }
      if (doctorTitle != null && doctorTitleOther == null) {
        request(
          url: '$url/update_doctor_profile/titles',
          map: {'_method': 'PUT', 'titles': '[{"id": "${doctorTitle["id"]}"}]'},
        ).then((value) {
          stateTextWithIcon1 = ButtonState.success;
          step1State = FAStepstate.complete;
          update();
        });
      }
    } else {
      stateTextWithIcon2 = ButtonState.success;
      step2State = FAStepstate.complete;
      update();
    }
  }

// #endregion

// #region Step3
  ButtonState stateTextWithIcon3 = ButtonState.idle;
  FAStepstate step3State = FAStepstate.editing;
  List<DoctorDescription>? doctorDescriptionList;

  String? arabicDoctorDescription;
  TextEditingController? arabicDoctorDescriptionController;
  bool? arabicDoctorDescriptionDeleteOrNot;
  arabicDoctorDescriptionChanged(val) {
    arabicDoctorDescription = val;
    update();
  }

  String? englishDoctorDescription;
  TextEditingController? englishDoctorDescriptionController;
  bool? englishDoctorDescriptionDeleteOrNot;

  englishDoctorDescriptionChanged(val) {
    englishDoctorDescription = val;
    update();
  }

  Widget saveChangesStep3() => saveChangesStep(
        stateTextWithIcon3,
        () {
          switch (stateTextWithIcon3) {
            case ButtonState.idle:
              stateTextWithIcon3 = ButtonState.loading;
              update();
              doctorDescriptionEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon3 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon3 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  doctorDescriptionEdit() {
    if (doctorDescriptionList?.length == 0) {
      Future.wait([
        request(
          url: '$url/doctor_description',
          map: {
            'language_code': 'ar',
            'experiences': '$arabicDoctorDescription'
          },
        ),
        request(
          url: '$url/doctor_description',
          map: {
            'language_code': 'en',
            'experiences': '$englishDoctorDescription'
          },
        ),
      ]).then((value) {
        stateTextWithIcon3 = ButtonState.success;
        step3State = FAStepstate.complete;
        update();
      });
    }
    if (doctorDescriptionList?.length == 1) {
      if (doctorDescriptionList?[0].languageCode == 'ar' ||
          doctorDescriptionList?[0].languageCode == 'AR') {
        Future.wait([
          request(
            url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
            map: {
              'language_code': 'ar',
              '_method': 'PUT',
              'experiences': '$arabicDoctorDescription'
            },
          ),
          request(
            url: '$url/doctor_description',
            map: {
              'language_code': 'en',
              'experiences': '$englishDoctorDescription'
            },
          ),
        ]).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      } else {
        Future.wait([
          request(
            url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
            map: {
              'language_code': 'en',
              '_method': 'PUT',
              'experiences': '$englishDoctorDescription'
            },
          ),
          request(
            url: '$url/doctor_description',
            map: {
              'language_code': 'ar',
              'experiences': '$arabicDoctorDescription'
            },
          ),
        ]).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      }
    }
    if ((doctorDescriptionList?.length)! >= 2) {
      print('@@@@@@@@@@@@2wadae@@@@@@@');
      print(
          'doctorDescriptionList?[0].languageCode: ${doctorDescriptionList?[0].languageCode}');
      if (doctorDescriptionList?[0].languageCode == 'ar' ||
          doctorDescriptionList?[0].languageCode == 'AR') {
        print('00@@@ar');
        request(
          url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
          map: {
            'language_code': 'ar',
            '_method': 'PUT',
            'experiences': '$arabicDoctorDescription'
          },
        ).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      } else {
        print('00@@@en');

        request(
          url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
          map: {
            'language_code': 'en',
            '_method': 'PUT',
            'experiences': '$englishDoctorDescription'
          },
        ).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      }
      if (doctorDescriptionList?[1].languageCode == 'en' ||
          doctorDescriptionList?[1].languageCode == 'EN') {
        //print('11@@@ar');
        request(
          url: '$url/doctor_description/${doctorDescriptionList?[1].id}',
          map: {
            'language_code': 'en',
            '_method': 'PUT',
            'experiences': '$englishDoctorDescription'
          },
        ).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      } else {
        print('11@@@ar');
        print(
            'doctorDescriptionList?[1].languageCode: ${doctorDescriptionList?[1].languageCode}');

        request(
          url: '$url/doctor_description/${doctorDescriptionList?[1].id}',
          map: {
            'language_code': 'ar',
            '_method': 'PUT',
            'experiences': '$arabicDoctorDescription'
          },
        ).then((value) {
          stateTextWithIcon3 = ButtonState.success;
          step3State = FAStepstate.complete;
          update();
        });
      }
    }
  }

  intialValueOfArabicDescription() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode == 'ar' ||
            doctorDescriptionList?[0].languageCode == 'AR') {
          arabicDoctorDescription = doctorDescriptionList?[0].experiences;
          arabicDoctorDescriptionController =
              TextEditingController(text: arabicDoctorDescription);
        }
        if ((doctorDescriptionList?.length)! >= 2) {
          if (doctorDescriptionList?[1].languageCode == 'ar' ||
              doctorDescriptionList?[1].languageCode == 'AR') {
            arabicDoctorDescription = doctorDescriptionList?[1].experiences;
            arabicDoctorDescriptionController =
                TextEditingController(text: arabicDoctorDescription);
          }
        }
      }
    }
  }

  intialValueOfEnglishDescription() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode == 'en' ||
            doctorDescriptionList?[0].languageCode == 'EN') {
          englishDoctorDescription = doctorDescriptionList?[0].experiences;
          englishDoctorDescriptionController =
              TextEditingController(text: englishDoctorDescription);
          arabicDoctorDescriptionDeleteOrNot = true;
        }
        if ((doctorDescriptionList?.length)! >= 2) {
          if (doctorDescriptionList?[1].languageCode == 'en' ||
              doctorDescriptionList?[1].languageCode == 'EN') {
            englishDoctorDescription = doctorDescriptionList?[1].experiences;
            englishDoctorDescriptionController =
                TextEditingController(text: englishDoctorDescription);
            arabicDoctorDescriptionDeleteOrNot = true;
          }
        }
      }
    }
  }

  toShowSuffexDoctorDescription1() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode?.toLowerCase() == 'ar') {
          arabicDoctorDescriptionDeleteOrNot = true;
        }
        if ((doctorDescriptionList?.length)! >= 2) {
          if (doctorDescriptionList?[1].languageCode?.toLowerCase() == 'ar') {
            arabicDoctorDescriptionDeleteOrNot = true;
          } else {
            arabicDoctorDescriptionDeleteOrNot = false;
          }
        }
      }
    } else {
      arabicDoctorDescriptionDeleteOrNot = false;
    }
  }

  toShowSuffexDoctorDescription2() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode?.toLowerCase() == 'en') {
          englishDoctorDescriptionDeleteOrNot = true;
        }
        if ((doctorDescriptionList?.length)! >= 2) {
          if (doctorDescriptionList?[1].languageCode?.toLowerCase() == 'en' ||
              doctorDescriptionList?[0].languageCode?.toLowerCase() == 'en') {
            englishDoctorDescriptionDeleteOrNot = true;
          } else {
            englishDoctorDescriptionDeleteOrNot = false;
          }
        }
      }
    } else {
      englishDoctorDescriptionDeleteOrNot = false;
    }
  }

  deleteDoctorDescription1() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode?.toLowerCase() == 'ar') {
          sureToDeleteDialog(
            onPressed: () {
              request(
                url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
                requestType: 'DELETE',
              ).then(
                (val) {
                  arabicDoctorDescriptionDeleteOrNot = false;
                  update();
                  if (val.toString().contains('successfully')) {
                    deletedNotiSnackbar;
                  }
                },
              );
              arabicDoctorDescriptionDeleteOrNot = false;
              arabicDoctorDescriptionController?.clear();
              update();
              Get.back();
            },
          );
        }
      }
      if ((doctorDescriptionList?.length)! >= 2) {
        if (doctorDescriptionList?[1].languageCode?.toLowerCase() == 'ar') {
          sureToDeleteDialog(
            onPressed: () {
              request(
                url: '$url/doctor_description/${doctorDescriptionList?[1].id}',
                requestType: 'DELETE',
              ).then((val) {
                if (val.toString().contains('successfully')) {
                  deletedNotiSnackbar;
                }
              });
              arabicDoctorDescriptionDeleteOrNot = false;
              arabicDoctorDescriptionController?.clear();
              update();
              Get.back;
            },
          );
        } else {
          return null;
        }
      }
    } else {
      return null;
    }
  }

  deleteDoctorDescription2() {
    if (doctorDescriptionList?.length != 0) {
      if ((doctorDescriptionList?.length)! >= 1) {
        if (doctorDescriptionList?[0].languageCode?.toLowerCase() == 'en') {
          sureToDeleteDialog(
            onPressed: () {
              request(
                url: '$url/doctor_description/${doctorDescriptionList?[0].id}',
                requestType: 'DELETE',
              ).then((val) {
                if (val.toString().contains('successfully')) {
                  deletedNotiSnackbar;
                }
              });
              englishDoctorDescriptionDeleteOrNot = false;
              englishDoctorDescriptionController?.clear();
              update();
              Get.back();
            },
          );
        }
        if ((doctorDescriptionList?.length)! >= 2) {
          if (doctorDescriptionList?[1].languageCode?.toLowerCase() == 'en') {
            sureToDeleteDialog(
              onPressed: () {
                request(
                  url:
                      '$url/doctor_description/${doctorDescriptionList?[1].id}',
                  requestType: 'DELETE',
                ).then((val) {
                  if (val.toString().contains('successfully')) {
                    deletedNotiSnackbar;
                  }
                });
                englishDoctorDescriptionDeleteOrNot = false;
                englishDoctorDescriptionController?.clear();

                update();
                Get.back;
              },
            );
          } else {
            return null;
          }
        }
      }
    } else {
      return null;
    }
  }

// #endregion

// #region Step4
  ButtonState stateTextWithIcon4 = ButtonState.idle;
  FAStepstate step4State = FAStepstate.editing;
  List<PhonesDoctor>? phonesList;
  String? doctorphone1;
  TextEditingController? doctorPhone1Controller;
  bool? doctorPhone1DeleteOrNot;

  doctorphone1Changed(val) {
    print('val = $val');
    if (val != '') {
      print('@@@@val = $val');
      doctorphone1 = '+964${val.substring(1)}';
      print('doctorphone1 = $doctorphone1');
    } else {
      doctorphone1 = '';
    }
    update();
  }

  String? doctorphone2;
  TextEditingController? doctorPhone2Controller;
  bool? doctorPhone2DeleteOrNot;

  doctorphone2Changed(val) {
    print('val = $val');
    if (val != '') {
      doctorphone2 = '+964${val.substring(1)}';
      print('doctorphone2 = $doctorphone2');
    }
    update();
  }

  Widget saveChangesStep4() => saveChangesStep(
        stateTextWithIcon4,
        () {
          switch (stateTextWithIcon4) {
            case ButtonState.idle:
              stateTextWithIcon4 = ButtonState.loading;
              update();
              phonesEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon4 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon4 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  phonesEdit() {
    if (doctorphone1 != null && doctorphone2 == null) {
      if (doctorphone1?.length == 14) {
        if (phonesList?.length == 0) {
          request(
            url: '$url/doctor_phone',
            map: {'phone': '$doctorphone1'},
          ).then(
            (value) {
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if (value["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((phonesList?.length)! >= 1) {
          request(
            url: '$url/doctor_phone/${phonesList?[0].id}',
            map: {'_method': 'PUT', 'phone': '$doctorphone1'},
          ).then(
            (value) {
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              }
              if (value["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      } else {
        stateTextWithIcon4 = ButtonState.fail;
        step4State = FAStepstate.editing;
        update();
      }
    }
    if (doctorphone1 == null && doctorphone2 != null) {
      if (doctorphone2?.length == 14) {
        if (phonesList?.length == 0) {
          Get.snackbar(
            '',
            'يرجى إضافة رقم الهاتف الأول',
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          );
          stateTextWithIcon4 = ButtonState.fail;
          step4State = FAStepstate.editing;
          update();
        } else if (phonesList?.length == 1) {
          request(
            url: '$url/doctor_phone',
            map: {'phone': '$doctorphone2'},
          ).then(
            (value) {
              print('22@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if (value["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((phonesList?.length)! >= 2) {
          request(
            url: '$url/doctor_phone/${phonesList?[1].id}',
            map: {'_method': 'PUT', 'phone': '$doctorphone2'},
          ).then(
            (value) {
              print('33@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if (value["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      } else {
        stateTextWithIcon4 = ButtonState.fail;
        step4State = FAStepstate.editing;
        update();
      }
    }
    if (doctorphone1 != null && doctorphone2 != null) {
      if (doctorphone1?.length == 14 && doctorphone2?.length == 14) {
        if (phonesList?.length == 0) {
          Future.wait([
            request(
              url: '$url/doctor_phone',
              map: {'phone': '$doctorphone1'},
            ),
            request(
              url: '$url/doctor_phone',
              map: {'phone': '$doctorphone2'},
            ),
          ]).then(
            (value) {
              print('44@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if ((value[0]["phone"] != '') && value[1]["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if (phonesList?.length == 1) {
          Future.wait([
            request(
              url: '$url/doctor_phone/${phonesList?[0].id}',
              map: {'_method': 'PUT', 'phone': '$doctorphone1'},
            ),
            request(
              url: '$url/doctor_phone',
              map: {'phone': '$doctorphone2'},
            ),
          ]).then(
            (value) {
              print('55@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if ((value[0]["phone"] != '') && value[1]["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((phonesList?.length)! >= 2) {
          Future.wait([
            request(
              url: '$url/doctor_phone/${phonesList?[0].id}',
              map: {'_method': 'PUT', 'phone': '$doctorphone1'},
            ),
            request(
              url: '$url/doctor_phone/${phonesList?[1].id}',
              map: {'_method': 'PUT', 'phone': '$doctorphone2'},
            ),
          ]).then(
            (value) {
              print('66@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon4 = ButtonState.fail;
                step4State = FAStepstate.editing;
                update();
              } else if ((value[0]["phone"] != '') && value[1]["phone"] != '') {
                stateTextWithIcon4 = ButtonState.success;
                step4State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      } else {
        stateTextWithIcon4 = ButtonState.fail;
        step4State = FAStepstate.editing;
        update();
      }
    }
    if (doctorphone1 == null && doctorphone2 == null) {
      stateTextWithIcon4 = ButtonState.success;
      step4State = FAStepstate.complete;
      update();
    }
  }

  intialValueOfDoctorphone1() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! >= 1) {
        doctorphone1 = '0${phonesList?[0].phone?.substring(4)}';
        doctorPhone1Controller = TextEditingController(text: doctorphone1);
      } else {
        doctorPhone1Controller = TextEditingController(text: '');
      }
    } else {
      doctorPhone1Controller = TextEditingController(text: '');
    }
  }

  intialValueOfDoctorphone2() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! > 1) {
        doctorphone2 = '0${phonesList?[1].phone?.substring(4)}';
        doctorPhone2Controller = TextEditingController(text: doctorphone2);
      } else {
        doctorPhone2Controller = TextEditingController(text: '');
      }
    } else {
      doctorPhone2Controller = TextEditingController(text: '');
    }
  }

  toShowSuffexDoctorPhone1() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! >= 1) {
        doctorPhone1DeleteOrNot = true;
      } else {
        doctorPhone1DeleteOrNot = false;
      }
    } else {
      doctorPhone1DeleteOrNot = false;
    }
  }

  toShowSuffexDoctorPhone2() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! > 1) {
        doctorPhone2DeleteOrNot = true;
      } else {
        doctorPhone2DeleteOrNot = false;
      }
    } else {
      doctorPhone2DeleteOrNot = false;
    }
  }

  deleteDoctorPhone1() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! >= 1) {
        return sureToDeleteDialog(
          onPressed: () {
            request(
              url: '$url/doctor_phone/${phonesList?[0].id}',
              requestType: 'DELETE',
            ).then((val) {
              if (val.toString().contains('successfully')) {
                deletedNotiSnackbar;
              }
            });
            doctorPhone1DeleteOrNot = false;
            doctorPhone1Controller?.clear();
            update();
            Get.back();
          },
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  deleteDoctorPhone2() {
    if (phonesList?.length != 0) {
      if ((phonesList?.length)! > 1) {
        return sureToDeleteDialog(
          onPressed: () {
            request(
              url: '$url/doctor_phone/${phonesList?[1].id}',
              requestType: 'DELETE',
            ).then((val) {
              if (val.toString().contains('successfully')) {
                deletedNotiSnackbar;
              }
            });
            doctorPhone2DeleteOrNot = false;
            doctorPhone2Controller?.clear();
            update();
            Get.back();
          },
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

// #endregion

// #region Step5
  ButtonState stateTextWithIcon5 = ButtonState.idle;
  FAStepstate step5State = FAStepstate.editing;
  List<EmailsDoctor>? emailsList;
  String? doctoremail1;
  TextEditingController? doctorEmail1Controller;
  bool? doctorEmail1DeleteOrNot;

  doctoremail1Changed(val) {
    print('val = $val');
    doctoremail1 = val;
    print('doctoremail1 = $doctoremail1');
    update();
  }

  String? doctoremail2;
  TextEditingController? doctorEmail2Controller;
  bool? doctorEmail2DeleteOrNot;

  doctoremail2Changed(val) {
    print('val = $val');
    doctoremail2 = val;
    print('doctoremail2 = $doctoremail2');
    update();
  }

  Widget saveChangesStep5() => saveChangesStep(
        stateTextWithIcon5,
        () {
          switch (stateTextWithIcon5) {
            case ButtonState.idle:
              stateTextWithIcon5 = ButtonState.loading;
              update();
              emailsEdit();
              break;
            case ButtonState.loading:
              break;
            case ButtonState.fail:
              stateTextWithIcon5 = ButtonState.idle;
              update();
              break;
            case ButtonState.success:
              stateTextWithIcon5 = ButtonState.idle;
              update();
              break;
          }
        },
      );

  emailsEdit() {
    if (doctoremail1 != null && doctoremail2 == null) {
      if (doctoremail1?.contains('@') == true) {
        if (emailsList?.length == 0) {
          request(
            url: '$url/doctor_email',
            map: {'email': '$doctoremail1'},
          ).then(
            (value) {
              print('00@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if (value["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((emailsList?.length)! >= 1) {
          request(
            url: '$url/doctor_email/${emailsList?[0].id}',
            map: {'_method': 'PUT', 'email': '$doctoremail1'},
          ).then(
            (value) {
              print('11@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              }
              if (value["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      }
    }
    if (doctoremail1 == null && doctoremail2 != null) {
      if (doctoremail2?.contains('@') == true) {
        if (emailsList?.length == 0) {
          Get.snackbar(
            '',
            'يرجى إضافة البريد الالكتروني الأول',
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          );
          stateTextWithIcon5 = ButtonState.fail;
          step5State = FAStepstate.editing;
          update();
        } else if (emailsList?.length == 1) {
          request(
            url: '$url/doctor_email',
            map: {'email': '$doctoremail2'},
          ).then(
            (value) {
              print('22@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if (value["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((emailsList?.length)! >= 2) {
          request(
            url: '$url/doctor_email/${emailsList?[1].id}',
            map: {'_method': 'PUT', 'email': '$doctoremail2'},
          ).then(
            (value) {
              print('33@@value = $value');
              if (value["success"] == false || value["success"] == 'false') {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if (value["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      }
    }
    if (doctoremail1 != null && doctoremail2 != null) {
      if (doctoremail1?.contains('@') == true &&
          doctoremail2?.contains('@') == true) {
        if (emailsList?.length == 0) {
          Future.wait([
            request(
              url: '$url/doctor_email',
              map: {'email': '$doctoremail1'},
            ),
            request(
              url: '$url/doctor_email',
              map: {'email': '$doctoremail2'},
            ),
          ]).then(
            (value) {
              print('44@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if ((value[0]["email"] != '') && value[1]["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if (emailsList?.length == 1) {
          Future.wait([
            request(
              url: '$url/doctor_email/${emailsList?[0].id}',
              map: {'_method': 'PUT', 'email': '$doctoremail1'},
            ),
            request(
              url: '$url/doctor_email',
              map: {'email': '$doctoremail2'},
            ),
          ]).then(
            (value) {
              print('55@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if ((value[0]["email"] != '') && value[1]["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        } else if ((emailsList?.length)! >= 2) {
          Future.wait([
            request(
              url: '$url/doctor_email/${emailsList?[0].id}',
              map: {'_method': 'PUT', 'email': '$doctoremail1'},
            ),
            request(
              url: '$url/doctor_email/${emailsList?[1].id}',
              map: {'_method': 'PUT', 'email': '$doctoremail2'},
            ),
          ]).then(
            (value) {
              print('66@@value = $value');
              if ((value[0]["success"] == false ||
                      value[0]["success"] == 'false') &&
                  (value[1]["success"] == false ||
                      value[1]["success"] == 'false')) {
                stateTextWithIcon5 = ButtonState.fail;
                step5State = FAStepstate.editing;
                update();
              } else if ((value[0]["email"] != '') && value[1]["email"] != '') {
                stateTextWithIcon5 = ButtonState.success;
                step5State = FAStepstate.complete;
                update();
              }
            },
          );
        }
      }
    }
    if (doctoremail1 == null && doctoremail2 == null) {
      stateTextWithIcon5 = ButtonState.success;
      step5State = FAStepstate.complete;
      update();
    }
  }

  intialValueOfDoctoremail1() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! >= 1) {
        doctoremail1 = emailsList?[0].email;
        doctorEmail1Controller = TextEditingController(text: doctoremail1);
      } else {
        doctorEmail1Controller = TextEditingController(text: '');
      }
    } else {
      doctorEmail1Controller = TextEditingController(text: '');
    }
  }

  intialValueOfDoctoremail2() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! > 1) {
        doctoremail2 = emailsList?[1].email;
        doctorEmail2Controller = TextEditingController(text: doctoremail2);
      } else {
        doctorEmail2Controller = TextEditingController(text: '');
      }
    } else {
      doctorEmail2Controller = TextEditingController(text: '');
    }
  }

  toShowSuffexDoctorEmail1() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! >= 1) {
        doctorEmail1DeleteOrNot = true;
      } else {
        doctorEmail1DeleteOrNot = false;
      }
    } else {
      doctorEmail1DeleteOrNot = false;
    }
  }

  toShowSuffexDoctorEmail2() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! > 1) {
        doctorEmail2DeleteOrNot = true;
      } else {
        doctorEmail2DeleteOrNot = false;
      }
    } else {
      doctorEmail2DeleteOrNot = false;
    }
  }

  deleteDoctorEmail1() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! >= 1) {
        return sureToDeleteDialog(
          onPressed: () {
            request(
              url: '$url/doctor_email/${emailsList?[0].id}',
              requestType: 'DELETE',
            ).then((val) {
              if (val.toString().contains('successfully')) {
                deletedNotiSnackbar;
              }
            });
            doctorEmail1DeleteOrNot = false;
            doctorEmail1Controller?.clear();
            update();
            Get.back();
          },
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  deleteDoctorEmail2() {
    if (emailsList?.length != 0) {
      if ((emailsList?.length)! > 1) {
        return sureToDeleteDialog(
          onPressed: () {
            request(
              url: '$url/doctor_email/${emailsList?[1].id}',
              requestType: 'DELETE',
            ).then((val) {
              if (val.toString().contains('successfully')) {
                deletedNotiSnackbar;
              }
            });
            doctorEmail2DeleteOrNot = false;
            doctorEmail2Controller?.clear();
            update();
            Get.back();
          },
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

// #endregion

// #region Step6
  FAStepstate step6State = FAStepstate.editing;

  List<DoctorCertificates>? certificatesList;
  List<DropDownType>? certificateList = [];
  List<DropDownType>? univercityList = [];
  List<Widget> listOfCertificates(DoctorProfile? doctorProfile) {
    return certificatesList?.map((e) {
          return Step6EditScreen(e: e);
        }).toList() ??
        [];
  }

  deleteCertificate(DoctorCertificates e) {
    return sureToDeleteDialog(
      onPressed: () {
        request(
          url: '$url/doctor_certificate/${e.id}',
          requestType: 'DELETE',
        ).then((val) {
          if (val.toString().contains('successfully')) {
            deletedNotiSnackbar;
          }
        });
        certificatesList?.remove(e);
        update();
        Get.back();
      },
    );
  }

// #endregion

// #region Step7
  FAStepstate step7State = FAStepstate.editing;

  List<DropDownType>? membershipsList;
  List<DropDownType>? membershipList = [];
  List<Widget> listOfMemberships(DoctorProfile? doctorProfile) {
    return membershipsList?.map((e) {
          return Step7EditScreen(e: e);
        }).toList() ??
        [];
  }

// #endregion

// #region Step8
  FAStepstate step8State = FAStepstate.editing;
  List<DropDownType>? treatmentsList;
  List<DropDownType>? treatmentList = [];
  List<Widget> listOfTreatment(DoctorProfile? doctorProfile) {
    return treatmentsList?.map((e) {
          return Step8EditScreen(e: e);
        }).toList() ??
        [];
  }

  deleteTreatment(DropDownType e) {
    return sureToDeleteDialog(
      onPressed: () {
        request(
          url: '$url/treatments/${e.id}',
          requestType: 'DELETE',
        ).then((val) {
          if (val.toString().contains('successfully')) {
            deletedNotiSnackbar;
          }
        });
        treatmentsList?.remove(e);
        update();
        Get.back();
      },
    );
  }

// #endregion

// #region Step9
  FAStepstate step9State = FAStepstate.editing;

// #endregion

// #region Step10
  FAStepstate step10State = FAStepstate.editing;

// #endregion

}
