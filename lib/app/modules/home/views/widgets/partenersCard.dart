// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class CardTextOnly extends StatelessWidget {
  CardTextOnly({
    Key? key,
    @required this.title,
    @required this.image,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? image;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // textWidget(
          //   stringText: title,
          //   fontSize: 32,
          //   fontWeight: FontWeight.bold,
          //   color: generalColor,
          // ),
          Column(
            children: [
              Image.asset(
                image!,
                height: 100,
                fit: BoxFit.cover,
              ),
              textWidget(stringText: title!)
            ],
          ),
        ],
      ),
    );
  }
}
