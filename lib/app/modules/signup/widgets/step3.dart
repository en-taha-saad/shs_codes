import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';

class Step3 extends StatelessWidget {
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
          GetBuilder(
            builder: (SignUpController c) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 250,
                width: 400,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: FormBuilderTextField(
                    onChanged: (val) => c.onChangedArabicExperiences(val),
                    initialValue: c.toPinedJson?.doctorDescription != null
                        ? (c.toPinedJson?.doctorDescription?[0].experiences ??
                            c.arabicExperiences)
                        : c.arabicExperiences,
                    name: 'arabicExperiences',
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    maxLength: 1000,
                    showCursor: true,
                    style: style(fontSize: 20),
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
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusColor: Colors.white,
                      labelText: 'وصف لخبراتك بالعربي',
                      labelStyle: style(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      contentPadding: EdgeInsets.all(25),
                      fillColor: Colors.grey.shade200,
                      filled: true,
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
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController c) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 250,
                width: 400,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: FormBuilderTextField(
                    onChanged: (val) => c.onChangedEnglishExperiences(val),
                    initialValue: c.toPinedJson?.doctorDescription != null
                        ? (c.toPinedJson?.doctorDescription?[1].descriptions ??
                            c.englishExperiences)
                        : c.englishExperiences,
                    name: 'englishExperiences',
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    maxLength: 1000,
                    showCursor: true,
                    style: style(fontSize: 20),
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
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusColor: Colors.white,
                      labelText: 'Experience Decription in English',
                      labelStyle: style(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      contentPadding: EdgeInsets.all(25),
                      fillColor: Colors.grey.shade200,
                      filled: true,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
