// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/reuseable_dropdown.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

// ignore: must_be_immutable
class Step6EditScreen extends StatefulWidget {
  final DoctorCertificates? e;
  Step6EditScreen({Key? key, this.e}) : super(key: key);

  @override
  State<Step6EditScreen> createState() => _Step6EditScreenState();
}

class _Step6EditScreenState extends State<Step6EditScreen> {
  DropDownType? certificate;
  String? certificateOther;
  DropDownType? univercity;
  bool? selectedCertificateOther;
  bool? selectedUnivercityOther;
  String? univercityOther;
  String? graduateYear;
  ButtonState stateTextWithIcon6 = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    selectedCertificateOther = certificate != null
        ? certificate?.id == 1
            ? true
            : false
        : widget.e?.certificate?.id == 1
            ? true
            : false;
    selectedUnivercityOther = univercity != null
        ? univercity?.id == 1
            ? true
            : false
        : widget.e?.university?.id == 1
            ? true
            : false;

    return GetBuilder(
      builder: (EditDoctorScreenController c) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(25.7),
              ),
              child: Column(
                children: [
                  /// Certificate
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: textWidget(
                          stringText: 'الشهادة',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      CustomDropDown(
                        width: SizeConfig().widthSize(
                          context,
                          50,
                        ),
                        items: c.certificateList?.length != 0
                            ? c.certificateList
                            : [],
                        popupTitle: 'اختر الشهادة',
                        onChanged: (val) {
                          certificate = val;
                          selectedCertificateOther =
                              certificate?.id == 1 ? true : false;
                          setState(() {});
                          print('certificate = $certificate');
                        },
                        itemAsString: (u) {
                          // return '${u['name']} ${u["extra_info"]["other"]}';
                          return '$u';
                        },
                        selectedItem: certificate ?? widget.e?.certificate,
                        onFind: c.certificateList?.length != 0
                            ? null
                            : (filter) => c.getDropDownListData(
                                  url: 'certificates',
                                  filter: filter,
                                  dropDownList: c.certificateList,
                                ),
                      ),
                    ],
                  ),
                  selectedCertificateOther != true
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(),
                            CustomTextField(
                              height: 60,
                              // controller: c
                              //     .certificateOtherController,

                              width: SizeConfig().widthSize(context, 50),
                              onChanged: (val) {
                                certificateOther = val;
                                setState(() {});
                                print('certificateOther = $certificateOther');
                              },
                              initialValue: certificateOther ??
                                  widget.e?.otherCertificate ??
                                  '',
                              name: 'certificate_other1${widget.e?.id}',

                              hintText: 'ادخال اخرى هنا',
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),

                  /// Univercity
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: textWidget(
                          stringText: 'الجامعة',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      CustomDropDown(
                        width: SizeConfig().widthSize(
                          context,
                          50,
                        ),
                        items: c.univercityList?.length != 0
                            ? c.univercityList
                            : [],
                        popupTitle: 'اختر الجامعة',
                        onChanged: (val) {
                          univercity = val;
                          selectedUnivercityOther =
                              univercity?.id == 1 ? true : false;
                          setState(() {});
                          print('univercity = $univercity');
                        },
                        itemAsString: (u) {
                          // return '${u['name']} ${u["extra_info"]["other"]}';
                          return '$u';
                        },
                        selectedItem: univercity ?? widget.e?.university,
                        onFind: c.univercityList?.length != 0
                            ? null
                            : (filter) {
                                print(
                                  c.univercityList,
                                );
                                return c.getDropDownListData(
                                  url: 'universities',
                                  filter: filter,
                                  dropDownList: c.univercityList,
                                );
                              },
                        // dropdownBuilderStringText: univercity,
                      ),
                    ],
                  ),
                  selectedUnivercityOther != true
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(),
                            CustomTextField(
                              height: 60,
                              // controller:
                              //     c.univercityOtherController,

                              width: SizeConfig().widthSize(context, 50),
                              onChanged: (val) {
                                univercityOther = val;
                                setState(() {});
                                print('univercityOther = $univercityOther');
                              },
                              initialValue: univercityOther ??
                                  widget.e?.otherUniversity ??
                                  '',
                              hintText: 'ادخال اخرى هنا',
                              name: 'univercity_other2${widget.e?.id}',
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),

                  /// Graduation Year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: textWidget(
                          stringText: 'سنة التخرج',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      GetBuilder(
                        builder: (EditDoctorScreenController c) {
                          return CustomTextField(
                            height: 60,
                            width: SizeConfig().widthSize(context, 50),
                            onChanged: (val) {
                              graduateYear = val;
                              setState(() {});
                            },
                            initialValue:
                                graduateYear ?? '${widget.e?.graduationYear}',
                            name: 'graduate_year${widget.e?.id}',
                            hintText: 'يرجى ادخال سنة التخرج',
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.number,
                          );
                        },
                      ),
                    ],
                  ),

                  /// submit

