// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

Widget closestLocationButtons() {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 10, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 190,
                height: 80,
                // decoration: BoxDecoration(
                //   gradient:new LinearGradient(
                //       colors: [
                //         Color(0xff27b376),
                //         Color(0xff006f3c),
                //       ]
                //   ) ,
                // ),
                color: Colors.green,
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(
                        //   "assets/general_for_two_apps/selectsIcons/closestPharmacy.svg",
                        //   width: 50,
                        //   height: 50,
                        //   color: Colors.white,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        textWidget(
                          stringText: "اقرب صيدلية",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 190,
                height: 80,
                // decoration: BoxDecoration(
                //   gradient:new LinearGradient(
                //       colors: [
                //         Color(0xffff6a6a),
                //         Color(0xffbf212f),
                //       ]
                //   ) ,
                // ),
                color: Colors.red,
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(
                        //   "assets/general_for_two_apps/selectsIcons/closestHospital.svg",
                        //   width: 50,
                        //   height: 50,
                        //   color: Colors.white,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        textWidget(
                          stringText: "اقرب جهة صحية",
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 200,
              height: 180,
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  Image.asset(
                    companiesIMG,
                    height: 180,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textWidget(
                          stringText: "خدمات الضمان",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textWidget(
                              stringText: "الصحي",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            Icon(
                              Icons.health_and_safety_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
