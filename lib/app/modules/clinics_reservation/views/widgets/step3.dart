// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';

// const list = ["مراجعة عامة", "مراجعة بدون إنتظار", "فحص إيكو"];
// const priceList = [
//   "75 الف دينار عراقي",
//   "75 الف دينار عراقي",
//   "30 الف دينار "
//       "عراقي"
// ];

class Step3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: textWidget(
                      stringText: "الخدمات",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: textWidget(
                      stringText: "الاجور",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
            GetBuilder(
              builder: (ClinicsReservationController c) {
                return c.oneStaffServiceNames.isNotEmpty?
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  // height: 150,
                  child: FormBuilderRadioGroup<String>(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (String? val) {
                      c.selectedService = c.oneStaffServiceNames.indexOf(val!);
                    },
                    initialValue: c.selectedService!=null?c
                        .oneStaffServiceNames[c.selectedService!]:null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorStyle: style(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                    orientation: OptionsOrientation.vertical,
                    wrapSpacing: 100,
                    name: 'doctor',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(
                      context,
                    ),
                    options: c.oneStaffServiceNames.map(
                      (selection) {
                        return FormBuilderFieldOption(
                          value: selection,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width : MediaQuery.of(context).size.width/3,
                                child: textWidget(
                                  stringText: selection,
                                  fontSize: 17
                                )
                              ),
                              Container(
                                margin: EdgeInsets.all(0),
                                alignment:Alignment.centerLeft,
                                width : MediaQuery.of(context).size.width/3,
                                child: textWidget(
                                  stringText: c.oneStaffServicePrices[c
                                      .oneStaffServiceNames.indexOf
                                    (selection)].toString(),
                                  fontSize: 17
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                    controlAffinity: ControlAffinity.leading,
                  ),
                ):Container();
              }
            ),
          ],
        ),
      ),
    );
  }
}
