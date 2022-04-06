import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/main.dart';

class Step7 extends StatelessWidget {
  final SignUpController c = Get.find();
  @override
  Widget build(BuildContext context) {
    specialization() {
      // ignore: prefer_is_empty
      if (c.toPinedJson?.medicalSpecialties?.length != 0) {
        if (c.toPinedJson?.medicalSpecialties?[0]?.other != null) {
          return (c.toPinedJson?.medicalSpecialties?[0]?.other) ?? '';
        } else {
          return (c.toPinedJson?.medicalSpecialties?[0]?.name) ?? '';
        }
      } else if (c.selectedSpecilization?.other != null) {
        return (c.selectedSpecilization?.other) ?? '';
      } else {
        return (c.selectedSpecilization?.name) ?? '';
      }
    }

    degree() {
      // ignore: prefer_is_empty
      if (c.toPinedJson?.doctorTitles?.length != 0) {
        if (c.toPinedJson?.doctorTitles?[0]?.other != null) {
          return (c.toPinedJson?.doctorTitles?[0]?.other) ?? '';
        } else {
          return (c.toPinedJson?.doctorTitles?[0]?.name) ?? '';
        }
      } else if (c.selectedDegree?.other != null) {
        return (c.selectedDegree?.other) ?? '';
      } else {
        return (c.selectedDegree?.name) ?? '';
      }
    }

    print('c.phone1 = ${c.phone1}');
    print('c.phone2 = ${c.phone2}');
    List<Map<String, String>> listOfSingleInforms = [
      {
        "stringPreview": "اسم المستخدم",
        "stringShow": c.username ?? '',
      },
      {
        "stringPreview": "اسم الطبيب",
        "stringShow": '$getFirstName $getSecondName $getSurName',
      },
      {
        "stringPreview": "الاختصاص",
        // ignore: prefer_is_empty
        "stringShow": specialization(),
      },
      {
        "stringPreview": "رقم التسجيل في النقابة",
        "stringShow": c.registerNum ?? '',
      },
      {
        "stringPreview": "الدرجة",
        // ignore: prefer_is_empty
        "stringShow": degree(),
      },
      {
        "stringPreview": "الجنسية",
        "stringShow": '${getNationalities1 ?? ''} - ${getNationalities2 ?? ''}',
      },
      {
        "stringPreview": "تاريخ الميلاد",
        "stringShow": '$getDateOfBirth',
      },
      {
        "stringPreview": "العنوان في العراق",
        "stringShow":
            '${getCountry1 ?? ''} - ${getGov1 ?? ''} - ${getCity1 ?? ''}\n${getCountry2 ?? ''}  ${getGov2 ?? ''}  ${getCity2 ?? ''}',
      },
      {
        "stringPreview": "ارقام الهاتف الشخضية",
        "stringShow": '  ${getPhone1 ?? ''}\n${getPhone2 ?? ''}',
      },
      {
        "stringPreview": "ارقام الهاتف المهنية",
        "stringShow": '  ${c.phone1 ?? ''}\n${c.phone2 ?? ''}',
      },
      {
        "stringPreview": "الايميلات الشخصية",
        "stringShow": '${getEmail1 ?? ''}\n${getEmail2 ?? ''}',
      },
      {
        "stringPreview": "الايميلات المهنية",
        "stringShow": '  ${c.email1 ?? ''}\n${c.email2 ?? ''}',
      },
    ];

    return GetBuilder(builder: (SignUpController c) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // #region button for printing
              // SizedBox(height: 20),
              // GetBuilder(
              //   builder: (SignUpController c) {
              //     return TextButton(
              //       onPressed: () {},
              //       // onPressed: () async {
              //       //   final appDir = await getApplicationDocumentsDirectory();
              //       //   debugPrint('1111111');
              //       //   c.screenshotController
              //       //       .captureAndSave(
              //       //     appDir.path,
              //       //     fileName: 'capture_image',
              //       //     pixelRatio: 4.0,
              //       //   )
              //       //       .then((capturedImage) async {
              //       //     if (capturedImage != null) {
              //       //       GallerySaver.saveImage(capturedImage);
              //       //       debugPrint(
              //       //         '@@@@@@@@@@@@@@@@GallerySaver = $capturedImage',
              //       //       );
              //       //       // final fileName = paths.basename(croppedFile.path);
              //       //       // final File localImage =
              //       //       // await croppedFile.copy('${appDir.path}/$fileName');
              //       //       debugPrint('2222222222');
              //       //       c.showCapturedWidget(context, capturedImage);
              //       //     }
              //       //   }).catchError((onError) {
              //       //     debugPrint('33333333333');
              //       //     print(onError);
              //       //   });
              //       // },
              //       style: ButtonStyle(
              //         padding: MaterialStateProperty.all(
              //           EdgeInsets.all(10),
              //         ),
              //         shape: MaterialStateProperty.all(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             side: BorderSide(color: generalColor, width: 2),
              //           ),
              //         ),
              //       ),
              //       child: textWidget(
              //         stringText: "طباعة المعلومات",
              //         fontWeight: FontWeight.w900,
              //         color: Colors.black,
              //         fontSize: 15,
              //       ),
              //     );
              //   },
              // ),
              // #endregion

              Screenshot(
                controller: c.screenshotController,
                child: Column(
                  children: [
                    // #region avatar and cover
                    SizedBox(height: 20),
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Stack(
                          children: [
                            SizedBox(height: 270),
                            Stack(
                              children: [
                                c.toPinedJson?.imageCover != null ||
                                        c.imageCover != null
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: FileImage(File(
                                                c.toPinedJson?.imageCover ??
                                                    c.imageCover!)),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              placeholderImageIMG,
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //       colors: [
                                //         Colors.black38,
                                //         Color.fromARGB(0, 0, 0, 0)
                                //       ],
                                //       begin: Alignment.bottomCenter,
                                //       end: Alignment.topCenter,
                                //     ),
                                //   ),
                                //   padding: EdgeInsets.symmetric(
                                //       vertical: MediaQuery.of(context).size.height / 12,
                                //       horizontal: 20.0),
                                //   child: Container(),
                                // ),
                              ],
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 12 - 5,
                              left: 15,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.height / 6 +
                                          10,
                                  height:
                                      MediaQuery.of(context).size.height / 6 +
                                          10,
                                ),
                              ),
                            ),
                            Positioned(
                                top: MediaQuery.of(context).size.height / 12,
                                left: 20,
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.lightBlue,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    child: c.toPinedJson?.imageAvatar != null ||
                                            c.imageAvatar != null
                                        ? Image.file(
                                            File(
                                              c.toPinedJson?.imageAvatar ??
                                                  c.imageAvatar!,
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            defaultAvatarIMG,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                    // #endregion

                    // #region preview single informs
                    ...listOfSingleInforms.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDialogTextFieldTextContainer(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              margin: EdgeInsets.symmetric(vertical: 15),
                              stringText: e['stringPreview'],
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: textWidget(
                                stringText: e['stringShow'],
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    // #endregion

                    // #region preview informs of experiences
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(
                          children: [
                            SizedBox(height: 30),
                            Container(
                              margin: EdgeInsets.only(right: 0, left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomDialogTextFieldTextContainer(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    stringText: 'الخبرات',
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                c.arabicExperiences != null
                                    ? Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomDialogTextFieldTextContainer(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              stringText: 'الوصف العربي',
                                            ),
                                            Flexible(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: textWidget(
                                                  stringText:
                                                      c.arabicExperiences ?? '',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  textAlign: TextAlign.left,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                c.englishExperiences != null
                                    ? Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomDialogTextFieldTextContainer(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              stringText: 'الوصف الانكليزي',
                                            ),
                                            Flexible(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: textWidget(
                                                  stringText:
                                                      c.englishExperiences ??
                                                          '',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  textAlign: TextAlign.left,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                c.arabicExperiences != null ||
                                        c.englishExperiences != null
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 70),
                                        child: Divider(
                                          color: generalColor,
                                          thickness: 1,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    // #endregion

                    // #region preview informs of certificate
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(children: [
                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(right: 0, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  stringText: 'الشهادات',
                                ),
                              ],
                            ),
                          ),
                          ...c.listOfCertificates.map(
                            (e) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم الشهادة',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.certificateInforms
                                                        ?.other !=
                                                    null
                                                ? e.certificateInforms?.other ??
                                                    ''
                                                : e.certificateInforms?.name ??
                                                    '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم الجامعة',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.certificateInforms
                                                        ?.other !=
                                                    null
                                                ? e.universityInforms?.other ??
                                                    ''
                                                : e.universityInforms?.name ??
                                                    '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'سنة التخرج',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.graduationYear ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 70),
                                    child: Divider(
                                      color: generalColor,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ]);
                      },
                    ),
                    // #endregion

                    // #region preview informs of membership
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(children: [
                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(right: 0, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  stringText: 'العضويات',
                                ),
                              ],
                            ),
                          ),
                          ...c.listOfmemberships.map(
                            (e) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم العضوية',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText:
                                                e.organizationsMemberships
                                                            ?.other !=
                                                        null
                                                    ? e.organizationsMemberships
                                                            ?.other ??
                                                        ''
                                                    : e.organizationsMemberships
                                                            ?.name ??
                                                        '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 70),
                                    child: Divider(
                                      color: generalColor,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ]);
                      },
                    ),
                    // #endregion

                    // #region preview informs of treatments
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(children: [
                          SizedBox(height: 30),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  stringText: 'الخدمات العلاجية',
                                ),
                              ],
                            ),
                          ),
                          ...c.listOfTreatments.map(
                            (e) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم الخدمة العلاجية',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.name ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 70),
                                    child: Divider(
                                      color: generalColor,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ]);
                      },
                    ),
                    // #endregion

                    // #region preview informs of training programs
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(children: [
                          SizedBox(height: 30),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  stringText: 'البرامج التدريبية',
                                ),
                              ],
                            ),
                          ),
                          ...c.listOfTrainingPrograms.map(
                            (e) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم البرنامج',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.name ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'اسم الجهة',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.organization ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'تاريخ البرنامج',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.date ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'دولة البرنامج',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.country?.name ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'مدة البرنامج',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText: e.duration ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 70),
                                    child: Divider(
                                      color: generalColor,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ]);
                      },
                    ),
                    // #endregion

                    // #region preview informs of images
                    GetBuilder(
                      builder: (SignUpController c) {
                        return Column(children: [
                          SizedBox(height: 30),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  stringText: 'الصور',
                                ),
                              ],
                            ),
                          ),
                          ...c.listOfImages.map(
                            (e) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  e.image != null
                                      ? Container(
                                          width: SizeConfig()
                                              .widthSize(context, 80),
                                          height: SizeConfig()
                                              .heightSize(context, 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  File(e.image ?? '')),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: SizeConfig()
                                              .widthSize(context, 80),
                                          height: SizeConfig()
                                              .heightSize(context, 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                placeholderImageIMG,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                  SizedBox(height: 10),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'الوصف العربي',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText:
                                                e.arabicDescription ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          stringText: 'الوصف الانكليزي',
                                        ),
                                        Flexible(
                                          child: textWidget(
                                            stringText:
                                                e.englishDescription ?? '',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            textAlign: TextAlign.left,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 70),
                                    child: Divider(
                                      color: generalColor,
                                      thickness: 1,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              );
                            },
                          ).toList(),
                        ]);
                      },
                    ),
                    // #endregion
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
