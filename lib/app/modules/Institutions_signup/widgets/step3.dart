import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
// import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
// import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  child: Column(
                    children: [
                      GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomDialogTextFieldTextContainer(
                                stringText: 'الأيام       ',
                                fontSize: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: textWidget(
                                    stringText: "*",
                                    color: Colors.red,
                                    fontSize: 28),
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                height: SizeConfig().heightSize(context, 9),
                                child: MultiSelectDropDownFormField(
                                  onChange: c.onChangedSelectedDay,
                                  selectedItems: c.selectedDays,
                                  items: c.dayInWeek,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: dropdownErrorText,
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomDialogTextFieldTextContainer(
                                stringText: 'الساعات',
                                fontSize: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: textWidget(
                                    stringText: "*",
                                    color: Colors.red,
                                    fontSize: 28),
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig().widthSize(context, 30),
                                      height:
                                          SizeConfig().heightSize(context, 7),
                                      child: TextButton(
                                        child: textWidget(
                                            stringText: c.dateStringFrom == ""
                                                ? "من"
                                                : c.dateStringFrom,
                                            color: Colors.black),
                                        onPressed: () =>
                                            c.pickDateFrom("بداية ساعات العمل"),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                    Container(
                                      width:
                                          SizeConfig().widthSize(context, 30),
                                      height:
                                          SizeConfig().heightSize(context, 7),
                                      child: TextButton(
                                        child: textWidget(
                                            stringText: c.dateStringTo == ""
                                                ? "الى"
                                                : c.dateStringTo,
                                            color: Colors.black),
                                        onPressed: () =>
                                            c.pickDateTo("نهاية ساعات العمل"),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 40,
                    top: 0,
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: textWidget(
                          stringText: "ايام الدوام",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  child: Column(
                    children: [
                      GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomDialogTextFieldTextContainer(
                                stringText: 'الأيام',
                                fontSize: 15,
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                height: SizeConfig().heightSize(context, 9),
                                child: MultiSelectDropDownFormField(
                                  onChange: c.onChangedSelectedExceptionDay,
                                  selectedItems: c.selectedExceptionDays,
                                  items: c.dayInWeekException.isEmpty
                                      ? c.dayInWeek
                                      : c.dayInWeekException,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 5),
                      GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomDialogTextFieldTextContainer(
                                stringText: 'الساعات',
                                fontSize: 15,
                              ),
                              Container(
                                  width: SizeConfig().widthSize(context, 64),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: SizeConfig()
                                              .widthSize(context, 30),
                                          height: SizeConfig()
                                              .heightSize(context, 7),
                                          child: TextButton(
                                            child: textWidget(
                                                stringText:
                                                    c.dateStringExceptionFrom ==
                                                            ""
                                                        ? "من"
                                                        : c.dateStringExceptionFrom,
                                                color: Colors.black),
                                            onPressed: () =>
                                                c.pickDateExceptionFrom(
                                                    "بداية ساعات العمل"),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig()
                                              .widthSize(context, 30),
                                          height: SizeConfig()
                                              .heightSize(context, 7),
                                          child: TextButton(
                                            child: textWidget(
                                                stringText:
                                                    c.dateStringExceptionTo ==
                                                            ""
                                                        ? "الى"
                                                        : c.dateStringExceptionTo,
                                                color: Colors.black),
                                            onPressed: () =>
                                                c.pickDateExceptionTo(
                                                    "نهاية ساعات العمل"),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ])),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 40,
                    top: 0,
                    child: Container(
                      width: 120,
                      alignment: Alignment.center,
                      child: textWidget(
                          stringText: "الإستثناءات",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
