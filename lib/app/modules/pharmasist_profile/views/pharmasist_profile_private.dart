import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/doctor_profile/controllers/doctor_profile_controller.dart';


class PharmasistProfilePrivateView extends GetView<DoctorProfileController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height:MediaQuery.of(context).size.height,),
              Stack(
                children: [
                  Image.asset(
                    "assets/general_for_two_apps/phar profile/1.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/6,
                  ),
                  Container(
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
                          vertical: MediaQuery.of(context).size.height/12,
                          horizontal: 20.0),
                      child: Container()
                  ),
                ],
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height/12-5,
                  left: 15,
                  child:ClipOval(
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.height/6+10,
                      height: MediaQuery.of(context).size.height/6+10,
                    ),
                  )
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/12,
                left: 20,
                child:ClipOval(
                  child: Container(
                    color: Colors.lightBlue,
                    width: MediaQuery.of(context).size.height/6,
                    height: MediaQuery.of(context).size.height/6,
                    child: Image.asset(
                      "assets/general_for_two_apps/phar profile/2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size
                    .height/6 +10,right:20, left: 20,bottom: 30),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "الصيدلي سليم سالم السالمي",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "اختصاص صيدلية صناعية",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                          stringText: "صيدلي اقدم مستشفى الامل",
                        fontSize: 17,
                      ),
                    ),
                    // SizedBox(height: 30,),
                    // textWidget(
                    //   stringText: "الأختصاصات العلاجية",
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // SizedBox(height: 10,),
                    // textWidget(
                    //   stringText: "أمراض قلبية وصدرية ومعالجة الربو, التهابات"
                    //       " وجراحة القلب.",
                    //   fontSize: 17,
                    // ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "الشهادات",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "\u25A0 بكلوريوس صيدلة عام M.B.CH  جامعة بغداد"
                            " 1990",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "مواقع العمل",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*2/3 - 40,
                          child: textWidget(
                            stringText: "\u25A0 مستشفى الأمل الخاص، بغداد - الصالحية",
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/3 -20,
                          child: textWidget(
                            stringText: "لا تتوفر خدمة طلب الدواء",
                              fontSize: 17,
                            color: Colors.red
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*2/3 - 40,
                          child: textWidget(
                              stringText: "\u25A0 صيدلة الحياة، بغداد - المنصور",
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/3 - 20,
                          child: textWidget(
                            stringText: "خدمة طلب الدواء",
                            fontSize: 17,
                            color: Colors.red
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "الخبرات",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "\u25A0 اخصائي في التركيبات الدوائية القلبية",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "\u25A0 خبرة 20 عام في الصيدلة الصناعية",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "الدورات التدريبية",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "\u25A0 دورة التطوير الصناعي 2019 برلين.",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "العضويات",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "\u25A0 عضو جمعية الصيادلة الكنديين.",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "للتواصل",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "\u25A0 الايميل المهني:sui@dtyym-iq.com",
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                              stringText: "\u25A0 الهاتف المهني: 07771122334",
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "أرسل رسالة على الحساب المهني",
                        fontSize: 17,
                        textDecoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "الصور المهنية",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Image.asset(
                      "assets/general_for_two_apps/phar profile/3.JPG",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height/4,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: textWidget(
                        stringText: "دورة التطوير الصناعي الصيدلي بغداد 2020",
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          child: textWidget(
                            stringText: "التوصيات:",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20,),
                        textWidget(
                          stringText: "إخفاء",
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height:10,),
                    Row(
                      children: [
                        Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                defaultAvatarIMG,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width/6,
                                height: MediaQuery.of(context).size.width/6,
                              ),
                            ),
                            textWidget(
                              stringText: "الدكتور احمد حسن",
                              fontSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.75,
                          child: textWidget(
                            stringText: "سليم من أفضل الصيادلة في العراق"
                                " في الصيدلة الصناعية"
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
