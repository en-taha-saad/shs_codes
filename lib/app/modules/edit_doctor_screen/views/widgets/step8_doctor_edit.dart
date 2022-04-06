// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

// ignore: must_be_immutable
class Step8EditScreen extends StatefulWidget {
  final DropDownType? e;
  Step8EditScreen({Key? key, this.e}) : super(key: key);

  @override
  State<Step8EditScreen> createState() => _Step8EditScreenState();
}

class _Step8EditScreenState extends State<Step8EditScreen> {
  DropDownType? treatment;
  ButtonState stateTextWithIcon6 = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (EditDoctorScreenController c) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(25.7),
              ),
              child: Column(
                children: [
                  /// treatment
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: textWidget(
                          stringText: 'العلاج',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      GetBuilder(
                        builder: (EditDoctorScreenController c) {
                          return CustomTextField(
                            height: 60,
                            width: SizeConfig().widthSize(context, 50),
                            onChanged: (val) {
                              treatment = val;
                              setState(() {});
                            },
                            initialValue: treatment?.name ?? '${widget.e}',
                            name: 'treatment${widget.e?.id}',
                            hintText: 'يرجى ادخال العلاج',
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.number,
                          );
                        },
                      ),
                    ],
                  ),

                  /// submit
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ProgressButton.icon(
                        iconedButtons: {
                          ButtonState.idle: IconedButton(
                            text: "حفظ التغييرات",
                            icon: Icon(Icons.save, color: Colors.white),
                            color: generalColor,
                          ),
                          ButtonState.loading: IconedButton(
                            text: "إنتظار",
                            color: generalColor,
                          ),
                          ButtonState.fail: IconedButton(
                            text: "فشل",
                            icon: Icon(Icons.cancel, color: Colors.white),
                            color: Colors.red.shade300,
                          ),
                          ButtonState.success: IconedButton(
                            text: "نجاح",
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            color: Colors.green.shade400,
                          ),
                        },
                        maxWidth: 160.0,
                        progressIndicator: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                        minWidth: 50.0,
                        height: 39.0,
                        radius: 15.0,
                        progressIndicatorSize: 25.0,
                        textStyle: style(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          switch (stateTextWithIcon6) {
                            case ButtonState.idle:
                              stateTextWithIcon6 = ButtonState.loading;
                              setState(() {});
                              c.request(
                                url: '$url/treatments/${widget.e?.id}',
                                requestType: 'PUT',
                                map: {
                                  'name': treatment != null
                                      ? '${treatment?.name}'
                                      : '${widget.e}',
                                },
                              ).then((value) {
                                if (!value.toString().contains('success')) {
                                  print('success');
                                  print('value = $value');
                                  Get.snackbar(
                                    '',
                                    '',
                                    snackPosition: SnackPosition.TOP,
                                    titleText: Center(
                                      child: textWidget(
                                        stringText: 'Success',
                                        fontSize: 21,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    messageText: Center(
                                      child: textWidget(
                                        stringText:
                                            ' تم تحديث العلاج ${(c.treatmentsList?.indexOf(widget.e!))! + 1}',
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor:
                                        Colors.green.withOpacity(0.7),
                                    duration: Duration(seconds: 3),
                                    margin: EdgeInsets.all(15),
                                    borderRadius: 10,
                                  );
                                  stateTextWithIcon6 = ButtonState.success;
                                  setState(() {});
                                } else {
                                  stateTextWithIcon6 = ButtonState.fail;
                                  setState(() {});
                                }
                                print('e.id = ${widget.e?.id}');
                              });
                              break;
                            case ButtonState.loading:
                              break;
                            case ButtonState.fail:
                              stateTextWithIcon6 = ButtonState.idle;
                              setState(() {});
                              break;
                            case ButtonState.success:
                              stateTextWithIcon6 = ButtonState.idle;
                              setState(() {});
                              break;
                          }
                        },
                        state: stateTextWithIcon6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 40,
              top: 13,
              child: Container(
                width: 130,
                alignment: Alignment.center,
                child: textWidget(
                  stringText:
                      'العلاج ${(c.treatmentsList?.indexOf(widget.e!))! + 1}',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 30,
              top: 7,
              child: Container(
                width: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: GetBuilder(
                    builder: (EditDoctorScreenController c) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(1),
                          ),
                        ),
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 35,
                        ),
                        onPressed: () => c.deleteTreatment(widget.e!),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
