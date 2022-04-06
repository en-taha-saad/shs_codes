import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

void deletedNotiSnackbar = Get.snackbar(
  '',
  '',
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.green,
  colorText: Colors.white,
  titleText: Center(
    child: textWidget(
      stringText: 'تم الحذف بنجاح',
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  messageText: Container(),
  padding: EdgeInsets.all(20),
  snackStyle: SnackStyle.FLOATING,
  duration: Duration(seconds: 3),
  dismissDirection: SnackDismissDirection.VERTICAL,
  // dismissDirection: DismissDirection.vertical,

  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
  borderRadius: 20,
);
