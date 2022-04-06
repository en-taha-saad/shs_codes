import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/help_floating.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

Widget ambulanceFloating() {
  return Stack(
    children: <Widget>[
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.7), BlendMode.dstATop),
              image: AssetImage(
                ambulanceIMG,
              ),
            ),
          ),
          child: FloatingActionButton.extended(
            heroTag: "btn1",
            backgroundColor: Colors.white.withOpacity(0),
            label: textWidget(
              stringText: 'طلب اسعاف فوري',
              color: Colors.white,
              fontSize: 17,
            ),
            onPressed: () {},
          ),
        ),
      ),
      Align(
        alignment: Alignment(0.9, 1),
        child: Container(
          child: HelpButton(),
        ),
      ),
    ],
  );
}
