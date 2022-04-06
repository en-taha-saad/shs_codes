import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

class Step4EditScreen extends StatelessWidget {
  const Step4EditScreen({
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
            stringText: 'رقم الهاتف الأول',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              neededSuffixIcon: c.doctorPhone1DeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorPhone1,
              controller: c.doctorPhone1Controller,
              onChanged: c.doctorphone1Changed,
              name: 'doctor_phone1',
              hintText: 'يرجى إدخال رقم الهاتف الاول',
              validator: (value) {
                if (value == '') {
                  return '';
                } else {
                  if (value?.length != 11) {
                    return 'لا يقل ولا يزيد رقم الهاتف عن 11 رقم';
                  }
                  if (value?.startsWith('0') != true) {
                    return 'يجب ان يبدأ الرقم ب 0';
                  }
                }
                return '';
              },
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.phone,
            );
          },
        ),

        Container(
          margin: EdgeInsets.only(top: 0),
          child: textWidget(
            stringText: 'رقم الهاتف الثاني',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              neededSuffixIcon: c.doctorPhone2DeleteOrNot,
              onPressedSuffixIcon: c.deleteDoctorPhone2,
              controller: c.doctorPhone2Controller,
              onChanged: c.doctorphone2Changed,
              keyboardType: TextInputType.phone,
              name: 'doctor_phone2',
              hintText: 'يرجى إدخال رقم الهاتف الثاني',
              validator: (value) {
                if (value != null) {
                  if (value.length != 11) {
                    return 'لا يقل ولا يزيد رقم الهاتف عن 11 رقم';
                  }
                  if (value.startsWith('0') != true) {
                    return 'يجب ان يبدأ الرقم ب 0';
                  }
                }
                return null;
              },
              textDirection: TextDirection.ltr,
            );
          },
        ),

        /// submit
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.saveChangesStep4();
          },
        ),
      ],
    );
  }
}
