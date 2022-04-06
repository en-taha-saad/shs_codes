import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/widgets/step1.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/widgets'
    '/step3.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/widgets'
    '/step2.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/widgets'
    '/step4.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/widgets/step5.dart';

import 'widgets/step4.dart';

class ClinicsReservationView extends GetView<ClinicsReservationController> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BottomTheme(
        child: GetBuilder<ClinicsReservationController>(
        builder: (c) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FormBuilder(
              key: c.formKeyReservation,
              child: FAStepper(
                titleIconArrange: FAStepperTitleIconArrange.row,
                hasPin:false,
                // controller1: c.scrollController,
                // onStepTapped: (index) => c.onStepTapped(index),
                type: FAStepperType.vertical,
                onStepBackBackgroundColor: c.backgroundColor2,
                onStepConBackgroundColor: c.backgroundColor,
                steps: [
                  FAStep(
                    title: textWidget(
                      stringText: 'تحديد المرجع',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: c.currentstep == 0,
                    state: c.stepsState[0],
                    content: Step1(),
                  ),
                 FAStep(
                    title: textWidget(
                      stringText: 'إختر الطبيب',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: c.currentstep == 1,
                    state: c.stepsState[1],
                    content: Step2(),
                  ),
                 FAStep(
                    title: textWidget(
                      stringText: 'إختر الخدمة',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: c.currentstep == 2,
                    state: c.stepsState[2],
                    content: Step3(),
                  ),
                 FAStep(
                    title: textWidget(
                      stringText: 'تحديد التاريخ',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: c.currentstep == 3,
                    state: c.stepsState[3],
                    content: Step4(),
                  ),
                  FAStep(
                    title: textWidget(
                      stringText: 'حدد الوقت',
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: c.currentstep == 4,
                    state: c.stepsState[4],
                    content: Step5(),
                  ),
                ],
                currentStep: c.currentstep,
                onStepTapped: null,
                onStepContinue: c.onStepContinue,
                onStepCancel: c.onStepback,
              ),
            ),
          );
        }),
        ),
      ),
    );
  }
}

