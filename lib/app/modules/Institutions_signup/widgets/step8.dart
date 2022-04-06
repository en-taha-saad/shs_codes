import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';

class Step8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Stack(
                  children: [
                    SizedBox(height: 270),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                placeholderImageIMG,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 12 - 5,
                      left: 15,
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.height / 6 + 10,
                          height: MediaQuery.of(context).size.height / 6 + 10,
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 12,
                        left: 20,
                        child: ClipOval(
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            width: MediaQuery.of(context).size.height / 6,
                            height: MediaQuery.of(context).size.height / 6,
                            child: c.imageAvatar != null
                                ? Image.file(
                                    File(
                                      c.imageAvatar!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    'assets/general_for_two_apps/icons/hospital-1066.svg',
                                    width: 85,
                                    height: 85,
                                    fit: BoxFit.fill,
                                    color: Colors.grey,
                                  ),
                          ),
                        )),
                  ],
                );
              },
            ),
            GetBuilder(builder: (InstitutionsSignupController c) {
              return Column(
                children: c.infoList,
              );
            })
          ],
        ),
      ),
    );
  }
}
