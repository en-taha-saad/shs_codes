// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/reuseable_dropdown.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

class Step2EditScreen extends StatelessWidget {
  const Step2EditScreen({
    Key? key,
    required this.doctorProfile,
  }) : super(key: key);

  final DoctorProfile? doctorProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: textWidget(
                    stringText: 'الدرجة',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                CustomDropDown(
                  // items:
                  //     c.doctorTitleList?.length != 0 ? c.doctorTitleList : [],
                  popupTitle: 'اختر الدرجة',
                  onChanged: c.doctorTitleChanged,
                  itemAsString: (u) {
                    // return '${u['name']} ${u["extra_info"]["other"]}';
                    return '$u';
                  },
                  // selectedItem: c.doctorTitle ?? doctorProfile?.doctorTitle?[0],
                  // onFind: c.doctorTitleList?.length != 0
                  //     ? null
                  //     : (filter) {
                  //         return c.getDropDownListData(
                  //           url: 'doctor_titles',
                  //           filter: filter,
                  //           dropDownList: c.doctorTitleList,
                  //         );
                  //       },
                  dropdownBuilderStringText: c.doctorTitle,
                ),
              ],
            );
          },
        ),

        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.selectedDoctorTitleOther != true
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(),
                      GetBuilder(
                        builder: (EditDoctorScreenController c) {
                          return Container(
                            height: 60,
                            width: SizeConfig().widthSize(context, 55),
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: FormBuilderTextField(
                              minLines: null,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'ادخال اخرى هنا',
                                hintStyle: style(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                filled: false,
                                contentPadding: EdgeInsets.only(
                                  right: 20,
                                ),
                                isDense: false,
                                border: OutlineInputBorder(
                                  gapPadding: 20,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: c.doctorTitleOtherChanged,
                              initialValue: c.doctorTitleOther ??
                                  doctorProfile
                                      ?.doctorTitle?[0].extraInfo?.other ??
                                  '',
                              expands: true,
                              autofocus: false,
                              name: 'doctor_title_other1',
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),

        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.selectedDoctorTitleOther == null
                ? (doctorProfile?.doctorTitle?[0].id != 1
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(),
                          GetBuilder(
                            builder: (EditDoctorScreenController c) {
                              return Container(
                                height: 60,
                                width: SizeConfig().widthSize(context, 55),
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: FormBuilderTextField(
                                  minLines: null,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'ادخال اخرى هنا',
                                    hintStyle: style(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    filled: false,
                                    contentPadding: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    isDense: false,
                                    border: OutlineInputBorder(
                                      gapPadding: 20,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.1),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  onChanged: c.doctorTitleOtherChanged,
                                  initialValue: c.doctorTitleOther ??
                                      doctorProfile
                                          ?.doctorTitle?[0].extraInfo?.other ??
                                      '',
                                  expands: true,
                                  autofocus: false,
                                  name: 'doctor_title_other2',
                                ),
                              );
                            },
                          ),
                        ],
                      ))
                : Container();
          },
        ),

        /// submit
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.saveChangesStep2();
          },
        ),
      ],
    );
  }
}
