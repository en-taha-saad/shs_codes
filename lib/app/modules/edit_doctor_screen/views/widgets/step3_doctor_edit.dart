// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

class Step3EditScreen extends StatelessWidget {
  const Step3EditScreen({
    Key? key,
    required this.doctorProfile,
  }) : super(key: key);

  final DoctorProfile? doctorProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          child: textWidget(
            stringText: 'وصف الخبرة بالعربي',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              controller: c.arabicDoctorDescriptionController,
              neededSuffixIcon: c.arabicDoctorDescriptionDeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorDescription1,
              onChanged: c.arabicDoctorDescriptionChanged,
              name: 'arabic_description',
              width: SizeConfig().widthSize(
                context,
                85,
              ),
              height: 150,
              hintText: 'يرجى ادخال وصف عربي للخبرات',
              maxLength: 1000,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.multiline,
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: textWidget(
            stringText: 'وصف الخبرة بالانكليزي',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              controller: c.englishDoctorDescriptionController,
              neededSuffixIcon: c.englishDoctorDescriptionDeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorDescription2,
              onChanged: c.englishDoctorDescriptionChanged,
              name: 'english_description',
              width: SizeConfig().widthSize(
                context,
                85,
              ),
              height: 150,
              hintText: 'يرجى ادخال وصف انكليزي للخبرات',
              maxLength: 1000,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.multiline,
            );
          },
        ),

        /// submit
        GetBuilder(builder: (EditDoctorScreenController c) {
          return c.saveChangesStep3();
        }),
      ],
    );
  }
}
