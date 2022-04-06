// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class BarCard extends StatelessWidget {
  BarCard({
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
      height: 150,
      color: Colors.red,
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
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage(
                      image!,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: textWidget(stringText: title!, color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
