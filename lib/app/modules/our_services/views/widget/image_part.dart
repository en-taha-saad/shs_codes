import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

Widget imagePart(int index,BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 150,
    child: Stack(
      children: <Widget>[
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              expandableImages[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          width: 370,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: textWidget(
              stringText: expandableServicesItems[index],
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        )
      ],
    ),
  );
}
