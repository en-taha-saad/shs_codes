
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';



class Step2 extends StatelessWidget {

  int? character = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              // height: 150,
              child: GetBuilder(
                builder: (ClinicsReservationController c) {
                  return c.institutions!=null ?FormBuilderRadioGroup<String>(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // onChanged:
                      //   (String? val){character = list.indexOf(val!);
                      // print
                      // (character);},
                    // initialValue: list[character!],
                    initialValue: c.institutions!.staffsInfo!.map((e) => e
                        .staffInfo!.patientableType!).first,
                    onChanged: c.selectStaff,
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
                      errorText: "يرجى تحديد الطبيب"
                    ),
                    options: c.staffList.map(
                          (String selection) {
                        return FormBuilderFieldOption(
                          value: selection,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: c.staffImageList[c.staffList.indexOf
                                    (selection)]!=''?Image.network(
                                    "$imageUrl/${c.staffImageList[c.staffList
                                        .indexOf(selection)]}",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width/7,
                                    height: MediaQuery.of(context).size.width/7,
                                  ):Image.asset(
                                    defaultAvatarIMG,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width/7,
                                    height: MediaQuery.of(context).size.width/7,
                                  ),
                                ),
                              ),
                              Container(
                                  width:MediaQuery.of(context).size.width/2.5,
                                  child: textWidget(stringText: selection,
                                      fontSize: 17)),

                              //imageList[list.indexOf
                              //                             (selection)]
                            ],
                          ),
                        );
                      },
                    ).toList(),
                    controlAffinity: ControlAffinity.leading,
                  ):Container(
                    child: TextButton(
                      onPressed: c.loadInstitutionInfo,
                      child: textWidget(
                        stringText: "اعد المحاولة"
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
