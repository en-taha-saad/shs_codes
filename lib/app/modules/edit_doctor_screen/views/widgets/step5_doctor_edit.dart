import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

class Step5EditScreen extends StatelessWidget {
  const Step5EditScreen({
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
            stringText: 'البريد الالكتروني الاول',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              neededSuffixIcon: c.doctorEmail1DeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorEmail1,
              controller: c.doctorEmail1Controller,
              onChanged: c.doctoremail1Changed,
              name: 'doctor_email1',
              hintText: 'يرجى إدخال البريد الالكتروني الاول',
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
            );
          },
        ),

        Container(
          margin: EdgeInsets.only(top: 0),
          child: textWidget(
            stringText: 'البريد الالكتروني الثاني',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              neededSuffixIcon: c.doctorEmail2DeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorEmail2,
              controller: c.doctorEmail2Controller,
              onChanged: c.doctoremail2Changed,
              name: 'doctor_email2',
              hintText: 'يرجى إدخال البريد الالكتروني الثاني',
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
            );
          },
        ),

        /// submit
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.saveChangesStep5();
          },
        ),
      ],
    );
  }
}
