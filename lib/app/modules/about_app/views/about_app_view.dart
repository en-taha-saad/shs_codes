import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Stack(
            children: [
              Image.asset(
                '$headerIMG',
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: textWidget(
            stringText: 'حول التطبيق',
            color: Colors.black,
            fontSize: 25,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: textWidget(
                    stringText: "توفر شركة الانظمة"
                        " المتحدة عبر منظومة الرعاية الصحية "
                        "الذكية (SHS) خدمة تكنولوجيا المعلومات "
                        "لتسهيل تقديم الخدمات و الاستشارات "
                        "الصحية المتكاملة من قبل المؤسسات و "
                        "الكوادر الصحية داخل و خارج العراق من "
                        "خلال شبكة من البرامجيات و المواقع و "
                        "التطبيقات الذكية لاتمتة كافة العمليات "
                        "الصحية وإكمال التحول الرقمي.\n\nSHS Release 2.2.1",
                    fontSize: 22,
                  ),
                ),
              ),
              Image.asset(
                footerIMG,
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
