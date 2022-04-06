// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/loading_logo_controller.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/reuseable_dropdown.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step0_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step1_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step2_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step3_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step4_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step5_doctor_edit.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/widgets/step7_doctor_edit.dart';
import 'package:shs108private/app/modules/signup/widgets/signup_appbar.dart';

class EditDoctorScreenView extends StatefulWidget {
  @override
  State<EditDoctorScreenView> createState() => _EditDoctorScreenViewState();
}

class _EditDoctorScreenViewState extends State<EditDoctorScreenView> {
  /// certificates
  // #region
  DropDownType? certificate;
  String? certificateOther;
  DropDownType? univercity;
  bool? selectedCertificateOther;
  bool? selectedUnivercityOther;
  String? univercityOther;
  String? graduateYear;
  String errorText = '';
// #endregion

  /// treatments
  // #region
  DropDownType? treatment;
  String? treatmentOther;
  bool? selectedTreatmentOther;
  String errorText2 = '';
// #endregion

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            flexibleSpace: SignUpAppBar(),
            title: Center(
              child: textWidget(
                stringText: 'تعديل معلومات الطبيب',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          body: GetBuilder(
            init: EditDoctorScreenController(),
            builder: (EditDoctorScreenController controller) {
              return BottomTheme(
                child: FutureBuilder(
                  future: controller.fetchDoctorProfileVar,
                  builder: (context, AsyncSnapshot<DoctorProfile> snapshot) {
                    if (snapshot.hasData) {
                      DoctorProfile? doctorProfile = snapshot.data;
                      return FormBuilder(
                        key: controller.formKey,
                        child: FAStepper(
                          onStepTapped: controller.onStepTapped,
                          type: FAStepperType.vertical,
                          steps: [
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل المعلومات الشخصية',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 0,
                              state: controller.step0State,
                              content: Step0EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل الاختصاص',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 1,
                              state: controller.step1State,
                              content: Step1EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل الدرجة',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 2,
                              state: controller.step2State,
                              content: Step2EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل الخبرات',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 3,
                              state: controller.step3State,
                              content: Step3EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل أرقام الهاتف',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 4,
                              state: controller.step4State,
                              content: Step4EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل البريد الالكتروني',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 5,
                              state: controller.step5State,
                              content: Step5EditScreen(
                                doctorProfile: doctorProfile,
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل الشهادات',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 6,
                              state: controller.step6State,
                              content: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextButton(
                                      // ElevatedButton(
                                      style: ButtonStyle(
                                        // backgroundColor: MaterialStateProperty.all(
                                        //   Colors.green.shade500,
                                        // ),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.all(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.defaultDialog(
                                          titleStyle: style(fontSize: 20),
                                          title: 'إضافة شهادة جديدة',
                                          backgroundColor: Colors.white,
                                          barrierDismissible: true,
                                          titlePadding: EdgeInsets.all(20),
                                          actions: [
                                            TextButton(
                                              child: textWidget(
                                                stringText: "الغاء",
                                                fontSize: 20,
                                                color: Colors.blue,
                                              ),
                                              onPressed: () {
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
                                                Get.back();

                                                controller
                                                    .request(
                                                  url:
                                                      '$url/doctor_certificate',
                                                  map: {
                                                    'certificate_id':
                                                        certificate != null
                                                            ? '${certificate?.id}'
                                                            : '',
                                                    'other_certificate':
                                                        certificate != null
                                                            ? certificate?.id ==
                                                                    1
                                                                ? certificateOther ??
                                                                    ''
                                                                : ''
                                                            : '',
                                                    'university_id':
                                                        univercity != null
                                                            ? '${univercity?.id}'
                                                            : '',
                                                    'other_university':
                                                        univercity != null
                                                            ? univercity?.id ==
                                                                    1
                                                                ? univercityOther ??
                                                                    ''
                                                                : ''
                                                            : '',
                                                    'graduation_year':
                                                        graduateYear ?? '',
                                                  },
                                                  requestType: 'POST',
                                                )
                                                    .then(
                                                  (value) {
                                                    if (!value
                                                        .toString()
                                                        .contains('success')) {
                                                      errorText =
                                                          'تمت إضافة الشهادة بنجاح';
                                                      controller
                                                          .certificatesList
                                                          ?.add(
                                                        DoctorCertificates(
                                                          certificate:
                                                              certificate,
                                                          certificateId:
                                                              certificate?.id,
                                                          graduationYear:
                                                              int.parse(
                                                                  graduateYear!),
                                                          otherCertificate:
                                                              certificateOther,
                                                          otherUniversity:
                                                              univercityOther,
                                                          university:
                                                              univercity,
                                                          universityId:
                                                              univercity?.id,
                                                          doctorId:
                                                              doctorProfile?.id,
                                                        ),
                                                      );
                                                      setState(() {});

                                                      Get.snackbar(
                                                        '',
                                                        '',
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        titleText: Center(
                                                          child: textWidget(
                                                            stringText: 'نجاح',
                                                            fontSize: 21,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        messageText: Center(
                                                          child: textWidget(
                                                            stringText:
                                                                'تمت إضافة الشهادة بنجاح',
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                            .green
                                                            .withOpacity(0.7),
                                                        duration: Duration(
                                                            seconds: 3),
                                                        margin:
                                                            EdgeInsets.all(15),
                                                        borderRadius: 10,
                                                      );
                                                    } else {
                                                      if (value
                                                          .toString()
                                                          .contains(
                                                              'graduation_year')) {
                                                        if (int.parse(
                                                                graduateYear!) <
                                                            1900) {
                                                          errorText =
                                                              'لا يسمح بتاريخ اقل من 1900';
                                                        } else {
                                                          errorText =
                                                              'السنة الدراسية يجب ان تكون اقل من السنة الحالية';
                                                        }
                                                      }
                                                      if (value.toString().contains(
                                                          'other_certificate')) {
                                                        errorText =
                                                            'يجب ادخال الشهادة الاخرى';
                                                      }
                                                      if (value.toString().contains(
                                                          'other_university')) {
                                                        errorText =
                                                            'يجب ادخال الجامعة الاخرى';
                                                      }
                                                      setState(() {});
                                                      Get.snackbar(
                                                        '',
                                                        '',
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        titleText: Center(
                                                          child: textWidget(
                                                            stringText: 'خطأ',
                                                            fontSize: 21,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        messageText: Center(
                                                          child: textWidget(
                                                            stringText:
                                                                errorText,
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                            .red
                                                            .withOpacity(0.7),
                                                        duration: Duration(
                                                            seconds: 3),
                                                        margin:
                                                            EdgeInsets.all(15),
                                                        borderRadius: 10,
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                          content: StatefulBuilder(
                                            builder: (context, setState) {
                                              return Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                  margin: EdgeInsets.all(10),
                                                  height: SizeConfig()
                                                      .heightSize(context, 30),
                                                  width: 400,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 0),
                                                              child: textWidget(
                                                                stringText:
                                                                    'الشهادة',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            CustomDropDown(
                                                              width: SizeConfig()
                                                                  .widthSize(
                                                                context,
                                                                50,
                                                              ),
                                                              items: controller
                                                                          .certificateList
                                                                          ?.length !=
                                                                      0
                                                                  ? controller
                                                                      .certificateList
                                                                  : [],
                                                              popupTitle:
                                                                  'اختر الشهادة',
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  certificate =
                                                                      val;
                                                                  selectedCertificateOther =
                                                                      certificate?.id ==
                                                                              1
                                                                          ? true
                                                                          : false;
                                                                });
                                                                print(
                                                                    'certificate = $certificate');
                                                              },
                                                              itemAsString:
                                                                  (u) {
                                                                // return '${u['name']} ${u["extra_info"]["other"]}';
                                                                return '$u';
                                                              },
                                                              selectedItem:
                                                                  certificate,
                                                              onFind: controller
                                                                          .certificateList
                                                                          ?.length !=
                                                                      0
                                                                  ? null
                                                                  : (filter) =>
                                                                      controller
                                                                          .getDropDownListData(
                                                                        url:
                                                                            'certificates',
                                                                        filter:
                                                                            filter,
                                                                        dropDownList:
                                                                            controller.certificateList,
                                                                      ),
                                                            ),
                                                          ],
                                                        ),

                                                        selectedCertificateOther !=
                                                                true
                                                            ? Container()
                                                            : Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(),
                                                                  CustomTextField(
                                                                    height: 60,
                                                                    // controller: c
                                                                    //     .certificateOtherController,

                                                                    width: SizeConfig()
                                                                        .widthSize(
                                                                            context,
                                                                            50),
                                                                    onChanged:
                                                                        (val) {
                                                                      certificateOther =
                                                                          val;
                                                                      setState(
                                                                          () {});
                                                                      print(
                                                                          'certificateOther = $certificateOther');
                                                                    },
                                                                    name:
                                                                        'certificate_other1',

                                                                    hintText:
                                                                        'ادخال اخرى هنا',
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                  ),
                                                                ],
                                                              ),

                                                        /// Univercity
                                                        SizedBox(height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 0),
                                                              child: textWidget(
                                                                stringText:
                                                                    'الجامعة',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            CustomDropDown(
                                                              width: SizeConfig()
                                                                  .widthSize(
                                                                context,
                                                                50,
                                                              ),
                                                              items: controller
                                                                          .univercityList
                                                                          ?.length !=
                                                                      0
                                                                  ? controller
                                                                      .univercityList
                                                                  : [],
                                                              popupTitle:
                                                                  'اختر الجامعة',
                                                              onChanged: (val) {
                                                                univercity =
                                                                    val;
                                                                selectedUnivercityOther =
                                                                    univercity?.id ==
                                                                            1
                                                                        ? true
                                                                        : false;
                                                                setState(() {});
                                                                print(
                                                                    'univercity = $univercity');
                                                              },
                                                              itemAsString:
                                                                  (u) {
                                                                // return '${u['name']} ${u["extra_info"]["other"]}';
                                                                return '$u';
                                                              },
                                                              selectedItem:
                                                                  univercity,
                                                              onFind: controller
                                                                          .univercityList
                                                                          ?.length !=
                                                                      0
                                                                  ? null
                                                                  : (filter) {
                                                                      print(
                                                                        controller
                                                                            .univercityList,
                                                                      );
                                                                      return controller
                                                                          .getDropDownListData(
                                                                        url:
                                                                            'universities',
                                                                        filter:
                                                                            filter,
                                                                        dropDownList:
                                                                            controller.univercityList,
                                                                      );
                                                                    },
                                                              // dropdownBuilderStringText: univercity,
                                                            ),
                                                          ],
                                                        ),
                                                        selectedUnivercityOther !=
                                                                true
                                                            ? Container()
                                                            : Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(),
                                                                  CustomTextField(
                                                                    height: 60,
                                                                    // controller:
                                                                    //     controller.univercityOtherController,

                                                                    width: SizeConfig()
                                                                        .widthSize(
                                                                            context,
                                                                            50),
                                                                    onChanged:
                                                                        (val) {
                                                                      univercityOther =
                                                                          val;
                                                                      setState(
                                                                          () {});
                                                                      print(
                                                                          'univercityOther = $univercityOther');
                                                                    },
                                                                    hintText:
                                                                        'ادخال اخرى هنا',
                                                                    name:
                                                                        'univercity_other2',
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                  ),
                                                                ],
                                                              ),

                                                        /// Graduation Year
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 0),
                                                              child: textWidget(
                                                                stringText:
                                                                    'سنة التخرج',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            GetBuilder(
                                                              builder:
                                                                  (EditDoctorScreenController
                                                                      c) {
                                                                return CustomTextField(
                                                                  height: 60,
                                                                  width: SizeConfig()
                                                                      .widthSize(
                                                                          context,
                                                                          50),
                                                                  onChanged:
                                                                      (val) {
                                                                    graduateYear =
                                                                        val;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  name:
                                                                      'graduate_year',
                                                                  hintText:
                                                                      'يرجى ادخال سنة التخرج',
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color: generalColor,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          textWidget(
                                            stringText: 'أضف شهادة جديده',
                                            fontSize: 20,
                                            // color: Colors.white,
                                            color: generalColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: controller.listOfCertificates(
                                      doctorProfile,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل العضويات',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 7,
                              state: controller.step7State,
                              content: Column(
                                children: controller.listOfMemberships(
                                  doctorProfile,
                                ),
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل العلاجات',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 8,
                              state: controller.step8State,
                              content: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextButton(
                                      // ElevatedButton(
                                      style: ButtonStyle(
                                        // backgroundColor: MaterialStateProperty.all(
                                        //   Colors.green.shade500,
                                        // ),
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.all(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.defaultDialog(
                                          titleStyle: style(fontSize: 20),
                                          title: 'إضافة علاج جديد',
                                          backgroundColor: Colors.white,
                                          barrierDismissible: true,
                                          titlePadding: EdgeInsets.all(20),
                                          actions: [
                                            TextButton(
                                              child: textWidget(
                                                stringText: "الغاء",
                                                fontSize: 20,
                                                color: Colors.blue,
                                              ),
                                              onPressed: () {
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
                                                Get.back();

                                                controller
                                                    .request(
                                                  url: '$url/treatments',
                                                  map: {
                                                    'name': treatment != null
                                                        ? '${treatment?.name}'
                                                        : '',
                                                  },
                                                  requestType: 'POST',
                                                )
                                                    .then(
                                                  (value) {
                                                    if (!value
                                                        .toString()
                                                        .contains('success')) {
                                                      errorText2 =
                                                          'تمت إضافة العلاج بنجاح';
                                                      controller.treatmentList
                                                          ?.add(
                                                        DropDownType(
                                                          name: treatment?.name,
                                                          id: treatment?.id,
                                                        ),
                                                      );
                                                      setState(() {});

                                                      Get.snackbar(
                                                        '',
                                                        '',
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        titleText: Center(
                                                          child: textWidget(
                                                            stringText: 'نجاح',
                                                            fontSize: 21,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        messageText: Center(
                                                          child: textWidget(
                                                            stringText:
                                                                errorText2,
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                            .green
                                                            .withOpacity(0.7),
                                                        duration: Duration(
                                                            seconds: 3),
                                                        margin:
                                                            EdgeInsets.all(15),
                                                        borderRadius: 10,
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                          content: StatefulBuilder(
                                            builder: (context, setState) {
                                              return Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                  margin: EdgeInsets.all(10),
                                                  height: SizeConfig()
                                                      .heightSize(context, 30),
                                                  width: 400,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(),
                                                            CustomTextField(
                                                              height: 60,
                                                              // controller: c
                                                              //     .certificateOtherController,
                                                              initialValue:
                                                                  treatment
                                                                      ?.name,
                                                              width: SizeConfig()
                                                                  .widthSize(
                                                                      context,
                                                                      50),
                                                              onChanged: (val) {
                                                                treatment = val;
                                                                setState(() {});
                                                                print(
                                                                    'treatment = $treatment');
                                                              },
                                                              name: 'treatment',

                                                              hintText:
                                                                  'ادخال اخرى هنا',
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color: generalColor,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          textWidget(
                                            stringText: 'أضف علاج جديد',
                                            fontSize: 20,
                                            // color: Colors.white,
                                            color: generalColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: controller.listOfTreatment(
                                      doctorProfile,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FAStep(
                              title: textWidget(
                                stringText: 'تعديل البرامج التدريبية',
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              isActive: controller.currentstep == 9,
                              state: controller.step9State,
                              content: Column(),
                            ),
                            // FAStep(
                            //   title: textWidget(
                            //     stringText: 'تعديل السماحات',
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.w900,
                            //   ),
                            //   isActive: controller.currentstep == 10,
                            //   state: controller.step10State,
                            //   content: Column(),
                            // ),
                          ],
                          currentStep: controller.currentstep,
                          onStepCancel: null,
                          onStepContinue: null,
                          controlsBuilder: (_, __) => Container(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: textWidget(
                            stringText: 'Error = ${snapshot.error}',
                            fontSize: 30),
                      );
                    } else {
                      return GetBuilder(
                        init: LoadingController(),
                        builder: (LoadingController c) {
                          c.animatedlogo();
                          return Center(
                            child: AnimatedBuilder(
                              animation: c.heartAnimationController,
                              builder: (_, child) {
                                return Container(
                                  child: img.Image.asset(
                                    faviconIMG,
                                    fit: BoxFit.cover,
                                    height: c.heartAnimation.value,
                                    width: c.heartAnimation.value,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
