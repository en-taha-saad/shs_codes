import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/reuseable_textfield.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';

class Step0EditScreen extends StatelessWidget {
  const Step0EditScreen({
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
            stringText: 'رقم التسجيل',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              initialValue:
                  c.registrationNo ?? doctorProfile?.registrationNo ?? '',
              onChanged: c.registrationNoChanged,
              name: 'register_num',
              hintText: 'يرجى ادخال رقم التسجيل',
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value == '') {
                  return 'يرجى ادخال رقم التسجيل';
                }
                if (value.length < 8) {
                  return 'رقم التسجيل لا يقل عن 8 حروف';
                }
                return null;
              },
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: textWidget(
            stringText: 'اسم المستخدم',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return CustomTextField(
              initialValue: c.userName ?? 'aya_munadhil',
              onChanged: c.userNameChanged,
              name: 'user_name',
              hintText: 'يرجى ادخال اسم المستخدم',
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.text,
            );
          },
        ),

        /// submit
        GetBuilder(
          builder: (EditDoctorScreenController c) {
            return c.saveChangesStep0();
          },
        ),
      ],
    );
  }
}
