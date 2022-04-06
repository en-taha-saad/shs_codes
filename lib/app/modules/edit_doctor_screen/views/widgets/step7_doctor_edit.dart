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
class Step7EditScreen extends StatefulWidget {
  final DropDownType? e;
  Step7EditScreen({Key? key, this.e}) : super(key: key);

  @override
  State<Step7EditScreen> createState() => _Step7EditScreenState();
}

class _Step7EditScreenState extends State<Step7EditScreen> {
  DropDownType? membership;
  String? membershipOther;
  bool? selectedMembershipOther;
  ButtonState stateTextWithIcon6 = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    selectedMembershipOther = membership != null
        ? membership?.id == 1
            ? true
            : false
        : widget.e?.id == 1
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
                  /// Membership
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: textWidget(
                          stringText: 'العضوية',
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
                        popupTitle: 'اختر العضوية',
                        onChanged: (val) {
                          membership = val;
                          selectedMembershipOther =
                              membership?.id == 1 ? true : false;
                          setState(() {});
                          print('membership = $membership');
                        },
                        itemAsString: (u) {
                          // return '${u['name']} ${u["extra_info"]["other"]}';
                          return '$u';
                        },
                        selectedItem: membership ?? widget.e,
                        onFind: c.membershipList?.length != 0
                            ? null
                            : (filter) => c.getDropDownListData(
                                  url: 'memberships',
                                  filter: filter,
                                  dropDownList: c.membershipList,
                                ),
                      ),
                    ],
                  ),
                  selectedMembershipOther != true
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
                                membershipOther = val;
                                setState(() {});
                                print('membershipOther = $membershipOther');
                              },
                              initialValue: membershipOther ??
                                  widget.e?.extraInfo?.other ??
                                  '',
                              name: 'membership_other${widget.e?.id}',

                              hintText: 'ادخال اخرى هنا',
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),

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
                              c.membershipsList?.map((x) {
                                if (x.id == widget.e?.id) {
                                  c.request(
                                    url:
                                        '$url/update_doctor_profile/memberships',
                                    requestType: 'PUT',
                                    map: {
                                      '_method': 'PUT',
                                      'memberships': [].toString()
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
                                                ' تم تحديث الشهادة ${(c.membershipsList?.indexOf(widget.e!))! + 1}',
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
                                  });
                                }
                              });
                              print('e.id = ${widget.e?.id}');
                              // print('map = ${{
                              //   'certificate_id': certificate != null
                              //       ? certificate?.id
                              //       : '${widget.e?.certificateId}',
                              //   'other_certificate': certificateOther ??
                              //       '${widget.e?.otherCertificate}',
                              //   'university_id': univercity != null
                              //       ? univercity?.id
                              //       : '${widget.e?.universityId}',
                              //   'other_university': univercityOther ??
                              //       '${widget.e?.otherUniversity}',
                              //   'graduation_year': graduateYear ??
                              //       '${widget.e?.graduationYear}'
                              // }}');
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
                      'العضوية ${(c.membershipsList?.indexOf(widget.e!))! + 1}',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
