import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

Widget numberField({@required TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.only(right: 2.0, left: 2.0),
    child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            border: Border.all(width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
            borderRadius: BorderRadius.circular(4.0)),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          enabled: false,
          controller: controller,
          autofocus: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.0, color: Colors.black),
        )),
  );
}

Widget numberButton({@required String? text, @required Callback? onpressed}) {
  return MaterialButton(
    onPressed: onpressed,
    child: Text(text!,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center),
  );
}
