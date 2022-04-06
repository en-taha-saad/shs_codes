import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'المحافظة',
                      fontSize: 15,),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*",
                          color: Colors.red,
                          fontSize: 28
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: SizeConfig().heightSize(context, 9),
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
                        onFind: (filter) => c.onFindCity(filter),
                        itemAsString: (u) {
                          return (u?.name).toString();
                        },
                        onChanged: c.onChangedSelectedCity,
                        selectedItem:c.selectedCity,
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
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'المدينة      ',
                      fontSize: 15,),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*",
                          color: Colors.red,
                          fontSize: 28
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: SizeConfig().heightSize(context, 9),
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
                        onFind: (filter) => c.onFindDistrict(filter),
                        itemAsString: (u) {
                          return (u?.name).toString();
                        },
                        onChanged: c.onChangedSelectedDistrict,
                        selectedItem:
                        c.selectedDistrict,
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
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'المنطقة ',
                      fontSize: 15,),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*",
                          color: Colors.red,
                          fontSize: 28
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: SizeConfig().heightSize(context, 9),
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
                        onFind: (filter) => cx.onFindRegion(filter),
                        itemAsString: (u) {
                          return (u?.name).toString();
                        },
                        onChanged: cx.onChangedSelectedRegion,
                        selectedItem:cx.selectedRegion,
                        popupBarrierColor: Colors.grey.withOpacity(0.5),
                        showAsSuffixIcons: true,
                        showSearchBox: true,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: null,
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
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'اقرب نقطة\n دالة',
                      fontSize: 15,),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: SizeConfig().heightSize(context, 16),
                      child:  Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            // height: 250,
                            // width: 400,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: FormBuilderTextField(
                                name: 'closestPoint',
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                maxLength: 100,
                                onChanged: cx.onChangedColsestPoint,
                                showCursor: true,
                                style: style(fontSize: 20,),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.top,
                                buildCounter: (
                                    BuildContext context, {
                                      required int currentLength,
                                      required int? maxLength,
                                      required bool isFocused,
                                    }) {
                                  return textWidget(
                                    stringText: '$currentLength / $maxLength',
                                    fontWeight: FontWeight.w600,
                                  );
                                },
                                initialValue: cx.closestPoint,
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  focusColor: Colors.white,
                                  labelText: 'اقرب نقطة دالة',
                                  labelStyle: style(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: EdgeInsets.all(25),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10,),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDialogTextFieldTextContainer(
                      stringText: 'الاحداثيات',
                      fontSize: 15,),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: textWidget(
                          stringText: "*",
                          color: Colors.red,
                          fontSize: 28
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      width: SizeConfig().widthSize(context, 64),
                      height: SizeConfig().heightSize(context, 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.green.shade500,
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(10),
                          ),
                        ),
                        onPressed: ()=>c.mapDialog(),
                        child: textWidget(
                          stringText: "تحديد الموقع",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10,),
            GetBuilder(
              builder: (InstitutionsSignupController cx) {
                return
                  cx.latitude != null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width:SizeConfig().widthSize(context, 20),),
                      textWidget(stringText: "خط العرض   ${cx.latitude!
                          .toStringAsFixed(6)}"),
                      textWidget(stringText: "خط الطول   ${cx.longitude!
                          .toStringAsFixed(6)}"),
                    ],
                  )
                      : Container();
              },
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
