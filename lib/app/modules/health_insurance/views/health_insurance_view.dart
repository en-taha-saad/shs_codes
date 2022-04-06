import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/noAccount.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
import 'package:shs108private/main.dart';
import '../controllers/health_insurance_controller.dart';

class HealthInsuranceView extends GetView<HealthInsuranceController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: textWidget(
                stringText: 'الضمان الصحي',
                color: Colors.black,
                fontSize: 20,
              ),
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
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
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
            drawer: MainDrawer(),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(footerIMG,
                        width: MediaQuery.of(context).size.width),
                  ),
                  savedToken == null ? noAccount() : SafeArea(child: ListView())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
