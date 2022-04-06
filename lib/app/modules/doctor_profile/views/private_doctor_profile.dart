import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/doctor_profile/controllers/doctor_profile_controller.dart';

class PrivateProfileView extends GetView<DoctorProfileController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Stack(
                children: [
                  Image.asset(
                    placeholderImageIMG,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black38, Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 12,
                          horizontal: 20.0),
                      child: Container()),
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
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 12,
                  left: 20,
                  child: ClipOval(
                    child: Container(
                      color: Colors.lightBlue,
                      width: MediaQuery.of(context).size.height / 6,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Image.asset(
                        defaultAvatarIMG,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              // Positioned(
              //   top: MediaQuery.of(context).size.height/6 +10,
              //   right: 20,
              //   child:Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment:CrossAxisAlignment.start,
              //     children: [
              //       textWidget(
              //         stringText: "الدكتور سليم سالم السالمي",
              //         fontSize: 22,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "أخصائي امراض قلب والصدر",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //           stringText: "رئيس قسم الامراض القلبية مستشفى الأمل",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "الأختصاصات العلاجية",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "أمراض قلبية وصدرية ومعالجة الربو, التهابات"
              //             " وجراحة القلب.",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "الشهادات",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 بكلوريوس طب عام M.B.CH  جامعة بغداد"
              //             " 1990",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //           stringText: "\u25A0 بورد يوغسلافي F.R.C.S  جمعية "
              //               "أطباء "
              //               "بلغراد 1996",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "مواقع العمل",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       Row(
              //         children: [
              //           textWidget(
              //             stringText: "\u25A0 مستشفى الأمل الخاص، بغداد - الصالحية",
              //             fontSize: 17,
              //           ),
              //           SizedBox(width: 10,),
              //           textWidget(
              //             stringText: "لا تتوفر خدمة الحجز",
              //               fontSize: 17,
              //             color: Colors.red
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10,),
              //       Row(
              //         children: [
              //           textWidget(
              //               stringText: "\u25A0 عيادة الدكتور سليم سالم الخاصة، بغداد - المنصور",
              //             fontSize: 17,
              //           ),
              //           SizedBox(width: 10,),
              //           textWidget(
              //               stringText: "حجز موعد",
              //               fontSize: 17,
              //               color: Colors.red
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "الخبرات",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 أخصائي في أمراض القلب وجراحة القلب المفتوح.",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 خبرة 20 عام في جراحة القلب المفتوح.",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "الدورات التدريبية",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 دورة الناظور الأشعاعي 2019 برلين.",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "العضويات",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 عضو جمعية الأطباء الكنديين.",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 30,),
              //       textWidget(
              //         stringText: "للتواصل",
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "\u25A0 الايميل المهني:sui@baghdad-iq.com",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //           stringText: "\u25A0 الهاتف المهني: مخفي",
              //         fontSize: 17,
              //       ),
              //       SizedBox(height: 10,),
              //       textWidget(
              //         stringText: "أرسل رسالة على الحساب المهني",
              //         fontSize: 17,
              //         textDecoration: TextDecoration.underline,
              //         color: Colors.blue,
              //       ),
              //     ],
              //   )
              // ),
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6 + 10,
                      right: 20,
                      left: 20,
                      bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        stringText: "الدكتور سليم سالم السالمي",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "أخصائي امراض قلب والصدر",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "رئيس قسم الامراض القلبية مستشفى الأمل",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textWidget(
                        stringText: "الأختصاصات العلاجية",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "أمراض قلبية وصدرية ومعالجة الربو, التهابات"
                            " وجراحة القلب.",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textWidget(
                        stringText: "الشهادات",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "\u25A0 بكلوريوس طب عام M.B.CH  جامعة بغداد"
                            " 1990",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "\u25A0 بورد يوغسلافي F.R.C.S  جمعية "
                            "أطباء "
                            "بلغراد 1996",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "مواقع العمل",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText:
                            "\u25A0 مستشفى الأمل الخاص، بغداد - الصالحية",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText:
                            "\u25A0 عيادة الدكتور سليم سالم الخاصة، بغداد - المنصور",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "الخبرات",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText:
                            "\u25A0 أخصائي في أمراض القلب وجراحة القلب المفتوح.",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText:
                            "\u25A0 خبرة 20 عام في جراحة القلب المفتوح.",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "الدورات التدريبية",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "\u25A0 دورة الناظور الأشعاعي 2019 برلين.",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "العضويات",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "\u25A0 عضو جمعية الأطباء الكنديين.",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textWidget(
                        stringText: "للتواصل",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText:
                                "\u25A0 الايميل المهني:sui@baghdad-iq.com",
                            fontSize: 17,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "\u25A0 الهاتف المهني: 07007777777",
                            fontSize: 17,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "أرسل رسالة على الحساب المهني",
                        fontSize: 17,
                        textDecoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "الصور المهنية",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        placeholderImageIMG,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "عملية قلب مفتوح بغداد 2020",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        placeholderImageIMG,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textWidget(
                        stringText: "عملية تبديل شرايين",
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          textWidget(
                            stringText: "التوصيات:",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          textWidget(
                            stringText: "إخفاء",
                            fontSize: 17,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  placeholderImageIMG,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width / 6,
                                ),
                              ),
                              textWidget(
                                stringText: "الدكتور احمد حسن",
                                fontSize: 12,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.75,
                            child: textWidget(
                                stringText:
                                    "الدكتور سليم من أفضل الأطباء في العراق"
                                    " في علاج الأمراض الصدرية"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: 50,
                                color: generalColor,
                                child: TextButton(
                                    onPressed: () {},
                                    child: textWidget(
                                      stringText: "تعديل المعلومات المهنية",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: generalColor,
                                  ),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: TextButton(
                                    onPressed: () {},
                                    child: textWidget(
                                      stringText: "عودة الى لوحة التحكم",
                                      color: generalColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
