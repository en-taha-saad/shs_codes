import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

appbar({String? appBarTitle, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white.withOpacity(0),
    elevation: 0,

    iconTheme: IconThemeData(color: Colors.black),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textWidget(
          stringText: appBarTitle,
          fontSize: 25,
        ),
        Image.asset(
          logo1IMG,
          width: 65,
          height: 65,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

