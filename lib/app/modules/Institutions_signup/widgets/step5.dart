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
// import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
// import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: [
                    ...c.listOfCheckboxes.map(c.settingsCheckboxes).toList(),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: textWidget(stringText: "تاريخ اطلاق الحجوزات",fontSize:
              18,fontWeight: FontWeight.bold),
            ),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDialogTextFieldTextContainer(
                        stringText: 'الحجوزات الالكترونية',
                        fontSize: 15,),
                      Container(
                        width: SizeConfig().widthSize(context, 50),
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
                          onChanged: c.onChangedSelectedEReservation,
                          selectedItem:
                          // (c.toPinedJson?.medicalSpecialties != null)
                          //     ? (c.toPinedJson?.medicalSpecialties)
                          //     :
                          c.listOfCheckboxes[1].value!?c
                              .selectedEReservation:null,
                          enabled: c.listOfCheckboxes[1].value!,
                          items: c.reservationItemsMap,
                          itemAsString: (u) {
                            return (u?.name).toString();
                          },
                          popupBarrierColor: Colors.grey.withOpacity(0.5),
                          showAsSuffixIcons: true,
                          showSearchBox: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: c.listOfCheckboxes[1].value! ?
                          FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: dropdownErrorText,
                            ),
                          ]):null,
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
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDialogTextFieldTextContainer(
                        stringText: 'الحجوزات بالهاتف',
                        fontSize: 15,),
                      Container(
                        width: SizeConfig().widthSize(context, 50),
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
                          onChanged: c.onChangedSelectedPhoneReservation,
                          selectedItem:
                          // (c.toPinedJson?.medicalSpecialties != null)
                          //     ? (c.toPinedJson?.medicalSpecialties)
                          //     :
                          c.listOfCheckboxes[2].value!?c
                              .selectedPhoneReservation:null,
                          enabled: c.listOfCheckboxes[2].value!,
                          items: c.reservationItemsMap,
                          itemAsString: (u) {
                            return (u?.name).toString();
                          },
                          popupBarrierColor: Colors.grey.withOpacity(0.5),
                          showAsSuffixIcons: true,
                          showSearchBox: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: c.listOfCheckboxes[2].value! ?
                          FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: dropdownErrorText,
                            ),
                          ]):null,
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
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDialogTextFieldTextContainer(
                        stringText: 'الحجوزات المسبقة \nبالحضور',
                        fontSize: 15,),
                      Container(
                        width: SizeConfig().widthSize(context, 50),
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
                          onChanged: c.onChangedSelectedOnPresenceReservation,
                          selectedItem: c.listOfCheckboxes[3].value!?c
                              .selectedOnPresenceReservation:null,
                          enabled: c.listOfCheckboxes[3].value!,
                          items: c.reservationItemsMap,
                          itemAsString: (u) {
                            return (u?.name).toString();
                          },
                          popupBarrierColor: Colors.grey.withOpacity(0.5),
                          showAsSuffixIcons: true,
                          showSearchBox: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: c.listOfCheckboxes[3].value!?
                          FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: dropdownErrorText,
                            ),
                          ]):null,
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
                  ),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
