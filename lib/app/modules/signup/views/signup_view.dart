import 'dart:convert';
import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/modules/signup/widgets/signup_appbar.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/modules/signup/widgets/step1.dart';
import 'package:shs108private/app/modules/signup/widgets/step2.dart';
import 'package:shs108private/app/modules/signup/widgets/step3.dart';
import 'package:shs108private/app/modules/signup/widgets/step4.dart';
import 'package:shs108private/app/modules/signup/widgets/step5.dart';
import 'package:shs108private/app/modules/signup/widgets/step6.dart';
import 'package:shs108private/app/modules/signup/widgets/step7.dart';

class SignupView extends StatefulWidget {
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  FAStepstate step0State = FAStepstate.editing;

  FAStepstate step1State = FAStepstate.editing;

  FAStepstate step2State = FAStepstate.editing;

  FAStepstate step3State = FAStepstate.editing;

  FAStepstate step4State = FAStepstate.editing;

  FAStepstate step5State = FAStepstate.editing;

  FAStepstate step6State = FAStepstate.editing;

  var registerButtonColor = Colors.blue;

  var onStepConBackgroundColor = MaterialStateProperty.all(Colors.blue);

  var onStepBackBackgroundColor = MaterialStateProperty.all(Colors.grey);

  bool? success;

  String text = '';

  ButtonState stateTextWithIcon = ButtonState.idle;

  String? image;

  Future httpPost() async {
    try {
      setState(() => text = '');
      Map<String, dynamic> json = {
        "doctor": {"registration_no": "124456a", "username": "usernddme1"},
        "phones": [
          {"phone": "+9641234567890"},
          {"phone": "+9641234567800"}
        ],
        "emails": [
          {"email": "doctor@doctor.com"},
          {"email": "doctor2@doctor.com"}
        ],
        "doctor_titles": [
          {"other": "درجة غير معرفة"},
          {"id": 2}
        ],
        "doctor_description": [
          {"language_code": "ar", "experiences": "الخبرة بالعربي"},
          {"language_code": "en", "descriptions": "experience in english"}
        ],
        "setting": {
          "show_email": 0,
          "show_phone": 0,
          "show_messages": 0,
          "show_recommendations": 0,
          "show_ratings": 1
        },
        "training_programs": [
          {
            "name": "عنوان التدريب",
            "from": "مقدم من الجهة الفلانية",
            "date": "2020-01-01",
            "country_id": 106,
            "duration": "3 days"
          },
          {
            "name": "عنوان التدريب الثاني",
            "from": "مقدم من الجهة الفلانية",
            "date": "2020-01-01",
            "country_id": 100,
            "duration": "3 days"
          }
        ],
        "memberships": [
          {"other": "درجة غير معرفة"},
          {"other": "درجة غير معرفة"},
          {"id": 2}
        ],
        "doctor_certificates": [
          {
            "other_certificate": "شهادة اخرى",
            "other_university": "من جامعة اخرى",
            "graduation_year": 2000
          },
          {"certificate_id": 2, "university_id": 2, "graduation_year": 2005},
          {"certificate_id": 2, "university_id": 3, "graduation_year": 2010}
        ],
        "treatments": [
          {"name": "علاج اربعة"},
          {"name": "علاج ثلاثة"}
        ],
        "medical_specialties": [
          {"id": 2}
        ]
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$url/register_doctor',
        ),
      );
      request.fields.addAll({'json': jsonEncode(json)});

      ///
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', image!),
        );
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('121212121212121');