/*
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 200,
                      child: GetBuilder(
                        builder: (EditDoctorScreenController c) {
                          return ElevatedButton(
                            onPressed: () {
                              print('''${[
                                certificateOther,
                                univercityOther,
                                graduateYear,
                                widget.e,
                                selectedCertificateOther,
                                selectedUnivercityOther,
                                univercity,
                                certificate,
                              ]}''');
                              c.doctorCertificateEdit(
                                widget.e,
                                certificate,
                                selectedCertificateOther,
                                certificateOther,
                                univercity,
                                selectedUnivercityOther,
                                univercityOther,
                                graduateYear,
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                generalColor,
                              ),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.all(
                                  20,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                textWidget(
                                  stringText: 'حفظ التغييرات',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
*/

                  /// submit
                  Center(
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
                        onPressed: () {
                          switch (stateTextWithIcon6) {
                            case ButtonState.idle:
                              stateTextWithIcon6 = ButtonState.loading;
                              setState(() {});
                              c.request(
                                url: '$url/doctor_certificate/${widget.e?.id}',
                                requestType: 'PUT',
                                map: {
                                  'certificate_id': certificate != null
                                      ? '${certificate?.id}'
                                      : '${widget.e?.certificate?.id}',
                                  'other_certificate': certificateOther ??
                                      '${widget.e?.otherCertificate}',
                                  'university_id': univercity != null
                                      ? '${univercity?.id}'
                                      : '${widget.e?.university?.id}',
                                  'other_university': univercityOther ??
                                      '${widget.e?.otherUniversity}',
                                  'graduation_year': graduateYear ??
                                      '${widget.e?.graduationYear}'
                                },
                              ).then((value) {
                                if (!value.toString().contains('success')) {
                                  print('success');
                                  print('value = $value');
                                  Get.snackbar(
                                    '',
                                    '',
                                    snackPosition: SnackPosition.TOP,
                                    titleText: Center(
                                      child: textWidget(
                                        stringText: 'Success',
                                        fontSize: 21,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    messageText: Center(
                                      child: textWidget(
                                        stringText:
                                            ' تم تحديث الشهادة ${(c.certificatesList?.indexOf(widget.e!))! + 1}',
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor:
                                        Colors.green.withOpacity(0.7),
                                    duration: Duration(seconds: 3),
                                    margin: EdgeInsets.all(15),
                                    borderRadius: 10,
                                  );
                                  stateTextWithIcon6 = ButtonState.success;
                                  setState(() {});
                                } else {
                                  stateTextWithIcon6 = ButtonState.fail;
                                  setState(() {});
                                }
                                print('e.id = ${widget.e?.id}');
                                print('map = ${{
                                  'certificate_id': certificate != null
                                      ? certificate?.id
                                      : '${widget.e?.certificateId}',
                                  'other_certificate': certificateOther ??
                                      '${widget.e?.otherCertificate}',
                                  'university_id': univercity != null
                                      ? univercity?.id
                                      : '${widget.e?.universityId}',
                                  'other_university': univercityOther ??
                                      '${widget.e?.otherUniversity}',
                                  'graduation_year': graduateYear ??
                                      '${widget.e?.graduationYear}'
                                }}');
                              });
                              print('e.id = ${widget.e?.id}');
                              print('map = ${{
                                'certificate_id': certificate != null
                                    ? certificate?.id
                                    : '${widget.e?.certificateId}',
                                'other_certificate': certificateOther ??
                                    '${widget.e?.otherCertificate}',
                                'university_id': univercity != null
                                    ? univercity?.id
                                    : '${widget.e?.universityId}',
                                'other_university': univercityOther ??
                                    '${widget.e?.otherUniversity}',
                                'graduation_year': graduateYear ??
                                    '${widget.e?.graduationYear}'
                              }}');
                              break;
                            case ButtonState.loading:
                              break;
                            case ButtonState.fail:
                              stateTextWithIcon6 = ButtonState.idle;
                              setState(() {});
                              break;
                            case ButtonState.success:
                              stateTextWithIcon6 = ButtonState.idle;
                              setState(() {});
                              break;
                          }
                        },
                        state: stateTextWithIcon6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 40,
              top: 13,
              child: Container(
                width: 130,
                alignment: Alignment.center,
                child: textWidget(
                  stringText:
                      'الشهادة ${(c.certificatesList?.indexOf(widget.e!))! + 1}',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 30,
              top: 7,
              child: Container(
                width: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: GetBuilder(
                    builder: (EditDoctorScreenController c) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(1),
                          ),
                        ),
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 35,
                        ),
                        onPressed: () => c.deleteCertificate(widget.e!),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
