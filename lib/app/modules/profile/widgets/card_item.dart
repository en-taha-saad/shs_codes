import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class CardItem extends StatelessWidget {
  final String stringText;
  final IconData? icon;
  final void Function()? onPressed;

  CardItem({
    required this.stringText,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      color: Colors.white,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onPressed,
        child: ListTile(
          leading: Icon(icon, color: generalColor),
          title: textWidget(
            stringText: stringText,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
