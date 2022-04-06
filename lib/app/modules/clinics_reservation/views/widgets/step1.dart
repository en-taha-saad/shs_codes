
// ignore_for_file: must_be_immutable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';

class Step1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder(
          builder: (ClinicsReservationController c) {
            return Column(
              children: [
                Row(
                  children: [
                     Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                      child: FormBuilderRadioGroup<String>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: c.onChangedReservationRadio,
                        initialValue: c.reservationRadioList[c.character],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorStyle: style(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                        orientation: OptionsOrientation.vertical,
                        wrapSpacing: 100,
                        name: 'reserve_type',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(
                          context,
                        ),
                        options: c.reservationRadioList.map(
                              (String selection) {
                            return FormBuilderFieldOption(
                              value: selection,
                              child: textWidget(stringText: selection,
                                  fontSize: 17),
                            );
                          },
                        ).toList(),
                        controlAffinity: ControlAffinity.leading,
                      ),
                    ),
                SizedBox(width: 15,),
                c.character == 1?
                  Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  child: GetBuilder(
                    builder: (ClinicsReservationController cx) {
                      return DropdownSearch<GetDataModel?>(
                        items: cx.relatedList,
                        selectedItem: cx.selectedRelated,
                        onChanged: c.onChangedSelectedRelated,
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
                        validator: FormBuilderValidators.required(
                          context,
                          errorText: "يرجى تحديد فرد العائلة"
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        mode: Mode.MENU,
                        showClearButton: true,
                        emptyBuilder: (_, item) {
                          return Center(
                            child: textWidget(
                              stringText: "لا يوجد $item",
                              fontSize: 20,
                            ),
                          );
                        },
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
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              child: Center(
                                child: textWidget(
                                  stringText: model?.name ?? '',
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
                      );
                    }
                  ),
                ):Container(),
              ],
            ),
          ],
        );
      }),
    ));
  }
}
