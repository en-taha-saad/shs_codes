import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_card_widget.dart';

class Step4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     TextButton(
          //       onPressed: () => RestartWidget.restartApp(context),
          //       child: textWidget(stringText: 'ترسيت'),
          //     ),
          //     GetBuilder<SignUpController>(
          //       builder: (c) {
          //         return TextButton(
          //           onPressed: c.onStepRemove,
          //           child: textWidget(stringText: 'حذف'),
          //         );
          //       },
          //     ),
          //   ],
          // ),

          ///add training programs
          SizedBox(height: 30),
          GetBuilder(
            builder: (SignUpController c) {
              return AddCardWidget(
                height: SizeConfig().heightSize(context, 40),
                children: [
                  CustomDialogTextFieldTextContainer(
                    stringText: 'البرنامج التدريبي',
                  ),
                  CustomDialogTextField(
                    width: SizeConfig().widthSize(context, 95),
                    height: 60,
                    onChanged: (val) => c.onChangedtrainingName(val),
                    hintText: 'اسم البرنامج التدريبي',
                    name: 'trainingName',
                  ),

                  ///
                  CustomDialogTextFieldTextContainer(
                    stringText: 'الجهة',
                  ),
                  CustomDialogTextField(
                    width: SizeConfig().widthSize(context, 95),
                    height: 60,
                    onChanged: (val) => c.onChangedorganization(val),
                    hintText: 'اسم المؤسسة المستضيفة للبرنامج',
                    name: 'organization',
                  ),

                  ///
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        TextButton(
                          child: SvgPicture.asset(
                            'assets/general_for_two_apps/icons/date.svg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.fill,
                            color: generalColor,
                          ),
                          onPressed: () {
                            Get.defaultDialog(
                              title: "تاريخ الميلاد",
                              titleStyle: style(fontSize: 25),
                              backgroundColor: Colors.white,
                              barrierDismissible: false,
                              titlePadding: EdgeInsets.all(10),
                              contentPadding: EdgeInsets.all(20),
                              content: Container(
                                height: 250,
                                width: 270,
                                child: CupertinoDatePicker(
                                  onDateTimeChanged: c.onDateTimeChanged,
                                  maximumYear: DateTime.now().year,
                                  dateOrder: DatePickerDateOrder.dmy,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: textWidget(
                                    stringText: "الغاء",
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                  onPressed: c.cancelDate,
                                ),
                                TextButton(
                                  child: textWidget(
                                    stringText: "تأكيد",
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                  onPressed: c.confirmDate,
                                )
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        GetBuilder(
                          builder: (SignUpController c) {
                            return textWidget(
                              // ignore: unnecessary_string_interpolations
                              stringText: '${c.trainingDate ?? ''}',
                              fontSize: 20,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  ///
                  CustomDialogTextFieldTextContainer(
                    stringText: 'الدولة',
                  ),
                  Container(
                    width: SizeConfig().widthSize(context, 95),
                    height: 60,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: DropdownSearch<CountryModel?>(
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        errorStyle: style(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        isDense: false,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxHeight: 500,
                      onFind: (filter) => c.onFindCountry(filter),
                      onChanged: c.onChangedCountry,
                      selectedItem: c.trainingCountry,
                      popupBarrierColor: Colors.grey.withOpacity(0.5),
                      showAsSuffixIcons: true,
                      showSearchBox: true,
                      autoValidateMode: AutovalidateMode.disabled,
                      mode: Mode.MENU,
                      showClearButton: true,
                      popupSafeArea: PopupSafeAreaProps(
                        top: true,
                        bottom: true,
                      ),
                      clearButtonSplashRadius: 20,
                      popupItemBuilder: (__, model, _) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: textWidget(
                                stringText: model?.name ?? '',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      },
                      dropdownBuilder: (__, CountryModel? model) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            child: Center(
                              child: textWidget(
                                stringText: model?.name ?? '',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                      searchFieldProps: TextFieldProps(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                          hintText: "ابحث هنا",
                          hintStyle: style(),
                          hintTextDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),

                  ///
                  CustomDialogTextFieldTextContainer(
                    stringText: 'مدة البرنامج',
                  ),
                  CustomDialogTextField(
                    width: SizeConfig().widthSize(context, 95),
                    height: 60,
                    onChanged: (val) => c.onChangedtrainingDuration(val),
                    hintText: 'المدة ساعات / ايام',
                    keyboardType: TextInputType.text,
                    name: 'trainingDuration',
                  ),
                ],
                onPressedAddCard: c.addProgram,
                onPressedCancel: c.cancelProgram,
                stringText: 'إضافة برنامج جديد',
                title: 'إضافة برنامج جديد',
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController cx) {
              return Center(
                child: textWidget(
                  // ignore: unnecessary_string_interpolations
                  stringText: "${cx.trainingProgramError ?? ''}",
                  color: Colors.red,
                ),
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController c) {
              return Column(
                children: c.listOfTrainingPrograms.map((training) {
                  return ShowListWidget(
                    height: SizeConfig().heightSize(context, 55),
                    onPressedEditCard: () => c.editProgram(training),
                    onPressedCancel: c.cancelProgram,
                    children3: [
                      ///
                      CustomDialogTextFieldTextContainer(
                        stringText: 'البرنامج التدريبي',
                      ),
                      CustomDialogTextField(
                        onChanged: (val) => c.onChangedtrainingName(val),
                        initialValue: training.name,
                        height: 60,
                        hintText: 'اسم البرنامج التدريبي',
                        name: 'trainingName_edit',
                      ),

                      ///
                      CustomDialogTextFieldTextContainer(
                        stringText: 'الجهة',
                      ),
                      CustomDialogTextField(
                        onChanged: (val) => c.onChangedorganization(val),
                        height: 60,
                        initialValue: training.organization,
                        hintText: 'اسم المؤسسة المستضيفة للبرنامج',
                        name: '',
                      ),

                      ///
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              child: SvgPicture.asset(
                                'assets/general_for_two_apps/icons/date.svg',
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                                color: generalColor,
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "تاريخ الميلاد",
                                  titleStyle: style(fontSize: 25),
                                  backgroundColor: Colors.white,
                                  barrierDismissible: false,
                                  titlePadding: EdgeInsets.all(10),
                                  contentPadding: EdgeInsets.all(20),
                                  content: Container(
                                    height: 250,
                                    width: 270,
                                    child: CupertinoDatePicker(
                                      onDateTimeChanged: c.onDateTimeChanged,
                                      maximumYear: DateTime.now().year,
                                      dateOrder: DatePickerDateOrder.dmy,
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: textWidget(
                                        stringText: "الغاء",
                                        fontSize: 20,
                                        color: Colors.blue,
                                      ),
                                      onPressed: c.cancelDate,
                                    ),
                                    TextButton(
                                      child: textWidget(
                                        stringText: "تأكيد",
                                        fontSize: 20,
                                        color: Colors.blue,
                                      ),
                                      onPressed: c.confirmDate,
                                    )
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: training.date,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),

                      ///
                      CustomDialogTextFieldTextContainer(
                        stringText: 'الدولة',
                      ),
                      Container(
                        width: SizeConfig().widthSize(context, 95),
                        height: 60,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: DropdownSearch<CountryModel?>(
                          dropdownSearchDecoration: InputDecoration(
                            filled: true,
                            errorStyle: style(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            isDense: false,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          maxHeight: 500,
                          onFind: (filter) => c.onFindCountry(filter),
                          onChanged: c.onChangedCountry,
                          selectedItem: training.country,
                          popupBarrierColor: Colors.grey.withOpacity(0.5),
                          showAsSuffixIcons: true,
                          showSearchBox: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          mode: Mode.MENU,
                          showClearButton: true,
                          popupSafeArea: PopupSafeAreaProps(
                            top: true,
                            bottom: true,
                          ),
                          clearButtonSplashRadius: 20,
                          popupItemBuilder: (__, model, _) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: textWidget(
                                    stringText: model?.name ?? '',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          },
                          dropdownBuilder: (__, CountryModel? model) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                child: Center(
                                  child: textWidget(
                                    stringText: model?.name ??
                                        training.country?.name ??
                                        '',
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            );
                          },
                          searchFieldProps: TextFieldProps(
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                              hintText: "ابحث هنا",
                              hintStyle: style(),
                              hintTextDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),

                      ///
                      CustomDialogTextFieldTextContainer(
                        stringText: 'مدة البرنامج',
                      ),
                      CustomDialogTextField(
                        onChanged: (val) => c.onChangedtrainingDuration(val),
                        height: 60,
                        initialValue: training.duration,
                        hintText: 'المدة ساعات / ايام',
                        keyboardType: TextInputType.number,
                        name: '',
                      ),
                    ],
                    children2: [
                      SizedBox(height: 10),
                      textWidget(
                        stringText: 'الجهة : ${training.organization ?? ''} ',
                        fontSize: 20,
                      ),
                      SizedBox(height: 10),
                      textWidget(
                        stringText: 'التاريخ : ${training.date ?? ''} ',
                        fontSize: 20,
                      ),
                      SizedBox(height: 10),
                      textWidget(
                        stringText:
                            'الدولة : ${training.country?.name ?? c.trainingCountry?.name ?? ''} ',
                        fontSize: 20,
                      ),
                      SizedBox(height: 10),
                      textWidget(
                        stringText:
                            'مدة البرنامج : ${training.duration ?? ''} ',
                        fontSize: 20,
                      ),
                      SizedBox(height: 20),
                    ],
                    stringText: ' البرنامج التدريبي : ${training.name ?? ''}',
                    title: 'التعديل على البرنامج',
                    onPressedRemove: () => c.removeProgram(training),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
