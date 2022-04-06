import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step2 extends StatelessWidget {
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

          // #region add specilizations
          SizedBox(height: 30),
          GetBuilder(
            builder: (SignUpController c) {
              return AddCardWidget(
                height: SizeConfig().heightSize(context, 10),
                children: [
                  ///
                  CustomDialogTextFieldTextContainer(
                    stringText: 'الخدمات العلاجية',
                  ),
                  CustomDialogTextField(
                    width: SizeConfig().widthSize(context, 95),
                    height: 60,
                    onChanged: (val) => c.onChangedTreatment(val),
                    hintText: 'الخدمة العلاجية',
                    keyboardType: TextInputType.text,
                    name: 'treatment',
                  ),
                ],
                onPressedAddCard: c.addSpecialization,
                onPressedCancel: c.cancelSpecialization,
                stringText: 'أضف خدمة علاجية جديدة',
                title: 'اضافة خدمة علاجية جديدة',
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController cx) {
              return Center(
                child: textWidget(
                  // ignore: unnecessary_string_interpolations
                  stringText: "${cx.treatmentError ?? ''}",
                  color: Colors.red,
                ),
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController c) {
              return Column(
                children: c.listOfTreatments.map(
                  (specialization) {
                    return ShowListWidget(
                      height: SizeConfig().heightSize(context, 10),
                      children2: null,
                      onPressedEditCard: () =>
                          c.editSpecialization(specialization),
                      onPressedCancel: c.cancelSpecialization,
                      children3: [
                        ///
                        CustomDialogTextFieldTextContainer(
                          stringText: 'الخدمة العلاجية',
                        ),
                        CustomDialogTextField(
                          width: SizeConfig().widthSize(context, 95),
                          height: 60,
                          onChanged: (val) => c.onChangedTreatment(val),
                          initialValue: specialization.name,
                          hintText: 'الخدمة العلاجية',
                          keyboardType: TextInputType.text,
                          name: '',
                        ),
                      ],
                      stringText:
                          'اسم الخدمة العلاجية : ${specialization.name}',
                      title: 'التعديل على الخدمة العلاجية',
                      onPressedRemove: () =>
                          c.removeSpecialization(specialization),
                    );
                  },
                ).toList(),
              );
            },
          ),
          // #endregion
        ],
      ),
    );
  }
}
