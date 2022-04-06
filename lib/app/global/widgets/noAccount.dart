// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/routes/app_pages.dart';

Widget noAccount() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          stringText: 'يرجى تسجيل الدخول اولا',
          fontSize: 30,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_IN);
              },
              child:
                  textWidget(stringText: 'تسجيل الدخول', color: generalColor),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_UP);
              },
              child: textWidget(stringText: 'تسجيل', color: generalColor),
            ),
          ],
        ),
      ],
    ),
  );
}
