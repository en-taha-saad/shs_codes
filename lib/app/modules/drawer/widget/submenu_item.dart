import 'package:flutter/material.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

Widget subMenuItem({
  required String text,
  VoidCallback? onClicked,
  String? route,
  Color? tileColor,
}) {
  return ListTile(
    tileColor: tileColor,
    title: textWidget(stringText: text, color: Colors.white,fontSize: 20),
    hoverColor: Colors.white70,
    onTap: onClicked,

  );
}
