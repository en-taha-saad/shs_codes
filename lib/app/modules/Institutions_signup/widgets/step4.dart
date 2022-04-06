import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';
import 'package:shs108private/app/modules/Institutions_signup/models/saved_data_in_mobile_model.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            GetBuilder(
              builder:(InstitutionsSignupController c) {
                return c.listOfStaff.isEmpty?Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                        stringText: "لا يوجد كادر",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.error , color: Colors.grey,size: 40,),
                    ],
                  ),
                ):Container();
              }
            ),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: c.listOfStaff.map(
                    (staff) {
                      return ShowListWidget(
                          height: SizeConfig().heightSize(context, 40),
                          onPressedEditCard: () => c.editStaff(staff),
                          onPressedCancel: c.cancelStaff,
                          onPressedEditCardBeforeDialog: () {
                            c.saveScheduleView(staff);
                            c.onChangedSelectedStaffDay
                              (c.selectedStaffDays);
                          },
                          children3: [
                            GetBuilder(
                                initState:(s)=>c.prepareToEdit(staff),
                                builder: (InstitutionsSignupController cx) {
                              return Column(
                                children: [
                                  GetBuilder(
                                    builder: (InstitutionsSignupController cx) {
                                      return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CustomDialogTextFieldTextContainer(
                                            stringText: (!c.isNotDoctor.contains(staff.staffId)?'الطبيب':'الموظف'),
                                            fontSize: 15,
                                          ),
                                          Container(
                                              width:
                                              SizeConfig().widthSize(context, 58),
                                              height:
                                              SizeConfig().heightSize(context, 7),
                                              child: Container(
                                                child: textWidget(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  stringText: '${c.staffNames[staff.staffId]}'
                                                  ,
                                                ),
                                                alignment: Alignment.centerRight,
                                                padding: EdgeInsets.only(bottom: 10),
                                              )
                                          ),
                                        ],
                                      );
                                    },
                                    // initState:(s)=>c.prepareToEdit(staff),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomDialogTextFieldTextContainer(
                                        stringText: 'الأيام',
                                        fontSize: 15,
                                      ),
                                      Container(
                                        width:
                                        SizeConfig().widthSize(context, 58),
                                        height:
                                        SizeConfig().heightSize(context, 9),
                                        child: MultiSelectDropDownFormField(
                                          onChange:
                                          cx.onChangedSelectedStaffDay,
                                          selectedItems: cx.selectedStaffDays,
                                          items: cx.dayInWeek,
                                        ),
                                      ),
                                    ],
                                  ),
                                  c.isNotDoctor.contains(staff.staffId)
                                      ?Container():GetBuilder(
                                      builder: (InstitutionsSignupController c) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                CustomDialogTextFieldTextContainer(
                                                  stringText: 'الساعات',
                                                  fontSize: 15,
                                                ),
                                                Container(
                                                    width: SizeConfig()
                                                        .widthSize(context, 58),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: SizeConfig()
                                                                .widthSize(context, 27),
                                                            height: SizeConfig()
                                                                .heightSize(context, 7),
                                                            child: TextButton(
                                                              child: textWidget(
                                                                  stringText:
                                                                   c
                                                                       .dateStringStaffFrom ==
                                                              ""
                                                              ? "من"
                                                                  : c
                                                                       .dateStringStaffFrom,
                                                                  color: Colors.black),
                                                              onPressed: () =>
                                                                  c.pickDateStaffFrom(
                                                                      "بداية ساعات العمل"),
                                                            ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                              color: Colors.grey.shade100,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: SizeConfig()
                                                                .widthSize(context, 27),
                                                            height: SizeConfig()
                                                                .heightSize(context, 7),
                                                            child: TextButton(
                                                              child: textWidget(
                                                                  stringText:
                                                                  c.dateStringStaffTo ==
                                                                      ""
                                                                      ? "الى"
                                                                      : c.dateStringStaffTo,
                                                                  color: Colors.black),
                                                              onPressed: () =>
                                                                  c.pickDateStaffTo(
                                                                      "نهاية ساعات العمل"),
                                                            ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                              color: Colors.grey.shade100,
                                                            ),
                                                          ),
                                                        ])),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                CustomDialogTextFieldTextContainer(
                                                  stringText: 'الأستثناءات',
                                                  fontSize: 15,
                                                ),
                                                Container(
                                                  width:
                                                  SizeConfig().widthSize(context, 58),
                                                  height:
                                                  SizeConfig().heightSize(context, 9),
                                                  child: MultiSelectDropDownFormField(
                                                    onChange:
                                                    cx.onChangedSelectedStaffExceptionDay,
                                                    selectedItems: cx.selectedStaffExceptionDays,
                                                    items: cx.dayInWeekStaffException,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GetBuilder(
                                                builder: (InstitutionsSignupController c) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      CustomDialogTextFieldTextContainer(
                                                        stringText: 'الساعات',
                                                        fontSize: 15,
                                                      ),
                                                      Container(
                                                          width: SizeConfig()
                                                              .widthSize(context, 58),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: SizeConfig()
                                                                      .widthSize(context, 27),
                                                                  height: SizeConfig()
                                                                      .heightSize(context, 7),
                                                                  child: TextButton(
                                                                    child: textWidget(
                                                                        stringText:
                                                                        c
                                                                            .dateStringStaffExceptionFrom ==
                                                                            ""
                                                                            ? "من"
                                                                            : c
                                                                            .dateStringStaffExceptionFrom,
                                                                        color: Colors.black),
                                                                    onPressed: () =>
                                                                        c.pickDateStaffExceptionFrom(
                                                                            "بداية ساعات العمل"),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        10),
                                                                    color: Colors.grey.shade100,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: SizeConfig()
                                                                      .widthSize(context, 27),
                                                                  height: SizeConfig()
                                                                      .heightSize(context, 7),
                                                                  child: TextButton(
                                                                    child: textWidget(
                                                                        stringText:
                                                                        c
                                                                            .dateStringStaffExceptionTo ==
                                                                            ""
                                                                            ? "الى"
                                                                            : c
                                                                            .dateStringStaffExceptionTo,
                                                                        color: Colors.black),
                                                                    onPressed: () =>
                                                                        c.pickDateStaffExceptionTo(
                                                                            "نهاية ساعات العمل"),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        10),
                                                                    color: Colors.grey.shade100,
                                                                  ),
                                                                ),
                                                              ])),
                                                    ],
                                                  );
                                                }),
                                          ],
                                        );
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder(
                                    builder: (InstitutionsSignupController c) {
                                      return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          CustomDialogTextFieldTextContainer(
                                            stringText: 'الدور \nفي الصفحة*',
                                            fontSize: 15,
                                          ),
                                          Container(
                                            width: SizeConfig()
                                                .widthSize(context, 58),
                                            height: SizeConfig()
                                                .heightSize(context, 9),
                                            child: DropdownSearch<GetDataModel?>(
                                              dropdownSearchDecoration:
                                              InputDecoration(
                                                filled: true,
                                                errorStyle: style(
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10),
                                                isDense: false,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              maxHeight: 500,
                                              itemAsString: (u) {
                                                return (u?.name).toString();
                                              },
                                              items: c.role,
                                              onChanged: c
                                                  .onChangedSelectedRole,
                                              selectedItem:
                                              // (c.toPinedJson?.medicalSpecialties != null)
                                              //     ? (c.toPinedJson?.medicalSpecialties)
                                              //     :
                                              c.selectedRole,
                                              popupBarrierColor:
                                              Colors.grey.withOpacity(0.5),
                                              showAsSuffixIcons: true,
                                              showSearchBox: true,
                                              autoValidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator:
                                              FormBuilderValidators.compose([
                                                FormBuilderValidators.required(
                                                  context,
                                                  errorText: dropdownErrorText,
                                                ),
                                              ]),
                                              mode: Mode.DIALOG,
                                              showClearButton: true,
                                              popupSafeArea: PopupSafeAreaProps(
                                                top: true,
                                                bottom: true,
                                              ),
                                              clearButtonSplashRadius: 20,
                                              popupItemBuilder: (__, model, _) {
                                                return Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Center(
                                                      child: textWidget(
                                                        stringText:
                                                        model?.name ?? '',
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              dropdownBuilder:
                                                  (__, GetDataModel? model) {
                                                if (model == null) {
                                                  return Container();
                                                }
                                                return Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Container(
                                                    child: Center(
                                                      child: textWidget(
                                                        stringText: model.name,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              emptyBuilder: (_, item) {
                                                return Center(
                                                  child: textWidget(
                                                    stringText: "لا يوجد $item",
                                                    fontSize: 30,
                                                  ),
                                                );
                                              },
                                              searchFieldProps: TextFieldProps(
                                                textDirection: TextDirection.rtl,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      12, 12, 8, 0),
                                                  hintText: "ابحث هنا",
                                                  hintStyle: style(),
                                                  hintTextDirection:
                                                  TextDirection.rtl,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  c.isNotDoctor.contains(staff.staffId)
                                      ?Container():GetBuilder(
                                    builder: (InstitutionsSignupController c) {
                                      return Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          CustomDialogTextFieldTextContainer(
                                            stringText: 'مدة \nالمراجعة*',
                                            fontSize: 15,
                                          ),
                                          Container(
                                            width: SizeConfig()
                                                .widthSize(context, 58),
                                            height: SizeConfig()
                                                .heightSize(context, 9),
                                            child: DropdownSearch<GetDataModel?>(
                                              dropdownSearchDecoration:
                                              InputDecoration(
                                                filled: true,
                                                errorStyle: style(
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10),
                                                isDense: false,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              maxHeight: 500,
                                              items: c.slotTimes,
                                              itemAsString: (u) {
                                                return (u?.name).toString();
                                              },
                                              onChanged: c
                                                  .onChangedSelectedSlot,
                                              selectedItem:c.selectedSlot,
                                              popupBarrierColor:
                                              Colors.grey.withOpacity(0.5),
                                              showAsSuffixIcons: true,
                                              showSearchBox: true,
                                              autoValidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator:
                                              FormBuilderValidators.compose([
                                                FormBuilderValidators.required(
                                                  context,
                                                  errorText: dropdownErrorText,
                                                ),
                                              ]),
                                              mode: Mode.DIALOG,
                                              showClearButton: true,
                                              popupSafeArea: PopupSafeAreaProps(
                                                top: true,
                                                bottom: true,
                                              ),
                                              clearButtonSplashRadius: 20,
                                              popupItemBuilder: (__, model, _) {
                                                return Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Center(
                                                      child: textWidget(
                                                        stringText:
                                                        model?.name ?? '',
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              dropdownBuilder:
                                                  (__, GetDataModel? model) {
                                                if (model == null) {
                                                  return Container();
                                                }
                                                return Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Container(
                                                    child: Center(
                                                      child: textWidget(
                                                        stringText: model.name,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              emptyBuilder: (_, item) {
                                                return Center(
                                                  child: textWidget(
                                                    stringText: "لا يوجد $item",
                                                    fontSize: 30,
                                                  ),
                                                );
                                              },
                                              searchFieldProps: TextFieldProps(
                                                textDirection: TextDirection.rtl,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      12, 12, 8, 0),
                                                  hintText: "ابحث هنا",
                                                  hintStyle: style(),
                                                  hintTextDirection:
                                                  TextDirection.rtl,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder(
                                    builder: (InstitutionsSignupController cx) {
                                      return Center(
                                        child: textWidget(
                                          stringText: cx.stepError,
                                          color: Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }),
                          ],
                          children2: [
                            SizedBox(height: 10),
                            textWidget(
                              stringText: (!c.isNotDoctor.contains(staff
                                  .staffId)?'الطبيب : '
                                  ' ':'الموظف : ')+
                              '${c.staffNames[staff.staffId]}'
                              ,
                              fontSize: 20,
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: 'المهنة : ',
                              fontSize: 20,
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: 'الاختصاص : ',
                              fontSize: 20,
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: 'اوقات التواجد :   ${
                              staff.availableSchedules!.where((element) => element.startDate==staff.availableSchedules![0].startDate).map(
                      (AvailableSchedules v) => c.days[v.recurringWeekDay])
                          .toList().join(" - ")
                              }',
                              fontSize: 20,
                            ),
                            c.isNotDoctor.contains(staff.staffId)
                                ?Container():GetBuilder(
                              initState:(s)=>c.saveScheduleView(staff),
                            builder: (InstitutionsSignupController cx) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  textWidget(
                                    stringText: 'الساعات : من '
                                    '${cx.formatDate(DateTime
                                        .parse(staff.availableSchedules![0]
                                        .startDate!))}'
                                    // '${cx.dates[cx.listOfStaff.indexOf(staff)][1]}'
                                    ' الى '
                                    '${cx.formatDate(DateTime
                                        .parse(staff.availableSchedules![0]
                                        .endDate!))}',
                                        // '${cx.dates[cx.listOfStaff.indexOf(staff)][2]}',
                                    fontSize: 20,
                                  ),
                                  staff.availableSchedules!.where(
                                          (element) => element.startDate!=staff.availableSchedules![0].startDate).map(
                                          (AvailableSchedules v) => c.days[v.recurringWeekDay])
                                      .isNotEmpty?Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      textWidget(
                                        stringText: 'ايام الأستثناءات :   ${
                                            staff.availableSchedules!.where(
                                                    (element) => element.startDate!=staff.availableSchedules![0].startDate).map(
                                                    (AvailableSchedules v) => c.days[v.recurringWeekDay])
                                                .toList().join(" - ")
                                            // cx.dates[cx.listOfStaff.indexOf(staff)][3]
                                        }',
                                        fontSize: 20,
                                      ),
                                      SizedBox(height: 10),
                                      textWidget(
                                        stringText: 'الساعات : من '
                                            '${
                                            cx.formatDate(DateTime
                                                .parse(staff.availableSchedules!.where(
                      (element) => element.startDate!=staff
                          .availableSchedules![0].startDate).first
                                                .startDate!))}'
                                            // cx.dates[cx.listOfStaff.indexOf(staff)][4]}'
                                            ' الى '
                                            '${
                                            // cx.dates[cx.listOfStaff.indexOf(staff)][5]
                                            cx.formatDate(DateTime
                                                .parse(staff.availableSchedules!.where(
                                                    (element) => element.startDate!=staff
                                                    .availableSchedules![0].startDate).first
                                                .endDate!))
                                        }',
                                        fontSize: 20,
                                      ),
                                    ],
                                  ):Container(),
                                ],
                              );
                              // cx.removeStaffFields();
                              },
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: 'الدور في الصفحة : '
                              '${c.role[staff.roleId!-1].name}',
                              fontSize: 20,
                            ),
                            SizedBox(height: 20),
                          ],
                          stringText:
                              (!c.isNotDoctor.contains(staff.staffId)?'الطبيب'
                                  ' ':'الموظف ')
                              +'${c.staffNames[staff.staffId]}',
                          title: 'التعديل على الكادر',
                          onPressedRemove: () => c.removeStaff(staff),
                          );
                    },
                  ).toList(),
                );
              },
            ),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return AddCardWidget(
                  height: SizeConfig().heightSize(context, 60),
                  children: [
                    Center(
                      child: textWidget(
                          stringText: "اضافة كادر وفق الرقم "
                              "الشخصي"),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // width: SizeConfig().widthSize(context, 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder(
                                initState:(s) {
                                  c.removeStaffFields();
                                },
                                builder: (InstitutionsSignupController cx) {
                                return CustomDialogTextField(
                                  width: SizeConfig().widthSize(context, 50),
                                  hintText: 'الرقم الشخصي',
                                  initialValue: cx.staffController,
                                  enabled: (cx.isCheckedId[1]==0),
                                  name: 'personal_id',
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: textfieldErrorText,
                                    ),
                                  ]),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: cx.onChangedStaffController,
                                );}),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: SizeConfig().widthSize(context, 20),
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green.shade500,
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(10),
                                    ),
                                  ),
                                  onPressed: (){
                                    c.checkPatientId(1);},
                                  child: textWidget(
                                    stringText: "تحقق",
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    GetBuilder(builder: (InstitutionsSignupController cx) {
                      Widget widget = Container();
                      switch(cx.isCheckedId[1]){
                        case(0):{
                          widget = Container(
                            padding:EdgeInsets.only(top: 50),
                            child: textWidget(
                                stringText: c.staffError??"للأستمرار يرجى "
                            "التحقق من الرقم الشخصي",
                                fontSize: 20
                            ),
                            alignment: Alignment.center,
                          );
                        }
                        break;
                        case(1):{
                          widget = Column(
                            children: [
                              GetBuilder(
                                  builder: (InstitutionsSignupController cx) {
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          stringText: 'الدكتور',
                                          fontSize: 15,
                                        ),
                                        Container(
                                            width:
                                            SizeConfig().widthSize(context, 58),
                                            height:
                                            SizeConfig().heightSize(context, 7),
                                            child: Container(
                                              child: textWidget(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                stringText: cx.staffName,
                                              ),
                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.only(bottom: 10),
                                            )
                                        ),
                                      ],
                                    );
                                  }),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomDialogTextFieldTextContainer(
                                    stringText: 'الأيام*',
                                    fontSize: 15,
                                  ),
                                  Container(
                                    width:
                                    SizeConfig().widthSize(context, 58),
                                    height:
                                    SizeConfig().heightSize(context, 9),
                                    child: MultiSelectDropDownFormField(
                                      onChange:
                                      cx.onChangedSelectedStaffDay,
                                      selectedItems: cx.selectedStaffDays,
                                      items: cx.dayInWeek,
                                    ),
                                  ),
                                ],
                              ),
                              GetBuilder(
                                  builder: (InstitutionsSignupController c) {
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          stringText: 'الساعات*',
                                          fontSize: 15,
                                        ),
                                        Container(
                                            width: SizeConfig()
                                                .widthSize(context, 58),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: SizeConfig()
                                                        .widthSize(context, 27),
                                                    height: SizeConfig()
                                                        .heightSize(context, 7),
                                                    child: TextButton(
                                                      child: textWidget(
                                                          stringText:
                                                          c.dateStringStaffFrom ==
                                                              ""
                                                              ? "من"
                                                              : c.dateStringStaffFrom,
                                                          color: Colors.black),
                                                      onPressed: () =>
                                                          c.pickDateStaffFrom(
                                                              "بداية ساعات العمل"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: Colors.grey.shade100,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: SizeConfig()
                                                        .widthSize(context, 27),
                                                    height: SizeConfig()
                                                        .heightSize(context, 7),
                                                    child: TextButton(
                                                      child: textWidget(
                                                          stringText:
                                                          c.dateStringStaffTo ==
                                                              ""
                                                              ? "الى"
                                                              : c.dateStringStaffTo,
                                                          color: Colors.black),
                                                      onPressed: () =>
                                                          c.pickDateStaffTo(
                                                              "نهاية ساعات العمل"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: Colors.grey.shade100,
                                                    ),
                                                  ),
                                                ])),
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomDialogTextFieldTextContainer(
                                    stringText: 'الأستثناءات',
                                    fontSize: 15,
                                  ),
                                  Container(
                                    width:
                                    SizeConfig().widthSize(context, 58),
                                    height:
                                    SizeConfig().heightSize(context, 9),
                                    child: MultiSelectDropDownFormField(
                                      onChange:
                                      cx.onChangedSelectedStaffExceptionDay,
                                      selectedItems: cx.selectedStaffExceptionDays,
                                      items: cx.dayInWeekStaffException,
                                    ),
                                  ),
                                ],
                              ),
                              GetBuilder(
                                  builder: (InstitutionsSignupController c) {
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          stringText: 'الساعات',
                                          fontSize: 15,
                                        ),
                                        Container(
                                            width: SizeConfig()
                                                .widthSize(context, 58),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: SizeConfig()
                                                        .widthSize(context, 27),
                                                    height: SizeConfig()
                                                        .heightSize(context, 7),
                                                    child: TextButton(
                                                      child: textWidget(
                                                          stringText:
                                                          c
                                                              .dateStringStaffExceptionFrom ==
                                                              ""
                                                              ? "من"
                                                              : c
                                                              .dateStringStaffExceptionFrom,
                                                          color: Colors.black),
                                                      onPressed: () =>
                                                          c.pickDateStaffExceptionFrom(
                                                              "بداية ساعات العمل"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: Colors.grey.shade100,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: SizeConfig()
                                                        .widthSize(context, 27),
                                                    height: SizeConfig()
                                                        .heightSize(context, 7),
                                                    child: TextButton(
                                                      child: textWidget(
                                                          stringText:
                                                          c
                                                              .dateStringStaffExceptionTo ==
                                                              ""
                                                              ? "الى"
                                                              : c
                                                              .dateStringStaffExceptionTo,
                                                          color: Colors.black),
                                                      onPressed: () =>
                                                          c.pickDateStaffExceptionTo(
                                                              "نهاية ساعات العمل"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: Colors.grey.shade100,
                                                    ),
                                                  ),
                                                ])),
                                      ],
                                    );
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              GetBuilder(
                                builder: (InstitutionsSignupController c) {
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      CustomDialogTextFieldTextContainer(
                                        stringText: 'الدور \nفي الصفحة*',
                                        fontSize: 15,
                                      ),
                                      Container(
                                        width: SizeConfig()
                                            .widthSize(context, 58),
                                        height: SizeConfig()
                                            .heightSize(context, 9),
                                        child: DropdownSearch<GetDataModel?>(
                                          dropdownSearchDecoration:
                                          InputDecoration(
                                            filled: true,
                                            errorStyle: style(
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                            contentPadding:
                                            EdgeInsets.all(10),
                                            isDense: false,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          maxHeight: 500,
                                          items: c.role,
                                          itemAsString: (u) {
                                            return (u?.name).toString();
                                          },
                                          onChanged: c
                                              .onChangedSelectedRole,
                                          selectedItem:
                                          // (c.toPinedJson?.medicalSpecialties != null)
                                          //     ? (c.toPinedJson?.medicalSpecialties)
                                          //     :
                                          c.selectedRole,
                                          popupBarrierColor:
                                          Colors.grey.withOpacity(0.5),
                                          showAsSuffixIcons: true,
                                          showSearchBox: true,
                                          autoValidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator:
                                          FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                              context,
                                              errorText: dropdownErrorText,
                                            ),
                                          ]),
                                          mode: Mode.DIALOG,
                                          showClearButton: true,
                                          popupSafeArea: PopupSafeAreaProps(
                                            top: true,
                                            bottom: true,
                                          ),
                                          clearButtonSplashRadius: 20,
                                          popupItemBuilder: (__, model, _) {
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                padding: EdgeInsets.all(15),
                                                child: Center(
                                                  child: textWidget(
                                                    stringText:
                                                    model?.name ?? '',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          dropdownBuilder:
                                              (__, GetDataModel? model) {
                                            if (model == null) {
                                              return Container();
                                            }
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                child: Center(
                                                  child: textWidget(
                                                    stringText: model.name,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          emptyBuilder: (_, item) {
                                            return Center(
                                              child: textWidget(
                                                stringText: "لا يوجد $item",
                                                fontSize: 30,
                                              ),
                                            );
                                          },
                                          searchFieldProps: TextFieldProps(
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.fromLTRB(
                                                  12, 12, 8, 0),
                                              hintText: "ابحث هنا",
                                              hintStyle: style(),
                                              hintTextDirection:
                                              TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetBuilder(
                                builder: (InstitutionsSignupController c) {
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      CustomDialogTextFieldTextContainer(
                                        stringText: 'مدة \nالمراجعة*',
                                        fontSize: 15,
                                      ),
                                      Container(
                                        width: SizeConfig()
                                            .widthSize(context, 58),
                                        height: SizeConfig()
                                            .heightSize(context, 9),
                                        child: DropdownSearch<GetDataModel?>(
                                          dropdownSearchDecoration:
                                          InputDecoration(
                                            filled: true,
                                            errorStyle: style(
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                            contentPadding:
                                            EdgeInsets.all(10),
                                            isDense: false,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          maxHeight: 500,
                                          items: c.slotTimes,
                                          itemAsString: (u) {
                                            return (u?.name).toString();
                                          },
                                          onChanged: c
                                              .onChangedSelectedSlot,
                                          selectedItem:c.selectedSlot,
                                          popupBarrierColor:
                                          Colors.grey.withOpacity(0.5),
                                          showAsSuffixIcons: true,
                                          showSearchBox: true,
                                          autoValidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator:
                                          FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                              context,
                                              errorText: dropdownErrorText,
                                            ),
                                          ]),
                                          mode: Mode.DIALOG,
                                          showClearButton: true,
                                          popupSafeArea: PopupSafeAreaProps(
                                            top: true,
                                            bottom: true,
                                          ),
                                          clearButtonSplashRadius: 20,
                                          popupItemBuilder: (__, model, _) {
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                padding: EdgeInsets.all(15),
                                                child: Center(
                                                  child: textWidget(
                                                    stringText:
                                                    model?.name ?? '',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          dropdownBuilder:
                                              (__, GetDataModel? model) {
                                            if (model == null) {
                                              return Container();
                                            }
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                child: Center(
                                                  child: textWidget(
                                                    stringText: model.name,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          emptyBuilder: (_, item) {
                                            return Center(
                                              child: textWidget(
                                                stringText: "لا يوجد $item",
                                                fontSize: 30,
                                              ),
                                            );
                                          },
                                          searchFieldProps: TextFieldProps(
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.fromLTRB(
                                                  12, 12, 8, 0),
                                              hintText: "ابحث هنا",
                                              hintStyle: style(),
                                              hintTextDirection:
                                              TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetBuilder(
                                builder: (InstitutionsSignupController cx) {
                                  return Center(
                                    child: textWidget(
                                      stringText: cx.stepError,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                        break;
                        case(2):{
                          widget = Container(alignment : Alignment.center,padding:EdgeInsets.all(50),
                              child:
                              CircularProgressIndicator());
                        }
                        break;
                        case(3):{
                          widget = Column(
                            children: [
                              GetBuilder(
                                  builder: (InstitutionsSignupController cx) {
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomDialogTextFieldTextContainer(
                                          stringText: 'الدكتور',
                                          fontSize: 15,
                                        ),
                                        Container(
                                            width:
                                            SizeConfig().widthSize(context, 58),
                                            height:
                                            SizeConfig().heightSize(context, 7),
                                            child: Container(
                                              child: textWidget(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                stringText: cx.staffName,
                                              ),
                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.only(bottom: 10),
                                            )
                                        ),
                                      ],
                                    );
                                  }),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomDialogTextFieldTextContainer(
                                    stringText: 'الأيام',
                                    fontSize: 15,
                                  ),
                                  Container(
                                    width:
                                    SizeConfig().widthSize(context, 58),
                                    height:
                                    SizeConfig().heightSize(context, 9),
                                    child: MultiSelectDropDownFormField(
                                      onChange:
                                      cx.onChangedSelectedStaffDay,
                                      selectedItems: cx.selectedStaffDays,
                                      items: cx.dayInWeek,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetBuilder(
                                builder: (InstitutionsSignupController c) {
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      CustomDialogTextFieldTextContainer(
                                        stringText: 'الدور \nفي الصفحة*',
                                        fontSize: 15,
                                      ),
                                      Container(
                                        width: SizeConfig()
                                            .widthSize(context, 58),
                                        height: SizeConfig()
                                            .heightSize(context, 9),
                                        child: DropdownSearch<GetDataModel?>(
                                          dropdownSearchDecoration:
                                          InputDecoration(
                                            filled: true,
                                            errorStyle: style(
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                            contentPadding:
                                            EdgeInsets.all(10),
                                            isDense: false,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          maxHeight: 500,
                                          items: c.role,
                                          itemAsString: (u) {
                                            return (u?.name).toString();
                                          },
                                          onChanged: c
                                              .onChangedSelectedRole,
                                          selectedItem:
                                          // (c.toPinedJson?.medicalSpecialties != null)
                                          //     ? (c.toPinedJson?.medicalSpecialties)
                                          //     :
                                          c.selectedRole,
                                          popupBarrierColor:
                                          Colors.grey.withOpacity(0.5),
                                          showAsSuffixIcons: true,
                                          showSearchBox: true,
                                          autoValidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator:
                                          FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                              context,
                                              errorText: dropdownErrorText,
                                            ),
                                          ]),
                                          mode: Mode.DIALOG,
                                          showClearButton: true,
                                          popupSafeArea: PopupSafeAreaProps(
                                            top: true,
                                            bottom: true,
                                          ),
                                          clearButtonSplashRadius: 20,
                                          popupItemBuilder: (__, model, _) {
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                padding: EdgeInsets.all(15),
                                                child: Center(
                                                  child: textWidget(
                                                    stringText:
                                                    model?.name ?? '',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          dropdownBuilder:
                                              (__, GetDataModel? model) {
                                            if (model == null) {
                                              return Container();
                                            }
                                            return Directionality(
                                              textDirection:
                                              TextDirection.rtl,
                                              child: Container(
                                                child: Center(
                                                  child: textWidget(
                                                    stringText: model.name,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          emptyBuilder: (_, item) {
                                            return Center(
                                              child: textWidget(
                                                stringText: "لا يوجد $item",
                                                fontSize: 30,
                                              ),
                                            );
                                          },
                                          searchFieldProps: TextFieldProps(
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.fromLTRB(
                                                  12, 12, 8, 0),
                                              hintText: "ابحث هنا",
                                              hintStyle: style(),
                                              hintTextDirection:
                                              TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GetBuilder(
                                builder: (InstitutionsSignupController cx) {
                                  return Center(
                                    child: textWidget(
                                      stringText: cx.stepError,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                        break;
                      }
                      return widget;

                    }),
                  ],
                  onPressedAddCard: c.addStaff,
                  onPressedCancel: c.cancelStaff,
                  stringText: 'أضف كادر',
                  title: 'اضافة كادر',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
