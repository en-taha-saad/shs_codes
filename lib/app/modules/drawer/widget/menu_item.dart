import 'package:flutter/material.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

Widget menuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
  String? route,
Color? tileColor,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    tileColor: tileColor,
    title: textWidget(stringText: text, color: Colors.white,fontSize: 20),
    hoverColor: Colors.white70,
    onTap: onClicked,

  );
}
