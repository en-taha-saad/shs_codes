import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step1.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step2.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step3.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step4.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step5.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step6.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step7.dart';
import 'package:shs108private/app/modules/Institutions_signup/widgets/step8.dart';

import '../controllers/institutions_signup_controller.dart';

class InstitutionsSignupView extends GetView<InstitutionsSignupController> {
  List<String> stepat = [
    'المعلومات الاساسية',
    'عنوان العيادة او المركز او المجمع',
    'اوقات دوام العيادة او المركز او المجمع',
    'كادر العيادة او المركز او المجمع',
    'اعدادات الحجوزات',
    'اجورالعيادة او المركز او المجمع',
    'قائمة التفضيلات',
    'مراجعة المعلومات',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            leading: TextButton(
                onPressed: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                )),
            flexibleSpace: HeaderTheme(),
            centerTitle: true,
            title: Center(
              child: Container(
                // child: Row(
                //   children: <Widget>[
                //     textWidget(
                //       stringText: 'إنشاء حساب جديد',
                //       color: Colors.black,
                //       fontSize: 20,
                //     ),
                //     Spacer(),
                //     Row(
                //       children: [
                //         textWidget(
                //           stringText: 'لديك حساب بالفعل',
                //           fontSize: 12,
                //           color: Colors.black,
                //         ),
                //         TextButton(
                //           style: ButtonStyle(
                //             foregroundColor:
                //                 MaterialStateProperty.all(Colors.blue),
                //           ),
                //           child: textWidget(
                //             stringText: 'تسجيل الدخول',
                //             fontSize: 12,
                //           ),
                //           onPressed: () {
                //             Get.toNamed(Routes.SIGNIN);
                //           },
                //         )
                //       ],
                //     ),
                //   ],
                //   crossAxisAlignment: CrossAxisAlignment.center,
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    textWidget(
                        stringText: "إنشاء حساب مؤسسة",
                        color: Colors.black,
                        fontSize: 20),
                    SizedBox(
                      width: 130,
                    )
                  ],
                ),
              ),
            ),
          ),
          body: BottomTheme(
            child: GetBuilder<InstitutionsSignupController>(
              init: InstitutionsSignupController(),
              builder: (InstitutionsSignupController c) {
                return FormBuilder(
                  key: c.formKeyInistitution,
                  child: FAStepper(
                    titleIconArrange: FAStepperTitleIconArrange.row,
                    controller1: c.scrollController,
                    titlesTexts: stepat,
                    onStepTapped: (index) => c.onStepTapped(index),
                    type: FAStepperType.horizontal,
                    steps: [
                      FAStep(
                        title: textWidget(
                          stringText: stepat[0],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 0,
                        state: c.stepsState[0],
                        content: Step1(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[1],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 1,
                        state: c.stepsState[1],
                        content: Step2(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[2],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 2,
                        state: c.stepsState[2],
                        content: Step3(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[3],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 3,
                        state: c.stepsState[3],
                        content: Step4(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[4],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 4,
                        state: c.stepsState[4],
                        content: Step5(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[5],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 5,
                        state: c.stepsState[5],
                        content: Step6(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[6],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 6,
                        state: c.stepsState[6],
                        content: Step7(),
                      ),
                      FAStep(
                        title: textWidget(
                          stringText: stepat[7],
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        isActive: c.currentstep == 7,
                        state: c.stepsState[7],
                        content: Step8(),
                      ),
                    ],
                    currentStep: c.currentstep,
                    onStepContinue: c.onStepContinue,
                    onStepCancel: c.onStepCancel,
                    onStepBackBackgroundColor: c.onStepBackBackgroundColor,
                    onStepConBackgroundColor: c.onStepConBackgroundColor,
                    onStepPin: () {
                      c.onStepPin();
                      c.alertBar("تم التثبيت بنجاح",
                          color: Colors.indigo.withOpacity(0.5));
                    },
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
