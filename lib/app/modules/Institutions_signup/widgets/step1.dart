import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
// import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:
            // Container(),
            Column(
          children: [
            //#region صورة المؤسسة

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: textWidget(
                  stringText: 'اختيار صورة المؤسسة',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder(
                  builder: (InstitutionsSignupController c) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 40,
                          color: generalColor,
                          icon: Icon(Icons.photo_camera),
                          onPressed: c.onPressedCameraAvatar,
                        ),
                        IconButton(
                          iconSize: 40,
                          icon: Icon(Icons.photo),
                          color: generalColor,
                          onPressed: c.onPressedGalleryAvatar,
                        )
                      ],
                    );
                  },
                ),
                GetBuilder(
                  builder: (InstitutionsSignupController cx) {
                    return cx.imageAvatar != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(
                              File(
                                cx.imageAvatar!,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            child: SvgPicture.asset(
                              'assets/general_for_two_apps/icons/hospital-1066.svg',
                              width: 85,
                              height: 85,
                              fit: BoxFit.fill,
                              color: generalColor,
                            ),
                          );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //#endregion

            //#region فئة المؤسسة الصحية
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'فئة المؤسسة\nالصحية',
                      fontSize: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*", color: Colors.red, fontSize: 28),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      // height: SizeConfig().heightSize(context, 9),
                      height: 70,
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
                        itemAsString: (u) {
                          return (u?.name).toString();
                        },
                        items: c.categoryItemsMap,
                        onChanged: c.onChangedSelectedCategory,
                        selectedItem: c.selectedCategory,
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
              builder: (InstitutionsSignupController cx) {
                return cx.selectedOtherCategory == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomDialogTextFieldTextContainer(
                            stringText: '',
                          ),
                          CustomDialogTextField(
                            width: SizeConfig().widthSize(context, 64),
                            onChanged: (val) => {
                              cx.onChangedOtherSelectedCategory(val),
                            },
                            initialValue: cx.otherTextCategory,
                            hintText: 'ادخال فئة اخرى',
                            keyboardType: TextInputType.text,
                            name: 'other_category',
                            autovalidateMode: cx.selectedOtherCategory == true
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            validator: cx.selectedOtherCategory == true
                                ? FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      context,
                                      errorText: textfieldErrorText,
                                    ),
                                    FormBuilderValidators.match(
                                      context,
                                      '^[\u0621-\u064A\040 ]+\$',
                                      errorText: 'يسمح بحروف عربية ومسافة فقط',
                                    ),
                                    FormBuilderValidators.maxLength(
                                      context,
                                      100,
                                      errorText:
                                          'يجب ان لا يزيد الإسم عن 100 حرف',
                                    )
                                  ])
                                : null,
                          )
                        ],
                      )
                    : Container();
              },
            ),
            //#endregion

            //#region اسم المؤسسة
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'اسم المؤسسة',
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*", color: Colors.red, fontSize: 28),
                      alignment: Alignment.topLeft,
                    ),
                    CustomDialogTextField(
                      width: SizeConfig().widthSize(context, 64),
                      height: 70,
                      hintText: 'اسم المؤسسة',
                      initialValue: c.institutionName,
                      name: 'institutions_name',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.maxLength(
                          context,
                          100,
                          errorText: 'يجب ان لا يزيد الإسم عن 100 حرف',
                        ),
                        FormBuilderValidators.match(
                          context,
                          '^[\u0621-\u064A ]+\$',
                          errorText: 'يسمح بحروف عربية ومسافة فقط',
                        ),
                      ]),
                      onChanged: c.onChangedInstitutionName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                );
              },
            ),
            //#endregion

            //#region المالك
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: c.listOfOwnerNames.map(
                    (owner) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              stringText: 'دكتور',
                            ),
                            textWidget(
                              stringText: '$owner',
                            ),
                            Container(
                              width: 30,
                              height: 50,
                              child: TextButton(
                                  onPressed: () => c.removeOwner(
                                      c.listOfOwnerNames.indexOf(owner)),
                                  child: Container(
                                    child: Icon(Icons.delete_forever,
                                        color: Colors.red),
                                    alignment: Alignment.center,
                                    width: 100,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  )),
                            ),
                          ],
                        ),
                      );
                      // return ShowListWidget(
                      //   height: SizeConfig().heightSize(context, 10),
                      //   children2: null,
                      //   onPressedEditCard: () =>
                      //       c.editOwner(owner),
                      //   onPressedCancel: c.cancelOwner,
                      //   children3: [
                      //     ///
                      //     CustomDialogTextFieldTextContainer(
                      //       stringText: 'المالك',
                      //     ),
                      //     CustomDialogTextField(
                      //       controller: c.ownerController,
                      //       // hintText: owner.name != ''
                      //       //     ? owner.name
                      //       //     : 'اسم المالك',
                      //       keyboardType: TextInputType.text,
                      //       name: '',
                      //     ),
                      //   ],
                      //   stringText: 'اسم المالك ${owner}',
                      //   title: 'التعديل على المالك',
                      //   onPressedRemove: () =>
                      //       c.removeOwner(owner),
                      // );
                    },
                  ).toList(),
                );
              },
            ),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return (cx.isCheckedId[0] == 1)
                    ? Container()
                    : GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  stringText: 'المالك',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20, left: 40),
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
                                    CustomDialogTextField(
                                      maxLength: 13,
                                      width:
                                          SizeConfig().widthSize(context, 40),
                                      height: 80,
                                      hintText: 'الرقم الشخصي للمالك',
                                      initialValue: c.ownerController,
                                      name: 'owner_name',
                                      validator: FormBuilderValidators.compose([
                                        // FormBuilderValidators.required(
                                        //   context,
                                        //   errorText: textfieldErrorText,
                                        // ),
                                        FormBuilderValidators.maxLength(
                                          context,
                                          13,
                                          errorText:
                                              'يجب ان لا يزيد الإسم عن 13 حرف',
                                        ),
                                        // FormBuilderValidators.minLength(
                                        //   context,
                                        //   13,
                                        //   errorText: 'يجب ان لا يقل الإسم عن 13 حرف',
                                        // ),
                                        FormBuilderValidators.match(
                                          context,
                                          '^[A-Za-z0-9]*\$',
                                          errorText:
                                              'يسمح بحروف انجليزية وارقام فقط',
                                        ),
                                        (string) {
                                          if (c.ownerError != '') {
                                            return c.ownerError;
                                          }
                                        },
                                        (string) {
                                          if (c.ownerError == '' &&
                                              c.ownerController.length == 13) {
                                            return "اضغط تحقق للإضافة";
                                          }
                                        }
                                      ]),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: c.onChangedOwnerController,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 25),
                                      width:
                                          SizeConfig().widthSize(context, 20),
                                      color: Colors.white,
                                      height: 56,
                                      child: c.isCheckedId[0] == 0
                                          ? TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  Colors.green.shade500
                                                      .withOpacity(0.7),
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.all(10),
                                                ),
                                              ),
                                              onPressed: () => c.checkOwner(0),
                                              child: textWidget(
                                                stringText: "تحقق",
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            )
                                          : c.isCheckedId[0] == 1
                                              ? Container()
                                              : Container(
                                                  height: 10,
                                                  width: 10,
                                                  padding: EdgeInsets.all(10),
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                    ],
                                                  )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig().widthSize(context, 17),
                ),
                GetBuilder(
                  builder: (InstitutionsSignupController c) {
                    return AddCardWidgetWithoutDialog(
                      height: SizeConfig().heightSize(context, 10),
                      onPressedAddCard: c.openOwnerText,
                      stringText: 'أضف مالك جديد',
                    );
                  },
                ),
              ],
            ),
            //#endregion

            //#region رقم التسجيل
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'رقم التسجيل\nفي النقابة ',
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*", color: Colors.red, fontSize: 28),
                      alignment: Alignment.topLeft,
                    ),
                    CustomDialogTextField(
                      width: SizeConfig().widthSize(context, 64),
                      height: 70,
                      hintText: 'رقم التسجيل في النقابة',
                      initialValue: c.registrationNumber,
                      name: 'registration_number',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.maxLength(
                          context,
                          100,
                          errorText: 'يجب ان لا يزيد الإسم عن 100 حرف',
                        ),
                        FormBuilderValidators.match(
                          context,
                          '^[A-Za-z0-9]*\$',
                          errorText: 'يسمح بحروف انجليزية وارقام فقط',
                        ),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: c.onChangedRegistrationNumber,
                    ),
                  ],
                );
              },
            ),
            //#endregion

            //#region الاختصاص
            GetBuilder(builder: (InstitutionsSignupController c) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDialogTextFieldTextContainer(
                    stringText: 'إختصاصات\nالعيادة',
                    fontSize: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: textWidget(
                        stringText: "*", color: Colors.red, fontSize: 28),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    width: SizeConfig().widthSize(context, 64),
                    height: SizeConfig().heightSize(context, 9),
                    child: MultiSelectDropDownFormField(
                      onChange: c.onChangedMedicalSpecialist,
                      onFind: (filter) => c.onFindSpecialist(filter),
                      selectedItems: c.selectedMedicalSpecialist,
                    ),
                  ),
                ],
              );
            }),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: c.listOfSpecialists
                      .where((element) => element.other != null)
                      .map(
                    (specialist) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              stringText: 'إختصاص مضاف : ',
                            ),
                            textWidget(
                              stringText: '${specialist.other}',
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () =>
                                          c.editSpecialist(specialist),
                                      child: Container(
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.green.shade500,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () =>
                                          c.removeSpecialist(specialist),
                                      child: Container(
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return cx.specialistSelectedOther
                    ? GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  stringText: 'اختصاص جديد',
                                ),
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 50),
                                      hintText: 'أدخل اختصاص آخر',
                                      initialValue: c.specialistController,
                                      name: 'other_specialist',
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.maxLength(
                                          context,
                                          100,
                                          errorText:
                                              'يجب ان لا يزيد الإسم عن 100 حرف',
                                        ),
                                      ]),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged:
                                          c.onChangedSpecialistController,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, left: 0),
                                        width:
                                            SizeConfig().widthSize(context, 13),
                                        height: 50,
                                        child: TextButton(
                                            onPressed: () =>
                                                c.addOrEditSpecialist(),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: generalColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Icon(
                                                Icons.check,
                                                color: generalColor,
                                                size: 30,
                                              ),
                                            ))),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                    : Container();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig().widthSize(context, 17),
                ),
                GetBuilder(
                  builder: (InstitutionsSignupController c) {
                    return AddCardWidgetWithoutDialog(
                      height: SizeConfig().heightSize(context, 10),
                      onPressedAddCard: c.openSpecialistText,
                      stringText: 'أضف إختصاص جديد',
                    );
                  },
                ),
              ],
            ),
            //#endregion

            //#region الخدمات
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: c.listOfServices.map(
                    (service) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              stringText: 'خدمة مضافة : ',
                            ),
                            textWidget(
                              stringText: '${service.name}',
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () => c.editService(service),
                                      child: Container(
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.green.shade500,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () => c.removeService(service),
                                      child: Container(
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return cx.serviceSelectedOther
                    ? GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  stringText: 'خدمة علاجية\n جديدة',
                                ),
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 50),
                                      hintText: 'أدخل خدمة آخرى',
                                      initialValue: c.serviceController,
                                      name: 'service_name',
                                      validator: FormBuilderValidators.compose([
                                        // FormBuilderValidators.required(
                                        //   context,
                                        //   errorText: textfieldErrorText,
                                        // ),
                                        FormBuilderValidators.maxLength(
                                          context,
                                          100,
                                          errorText:
                                              'يجب ان لا يزيد الإسم عن 100 حرف',
                                        ),
                                      ]),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: c.onChangedServiceController,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, left: 0),
                                        width:
                                            SizeConfig().widthSize(context, 13),
                                        height: 50,
                                        child: TextButton(
                                            // style: ButtonStyle(
                                            //   backgroundColor: MaterialStateProperty.all(
                                            //     Colors.green.shade500,
                                            //   ),
                                            //   padding: MaterialStateProperty.all(
                                            //     EdgeInsets.all(10),
                                            //   ),
                                            // ),
                                            onPressed: () =>
                                                c.addOrEditService(),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: generalColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Icon(
                                                Icons.check,
                                                color: generalColor,
                                                size: 30,
                                              ),
                                            ))),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                    : Container();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig().widthSize(context, 17),
                ),
                GetBuilder(
                  builder: (InstitutionsSignupController c) {
                    return AddCardWidgetWithoutDialog(
                      height: SizeConfig().heightSize(context, 10),
                      onPressedAddCard: c.openServiceText,
                      stringText: 'خدمة علاجية جديدة',
                    );
                  },
                ),
              ],
            ),
            //#endregion

            //#region هاتف الاستفسار
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: c.listOfPhones.map(
                    (phone) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 2),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              stringText: 'هاتف مضاف : ',
                            ),
                            textWidget(
                              stringText: '${phone.phone}',
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () => c.editPhone(phone),
                                      child: Container(
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.green.shade500,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 20,
                                  height: 50,
                                  child: TextButton(
                                      onPressed: () => c.removePhone(phone),
                                      child: Container(
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return cx.phoneSelectedOther
                    ? GetBuilder(
                        builder: (InstitutionsSignupController c) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomDialogTextFieldTextContainer(
                                  fontSize: 15,
                                  stringText: 'هاتف \nالأستفسار',
                                ),
                              ),
                              Container(
                                width: SizeConfig().widthSize(context, 64),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomDialogTextField(
                                      width:
                                          SizeConfig().widthSize(context, 50),
                                      height: 80,
                                      hintText: 'أدخل رقم الهاتف',
                                      initialValue: c.phoneController,
                                      name: 'Phone_name',
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      validator: c.phoneController != ''
                                          ? FormBuilderValidators.compose([
                                              FormBuilderValidators.integer(
                                                context,
                                                errorText:
                                                    'يرجى إدخال ارقام فقط',
                                              ),
                                              FormBuilderValidators.maxLength(
                                                context,
                                                10,
                                                errorText:
                                                    'يجب ان لا يزيد الرقم عن 10 رقم',
                                              ),
                                              (string) {
                                                if (c.phoneError != '') {
                                                  return c.phoneError;
                                                }
                                              }
                                            ])
                                          : null,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: c.onChangedPhoneController,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 30, left: 0),
                                        width:
                                            SizeConfig().widthSize(context, 13),
                                        height: 50,
                                        child: TextButton(
                                            // style: ButtonStyle(
                                            //   backgroundColor: MaterialStateProperty.all(
                                            //     Colors.green.shade500,
                                            //   ),
                                            //   padding: MaterialStateProperty.all(
                                            //     EdgeInsets.all(10),
                                            //   ),
                                            // ),
                                            onPressed: () => c.addOrEditPhone(),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: generalColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Icon(
                                                Icons.check,
                                                color: generalColor,
                                                size: 30,
                                              ),
                                            ))),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )
                    : Container();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig().widthSize(context, 17),
                ),
                GetBuilder(
                  builder: (InstitutionsSignupController c) {
                    return AddCardWidgetWithoutDialog(
                      height: SizeConfig().heightSize(context, 10),
                      onPressedAddCard: c.openPhoneText,
                      stringText: 'هاتف استفسار جديد',
                    );
                  },
                ),
              ],
            ),
            //#endregion
          ],
        ),
      ),
    );
  }
}
