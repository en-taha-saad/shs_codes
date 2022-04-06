import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/about/controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
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
          title: textWidget(
            stringText: "عن الشركه",
            color: Colors.black,
            fontSize: 20,
          ),
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
        floatingActionButton: ambulanceFloating(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 1),
              SvgPicture.asset(
                notFoundIMG,
                height: 270,
                width: 270,
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  child: textWidget(
                    stringText:
                        'الصفحة غير متوفرة حاليا, يرجى الرجوع اليها لاحقا',
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(flex: 1),
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
