// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

double divide = 2.3;

class BiomedicalEngineersCard extends StatelessWidget {
  BiomedicalEngineersCard({
    this.doctorName,
    this.specialist,
    this.governorate,
    required this.image,
    this.onPressed,
  });
  final String? doctorName;
  final String? specialist;
  final String? governorate;
  final String? image;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: (5) / divide,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                padding: EdgeInsets.all(2),
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            (MediaQuery.of(context).size.width * 0.5) / divide,
                        width: (MediaQuery.of(context).size.width) / divide,
                        child: Stack(
                          children: <Widget>[
                            image != null
                                // ? Image.network(
                                //     "$imageUrl/$image",
                                //     fit: BoxFit.cover,
                                //     width:
                                //         (MediaQuery.of(context).size.width) /
                                //             divide,
                                //   )
                                ? Image.asset(
                                    image!,
                                    fit: BoxFit.cover,
                                    width: (MediaQuery.of(context).size.width) /
                                        divide,
                                  )
                                : Image.asset(
                                    labPlaceHolderIMG,
                                    fit: BoxFit.cover,
                                    width: (MediaQuery.of(context).size.width) /
                                        divide,
                                  ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black38,
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50.0, horizontal: 20.0),
                                  child: Container()),
                            ),
                          ],
                        )),
                    Container(
                        height:
                            (MediaQuery.of(context).size.width * 0.5) / divide,
                        color: Colors.white,
                        width: (MediaQuery.of(context).size.width) / divide,
                        padding: EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10 / divide,
                            ),
                            textWidget(
                              stringText: doctorName,
                              fontSize: (24) / divide,
                              fontWeight: FontWeight.bold,
                              color: generalColor4,
                            ),
                            SizedBox(
                              height: 10 / divide,
                            ),
                            textWidget(
                              stringText: "$specialist",
                              fontSize: (22) / divide,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10 / divide,
                            ),
                            textWidget(
                              stringText: "$governorate",
                              fontSize: (22) / divide,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                              color: generalColor4,
                              width:
                                  (MediaQuery.of(context).size.width) / divide,
                              height:
                                  (MediaQuery.of(context).size.width * 0.15) /
                                      divide,
                              child: Center(
                                child: TextButton(
                                  child: textWidget(
                                    stringText: "معلومات الصيدلي",
                                    color: Colors.white,
                                    fontSize: (25) / divide,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onPressed: onPressed,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
