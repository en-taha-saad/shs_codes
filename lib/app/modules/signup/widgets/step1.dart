import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     TextButton(
            //       onPressed: () => RestartWidget.restartApp(context),
            //       child: textWidget(stringText: 'ترسيت'),
            //     ),
            //     GetBuilder(
            //       builder: (SignUpController c) {
            //         return TextButton(
            //           onPressed: c.onStepRemove,
            //           child: textWidget(stringText: 'حذف'),
            //         );
            //       },
            //     ),
            //   ],
            // ),

            // #region registration number
            GetBuilder(
              builder: (SignUpController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'رقم التسجيل*',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) {
                        c.changetextInputHeight();
                        c.onChangedRegister(val);
                      },
                      initialValue: c.toPinedJson?.doctor?.registrationNo ??
                          c.registerNum,
                      width: SizeConfig().widthSize(context, 64),
                      height: c.textInputHeight,
                      hintText: 'رقم التسجيل في النقابة',
                      name: 'register_number',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.maxLength(
                          context,
                          25,
                          errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                        ),
                        FormBuilderValidators.minLength(
                          context,
                          6,
                          errorText: 'ان لا يقل عن 6',
                        ),
                        (String? registerNum) {
                          if (registerNum!.isNotEmpty) {
                            print('registerNum = $registerNum');
                            RegExp regExp = RegExp('^[A-Za-z0-9]+\$');
                            if (!regExp.hasMatch(registerNum)) {
                              return ("لا يسمح بحروف عربية ومسافة");
                            }
                          } else {
                            return null;
                          }
                        },
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                );
              },
            ),
            // #endregion

            // #region selected specialization
            SizedBox(height: 10),
            GetBuilder(
              builder: (SignUpController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'الاختصاص*',
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: c.dropDownHeight,
                      child: DropdownSearch<GetDataModel?>(
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
                        onFind: (filter) =>
                            c.onFindSelectedSpecialization(filter),
                        onChanged: c.onChangedSelectedSpecialization,
                        selectedItem: c.selectedSpecilization,
                        popupBarrierColor: Colors.grey.withOpacity(0.5),
                        showAsSuffixIcons: true,
                        showSearchBox: true,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
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
                        dropdownBuilder: (__, GetDataModel? model) {
                          if (model == null) {
                            return Container();
                          }
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model.name,
                                  fontSize: 16,
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
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            hintText: "ابحث هنا",
                            hintStyle: style(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 5),
            GetBuilder(
              builder: (SignUpController cx) {
                // ignore: prefer_is_empty
                return (cx.toPinedJson?.medicalSpecialties?.length != 0
                            ? (cx.toPinedJson?.medicalSpecialties?[0]
                                    ?.selectedOther ==
                                true)
                            : cx.selectedOtherSpecialization == true) ||
                        (cx.selectedOtherSpecialization == true)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomDialogTextFieldTextContainer(
                            stringText: '',
                          ),
                          CustomDialogTextField(
                            width: SizeConfig().widthSize(context, 64),
                            height: SizeConfig().widthSize(context, 13),
                            onChanged: (val) =>
                                cx.onChangedOtherSelectedSpecialization(val),
                            initialValue:
                                // ignore: prefer_is_empty
                                cx.toPinedJson?.medicalSpecialties?.length != 0
                                    ? (cx.toPinedJson?.medicalSpecialties?[0]
                                            ?.other) ??
                                        (cx.toPinedJson?.medicalSpecialties?[0]
                                            ?.name)
                                    : (cx.selectedSpecilization?.other) ??
                                        (cx.selectedSpecilization?.other),
                            hintText: 'ادخال اختصاص اخر',
                            keyboardType: TextInputType.text,
                            name: 'other_specialization',
                            autovalidateMode:
                                cx.selectedOtherSpecialization == true
                                    ? AutovalidateMode.onUserInteraction
                                    : null,
                            validator: cx.selectedOtherSpecialization == true
                                ? FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: textfieldErrorText,
                                    ),
                                  ])
                                : null,
                          )
                        ],
                      )
                    : Container();
              },
            ),
            // #endregion

            // #region selected degree
            SizedBox(height: 10),
            GetBuilder(
              builder: (SignUpController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'الدرجة*',
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: 60,
                      child: DropdownSearch<GetDataModel?>(
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
                        onFind: (filter) => c.onFindSelectedDegree(filter),
                        onChanged: c.onChangedSelectedDegree,
                        validator: null,
                        selectedItem: c.selectedDegree,
                        popupBarrierColor: Colors.grey.withOpacity(0.5),
                        showAsSuffixIcons: true,
                        showSearchBox: true,
                        autoValidateMode: AutovalidateMode.disabled,
                        // validator: validator,
                        mode: Mode.DIALOG,
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
                        dropdownBuilder: (__, GetDataModel? model) {
                          if (model == null) {
                            return Container();
                          }
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model.name,
                                  fontSize: 16,
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
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            hintText: "ابحث هنا",
                            hintStyle: style(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 5),
            GetBuilder(
              builder: (SignUpController cx) {
                // ignore: prefer_is_empty
                return (cx.toPinedJson?.doctorTitles?.length != 0
                            ? (cx.toPinedJson?.doctorTitles?[0]
                                    ?.selectedOther ==
                                true)
                            : cx.selectedOtherDegree == true) ||
                        (cx.selectedOtherDegree == true)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomDialogTextFieldTextContainer(
                            stringText: '',
                          ),
                          CustomDialogTextField(
                            width: SizeConfig().widthSize(context, 64),
                            height: SizeConfig().widthSize(context, 13),
                            onChanged: (string) =>
                                cx.onChangedOtherSelectedDegree(string),
                            initialValue:
                                // ignore: prefer_is_empty
                                cx.toPinedJson?.doctorTitles?.length != 0
                                    ? (cx.toPinedJson?.doctorTitles?[0]
                                            ?.other) ??
                                        (cx.toPinedJson?.doctorTitles?[0]?.name)
                                    : (cx.selectedDegree?.other) ??
                                        (cx.selectedDegree?.other),
                            hintText: 'ادخال درجة اخرى',
                            keyboardType: TextInputType.text,
                            name: 'other_degree',
                            validator: null,
                            autovalidateMode: cx.selectedOtherDegree == true
                                ? AutovalidateMode.onUserInteraction
                                : null,
                          )
                        ],
                      )
                    : Container();
              },
            ),
            // #endregion

            // #region add certificates
            SizedBox(height: 30),
            GetBuilder(
              builder: (SignUpController c) {
                return AddCardWidget(
                  height: SizeConfig().heightSize(context, 40),
                  children: [
                    ///
                    CustomDialogTextFieldTextContainer(
                      stringText: 'الشهادة',
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 95),
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: DropdownSearch<GetDataModel?>(
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
                        onFind: (filter) => c.onFindCertificate(filter),
                        onChanged: c.onChangedCertificate,
                        selectedItem: c.certificate,
                        popupBarrierColor: Colors.grey.withOpacity(0.5),
                        showAsSuffixIcons: true,
                        showSearchBox: true,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            context,
                            errorText: textfieldErrorText,
                          ),
                        ]),
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
                        dropdownBuilder: (__, GetDataModel? model) {
                          if (model == null) {
                            return Container();
                          }
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model.name,
                                  fontSize: 16,
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
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            hintText: "ابحث هنا",
                            hintStyle: style(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                    GetBuilder(
                      builder: (SignUpController cx) {
                        return cx.certificateSelectedOther == true
                            ? CustomDialogTextField(
                                width: SizeConfig().widthSize(context, 95),
                                height: 60,
                                onChanged: (val) =>
                                    cx.onChangedOtherCertificate(val),
                                hintText: 'ادخال شهادة اخرى',
                                validator: cx.certificateSelectedOther == true
                                    ? FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          context,
                                          errorText: textfieldErrorText,
                                        ),
                                      ])
                                    : null,
                                keyboardType: TextInputType.text,
                                name: 'other_certificate',
                              )
                            : Container();
                      },
                    ),

                    ///
                    CustomDialogTextFieldTextContainer(
                      stringText: 'الجامعة',
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 95),
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: DropdownSearch<GetDataModel?>(
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
                        onFind: (filter) => c.onFindUniversity(filter),
                        onChanged: c.onChangedUniversity,
                        selectedItem: c.universe,
                        popupBarrierColor: Colors.grey.withOpacity(0.5),
                        showAsSuffixIcons: true,
                        showSearchBox: true,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            context,
                            errorText: textfieldErrorText,
                          ),
                        ]),
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
                        dropdownBuilder: (__, GetDataModel? model) {
                          if (model == null) {
                            return Container();
                          }
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model.name,
                                  fontSize: 16,
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
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            hintText: "ابحث هنا",
                            hintStyle: style(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                    GetBuilder(
                      builder: (SignUpController cx) {
                        return cx.certificateUniversitySelectedOther == true
                            ? CustomDialogTextField(
                                width: SizeConfig().widthSize(context, 95),
                                height: 60,
                                validator:
                                    cx.certificateUniversitySelectedOther ==
                                            true
                                        ? FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                              context,
                                              errorText: textfieldErrorText,
                                            ),
                                          ])
                                        : null,
                                onChanged: (val) =>
                                    cx.onChangedOtherUniversity(val),
                                hintText: 'ادخال جامعة اخرى',
                                keyboardType: TextInputType.text,
                                name: 'other_university',
                              )
                            : Container();
                      },
                    ),

                    ///
                    CustomDialogTextFieldTextContainer(
                      stringText: 'السنة',
                    ),
                    CustomDialogTextField(
                      width: SizeConfig().widthSize(context, 95),
                      height: 60,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.numeric(
                          context,
                          errorText: textfieldErrorText,
                        ),
                      ]),
                      onChanged: (val) => c.onChangedYearGraduate(val),
                      hintText: 'سنة التخرج',
                      keyboardType: TextInputType.number,
                      name: 'graduated_date',
                    ),
                    GetBuilder(
                      builder: (SignUpController c) {
                        return CustomDialogTextFieldTextContainer(
                          // ignore: unnecessary_string_interpolations
                          stringText: '${c.certificateYearError ?? ''}',
                          color: Colors.red,
                          fontSize: 15,
                        );
                      },
                    ),
                  ],
                  onPressedAddCard: c.addCertificate,
                  onPressedCancel: c.cancelCertificate,
                  stringText: 'أضف شهادة جديده',
                  title: 'إضافة شهادة جديدة',
                );
              },
            ),
            GetBuilder(
              builder: (SignUpController cx) {
                return Center(
                  child: textWidget(
                    // ignore: unnecessary_string_interpolations
                    stringText: "${cx.certificateError ?? ''}",
                    color: Colors.red,
                  ),
                );
              },
            ),
            GetBuilder(
              builder: (SignUpController c) {
                return Column(
                  children: c.listOfCertificates.map(
                    (certificate) {
                      return ShowListWidget(
                        height: SizeConfig().heightSize(context, 40),
                        onPressedEditCard: () => c.editCertificate(certificate),
                        onPressedCancel: c.cancelCertificate,
                        children3: [
                          ///
                          CustomDialogTextFieldTextContainer(
                            stringText: 'الشهادة',
                          ),
                          Container(
                            width: SizeConfig().widthSize(context, 95),
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: DropdownSearch<GetDataModel?>(
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
                              onFind: (filter) => c.onFindCertificate(filter),
                              onChanged: c.onChangedCertificateEdit,
                              selectedItem: certificate.certificateInforms,
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
                              dropdownBuilder: (__, GetDataModel? model) {
                                // if (model == null) {
                                //   return Container();
                                // }
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
                                      EdgeInsets.fromLTRB(12, 12, 8, 0),
                                  hintText: "ابحث هنا",
                                  hintStyle: style(),
                                  hintTextDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          GetBuilder(
                            builder: (SignUpController cx) {
                              return certificate.certificateInforms
                                              ?.selectedOther ==
                                          true ||
                                      cx.certificateSelectedOther == true
                                  ? CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 95),
                                      height: 60,
                                      onChanged: (val) =>
                                          cx.onChangedOtherCertificate(val),
                                      initialValue:
                                          certificate.certificateInforms?.other,
                                      hintText: 'ادخال شهادة اخرى',
                                      keyboardType: TextInputType.text,
                                      name: 'other_certificate_edit',
                                    )
                                  : Container();
                            },
                          ),

                          ///
                          CustomDialogTextFieldTextContainer(
                            stringText: 'الجامعة',
                          ),
                          Container(
                            width: SizeConfig().widthSize(context, 95),
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: DropdownSearch<GetDataModel?>(
                              onFind: (filter) => c.onFindUniversity(filter),
                              onChanged: c.onChangedUniversityEdit,
                              selectedItem: certificate.universityInforms,
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
                              popupBarrierColor: Colors.grey.withOpacity(0.5),
                              showAsSuffixIcons: true,
                              showSearchBox: true,
                              autoValidateMode: AutovalidateMode.disabled,
                              // validator: validator,
                              mode: Mode.MENU,
                              showClearButton: true,
                              popupSafeArea:
                                  PopupSafeAreaProps(top: true, bottom: true),
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
                              // searchBoxDecoration: InputDecoration(
                              //   filled: true,
                              //   fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                              // ),
                              dropdownBuilder: (__, GetDataModel? model) {
                                // if (model == null) {
                                //   return Container();
                                // }
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
                              // emptyBuilder: (_, item) {
                              //   return Center(
                              //     child: textWidget(
                              //       stringText: "لا يوجد $item",
                              //       fontSize: 30,
                              //     ),
                              //   );
                              // },
                              searchFieldProps: TextFieldProps(
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 12, 8, 0),
                                  hintText: "ابحث هنا",
                                  hintStyle: style(),
                                  hintTextDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          GetBuilder(
                            builder: (SignUpController cx) {
                              return certificate.universityInforms
                                              ?.selectedOther ==
                                          true ||
                                      cx.certificateUniversitySelectedOther ==
                                          true
                                  ? CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 95),
                                      height: 60,
                                      onChanged: (val) =>
                                          cx.onChangedOtherUniversity(val),
                                      initialValue:
                                          certificate.universityInforms?.other,
                                      hintText: 'ادخال جامعة اخرى',
                                      keyboardType: TextInputType.text,
                                      name: 'other_university_edit',
                                    )
                                  : Container();
                            },
                          ),

                          ///
                          CustomDialogTextFieldTextContainer(
                            stringText: 'السنة',
                          ),
                          CustomDialogTextField(
                            width: SizeConfig().widthSize(context, 95),
                            height: 60,
                            onChanged: (val) => c.onChangedYearGraduate(val),
                            initialValue: certificate.graduationYear,
                            hintText: 'سنة التخرج',
                            keyboardType: TextInputType.number,
                            name: '',
                          ),
                          GetBuilder(
                            builder: (SignUpController c) {
                              return CustomDialogTextFieldTextContainer(
                                // ignore: unnecessary_string_interpolations
                                stringText: '${c.certificateYearError ?? ''}',
                                color: Colors.red,
                                fontSize: 15,
                              );
                            },
                          ),
                        ],
                        children2: [
                          SizedBox(height: 10),
                          textWidget(
                            stringText:
                                // ignore: prefer_if_null_operators
                                'اسم الجامعة / المؤسسة : ${certificate.universityInforms?.other != null ? certificate.universityInforms?.other : certificate.universityInforms?.name ?? ''} ',
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          textWidget(
                            stringText:
                                'سنة التخرج : ${certificate.graduationYear ?? ''}',
                            fontSize: 20,
                          ),
                          SizedBox(height: 20),
                        ],
                        stringText:
                            // ignore: prefer_if_null_operators
                            ' اسم الشهادة : ${certificate.certificateInforms?.other != null ? certificate.certificateInforms?.other : certificate.certificateInforms?.name ?? ''}',
                        title: 'التعديل على شهادة',
                        onPressedRemove: () => c.removeCertificate(certificate),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            // #endregion

            // #region add memberships
            SizedBox(height: 30),
            GetBuilder(
              builder: (SignUpController c) {
                return AddCardWidget(
                  height: SizeConfig().heightSize(context, 22),
                  children: [
                    ///
                    CustomDialogTextFieldTextContainer(
                      stringText: 'العضوية',
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 95),
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: DropdownSearch<GetDataModel?>(
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
                        onFind: (filter) => c.onFindMembership(filter),
                        onChanged: c.onChangedMembership,
                        selectedItem: c.member,
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
                        dropdownBuilder: (__, GetDataModel? model) {
                          if (model == null) {
                            return Container();
                          }
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model.name,
                                  fontSize: 16,
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
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                            hintText: "ابحث هنا",
                            hintStyle: style(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                    GetBuilder(
                      builder: (SignUpController cx) {
                        return cx.membershipSelectedOther == true
                            ? CustomDialogTextField(
                                width: SizeConfig().widthSize(context, 95),
                                height: 60,
                                onChanged: (val) =>
                                    cx.onChangedOtherMembership(val),
                                hintText: 'ادخال عضوية اخرى',
                                keyboardType: TextInputType.text,
                                name: 'other_membership',
                              )
                            : Container();
                      },
                    ),
                  ],
                  onPressedAddCard: c.addMembership,
                  onPressedCancel: c.cancelMembership,
                  stringText: 'أضف عضوية جديده',
                  title: 'إضافة عضوية جديدة',
                );
              },
            ),
            GetBuilder(
              builder: (SignUpController cx) {
                return Center(
                  child: textWidget(
                    // ignore: unnecessary_string_interpolations
                    stringText: "${cx.membershipError ?? ''}",
                    color: Colors.red,
                  ),
                );
              },
            ),
            GetBuilder(
              builder: (SignUpController c) {
                return Column(
                  children: c.listOfmemberships.map(
                    (membership) {
                      return ShowListWidget(
                        height: SizeConfig().heightSize(context, 22),
                        children2: null,
                        onPressedEditCard: () => c.editMembership(membership),
                        onPressedCancel: c.cancelMembership,
                        children3: [
                          ///
                          CustomDialogTextFieldTextContainer(
                            stringText: 'العضوية',
                          ),
                          Container(
                            width: SizeConfig().widthSize(context, 95),
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: DropdownSearch<GetDataModel?>(
                              onFind: (filter) => c.onFindMembership(filter),
                              onChanged: c.onChangedMembershipEdit,
                              selectedItem: membership.organizationsMemberships,
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
                              popupBarrierColor: Colors.grey.withOpacity(0.5),
                              showAsSuffixIcons: true,
                              showSearchBox: true,
                              autoValidateMode: AutovalidateMode.disabled,
                              mode: Mode.MENU,
                              showClearButton: true,
                              popupSafeArea:
                                  PopupSafeAreaProps(top: true, bottom: true),
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
                              dropdownBuilder: (__, GetDataModel? model) {
                                // if (model == null) {
                                //   return Container();
                                // }
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
                                      EdgeInsets.fromLTRB(12, 12, 8, 0),
                                  hintText: "ابحث هنا",
                                  hintStyle: style(),
                                  hintTextDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                          ),
                          GetBuilder(
                            builder: (SignUpController cx) {
                              // ignore: unrelated_type_equality_checks
                              return membership.organizationsMemberships
                                              ?.selectedOther ==
                                          true ||
                                      cx.membershipSelectedOther == true
                                  ? CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 95),
                                      height: 60,
                                      onChanged: (val) =>
                                          cx.onChangedOtherMembership(val),
                                      initialValue: membership
                                          .organizationsMemberships?.other,
                                      hintText: 'ادخال جامعة اخرى',
                                      keyboardType: TextInputType.text,
                                      name: 'other_membership_edit',
                                    )
                                  : Container();
                            },
                          ),
                        ],
                        stringText:
                            // ignore: prefer_if_null_operators
                            ' اسم العضوية : ${membership.organizationsMemberships?.other != null ? membership.organizationsMemberships?.other : membership.organizationsMemberships?.name ?? ''}',
                        title: 'التعديل على عضوية',
                        onPressedRemove: () => c.removeMembership(membership),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            // #endregion
          ],
        ),
      ),
    );
  }
}
