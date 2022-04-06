// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class CardWithImage extends StatelessWidget {
  CardWithImage({
    Key? key,
    @required this.title,
    @required this.content,
    @required this.image,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? content;
  final String? image;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            // ignore: avoid_as
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Container(
              height: 550,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      height: 250,
                      color: Colors.blueGrey[50],
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          textWidget(
                            stringText: title,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: generalColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textWidget(
                            stringText: content,
                            fontSize: 15,
                          ),
                        ],
                      )),
                  Container(
                      height: 100,
                      color: Colors.blueGrey[50],
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                              width: 150,
                              height: 60,
                              color: generalColor,
                              child: TextButton(
                                  onPressed: onPressed,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textWidget(
                                        stringText: "اقرأ المزيد",
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
