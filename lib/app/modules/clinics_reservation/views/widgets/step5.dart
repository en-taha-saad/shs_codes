// ignore_for_file: must_be_immutable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';

// const list = [
//   "5:30   مساءاً",
//   "5:45   مساءا",
//   "6:00   مساءا",
//   "6:15   مساءا",
//   "6:"
//       "30   مساءا",
//   "6:45   مساءا"
// ];
// const availList = [true, false, false, true, false, true];

class Step5 extends StatelessWidget {
  int? character = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                stringText: "يجب الحضور قبل 10 دقائق من الموعد و موعد المراجعة"
                    " الفعلي قد يتأخر تبعاً لظروف العيادة",
                fontSize: 17,
                height: 1.7,
              ),
              SizedBox(
                height: 10,
              ),
              textWidget(
                  stringText: "التوقيتات المتاحة",
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              SingleChildScrollView(
                child: GetBuilder(builder: (ClinicsReservationController cx) {
                  // return Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 150,
                  //   padding: EdgeInsets.only(left: 20),
                  //   // height: 150,
                  //   child: FormBuilderRadioGroup<String>(
                  //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //     onChanged: (String? val) {
                  //       character = c.availableDates.indexOf(val!);
                  //       print(character);
                  //     },
                  //     initialValue: c.availableDates[character!],
                  //     // disabled: [
                  //     //   "5:45   مساءا",
                  //     //   "6:00   مساءا",
                  //     //   "6:"
                  //     //       "30   مساءا"
                  //     // ],
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       errorStyle: style(
                  //         fontSize: 12,
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //     orientation: OptionsOrientation.vertical,
                  //     wrapSpacing: 100,
                  //     name: 'times',
                  //     autovalidateMode: AutovalidateMode.onUserInteraction,
                  //     validator: FormBuilderValidators.required(
                  //       context,
                  //     ),
                  //     options: c.availableDates.map(
                  //       (String selection) {
                  //         return FormBuilderFieldOption(
                  //           value: selection,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               textWidget(
                  //                   stringText: selection,
                  //                   fontSize: 17,
                  //                   // color: availList[c.availableDates.indexOf(selection)]
                  //                   //     ? Colors.black
                  //                   //     : Colors.grey
                  //                 ),
                  //               // textWidget(stringText: priceList[list.indexOf(selection)],
                  //               //     fontSize: 17),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     ).toList(),
                  //     controlAffinity: ControlAffinity.leading,
                  //   ),
                  // );
                  return Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: DropdownSearch<GetDataModel?>(
                      items: cx.listOfDates,
                      // focusNode: FocusNode(skipTraversal: true),
                      selectedItem: cx.selectedDate,
                      onChanged: cx.onChangedSelectedDates,
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
                          errorText: "يرجى تحديد وقت الحجز"
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
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