        setState(() {
          success = true;
        });
      } else {
        success = false;

        setState(() {});
      }
    } on SocketException {
      setState(() {
        success = false;
      });
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      setState(() {
        success = false;
      });
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      setState(() {
        success = false;
      });
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        print('success7 value is $success');
        if (success == true) {
          print('success8 value is $success');

          setState(() {
            stateTextWithIcon = ButtonState.success;
          });
          if (stateTextWithIcon == ButtonState.success) {}
        } else {
          setState(() {
            stateTextWithIcon = ButtonState.fail;
          });
        }
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }

  Widget buildTextWithIcon() {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
          text: "تسجيل",
          icon: Icon(Icons.send, color: Colors.white),
          color: registerButtonColor,
        ),
        ButtonState.loading: IconedButton(
          text: "إنتظار",
          color: registerButtonColor,
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
      maxWidth: 110.0,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: Colors.white,
        strokeWidth: 1,
      ),
      minWidth: 50.0,
      height: 39.0,
      radius: 5.0,
      progressIndicatorSize: 25.0,
      textStyle: style(
        fontSize: 15,
        color: Colors.white,
      ),
      onPressed: () {
        registerButtonColor = Colors.blue;
        stateTextWithIcon = ButtonState.loading;
        httpPost().then((value) {
          stateTextWithIcon = ButtonState.idle;
          onPressedIconWithText();
        });
        setState(() {});
      },
      state: stateTextWithIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: SignUpAppBar(),
            title: Center(
              child: textWidget(
                stringText: 'إنشاء حساب طبيب ',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            // title: Container(
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       textWidget(
            //         stringText: 'إنشاء حساب طبيب',
            //         color: Colors.black,
            //         fontSize: 25,
            //       ),
            //       // Row(
            //       //   children: [
            //       //     textWidget(
            //       //       stringText: 'لديك حساب بالفعل',
            //       //       fontSize: 12,
            //       //       color: Colors.black,
            //       //     ),
            //       //     TextButton(
            //       //       style: ButtonStyle(
            //       //         foregroundColor:
            //       //             MaterialStateProperty.all(Colors.blue),
            //       //       ),
            //       //       child: textWidget(
            //       //         stringText: 'تسجيل الدخول',
            //       //         fontSize: 12,
            //       //       ),
            //       //       onPressed: () {
            //       //         Get.toNamed(Routes.SIGNIN);
            //       //       },
            //       //     )
            //       //   ],
            //       // ),
            //     ],
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //   ),
            // ),
          ),
          body: BottomTheme(
            child: GetBuilder(
              builder: (SignUpController c) {
                return FormBuilder(
                  key: c.formKey,
                  child: FAStepper(
                    titleIconArrange: FAStepperTitleIconArrange.row,
                    controller1: c.scrollController,
                    // onStepTapped: (index) => c.onStepTapped(index),
                    type: FAStepperType.horizontal,
                    steps: [
                      FAStep(
                        title: textWidget(
                          stringText: 'المعلومات الاساسية',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 0,
                        state: step0State,
                        content: Step1(),
                      ),
                      // FAStep(
                      //   title: textWidget(
                      //     stringText: 'المؤسسات الصحية',
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      //   isActive: c.currentstep == 1,
                      //   state: step1State,
                      //   content: Step2(),
                      // ),
                      FAStep(
                        title: textWidget(
                          stringText: 'الخدمات العلاجية',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 1,
                        state: step1State,
                        content: Step2(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: 'وصف للخبرات',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 2,
                        state: step2State,
                        content: Step3(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: 'البرامج التدريبية',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 3,
                        state: step3State,
                        content: Step4(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: 'تحميل صورة',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 4,
                        state: step4State,
                        content: Step5(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: 'اعدادات الخصوصية',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 5,
                        state: step5State,
                        content: Step6(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: 'مراجعة المعلومات',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 6,
                        state: step6State,
                        content: Step7(),
                      ),
                    ],
                    currentStep: c.currentstep,
                    onStepContinue: c.onStepContinue,
                    onStepCancel: c.onStepBack,
                    onStepBackBackgroundColor: onStepBackBackgroundColor,
                    onStepConBackgroundColor: onStepConBackgroundColor,
                    onStepPin: c.onStepPin,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
