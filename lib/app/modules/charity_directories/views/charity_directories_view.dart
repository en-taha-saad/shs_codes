import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

import '../controllers/charity_directories_controller.dart';

class CharityDirectoriesView extends GetView<CharityDirectoriesController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: generalColor3,
          //   elevation: 0,
          //   // title: textWidget(
          //   //   stringText: 'دليل الكوادر الصحية في العراق',
          //   //   color: Colors.white,
          //   //   fontSize: 25,
          //   // ),
          //   centerTitle: false,
          //   flexibleSpace: HeaderTheme(),
          // ),
          backgroundColor: Colors.white,

          body: Stack(
            children: [
              Container(
                child: BottomTheme(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: generalColor6,
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height / 3,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              ),
                            )),
                        HeaderTheme(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70.0,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: textWidget(
                                      stringText: 'دليل الأعمال الخيرية',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Icon(
                                    Icons.medical_services_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   child: textWidget(
                            //     stringText: "بالإمكان البحث عن أي من الكوادر "
                            //         "العاملة في القطاع الصحي في مختلف "
                            //         "الاختصاصات و المدن والمؤسسات الصحية عبر الدخول الى دليل الكادر و البحث بإستخدام محركات بحث بالاسم اوبالاختصاص او بالموقع الجغرافي او جميعهم و الاطلاع على السيرة المهنية لإي من الكادر و كذلك حجز المواعيد للمراجعات او طلب خدمة الزيارة او الرعاية المنزلية.",
                            //     color: Colors.white,
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            //   padding: EdgeInsets.symmetric(horizontal: 20),
                            // ),
                            GridView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.all(20),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.professions.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(controller.routes[index]);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height: 150,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              controller.images[index],
                                              cacheHeight: 150,
                                              cacheWidth: 200,
                                              fit: BoxFit.cover,
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
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.3,
                                            padding: const EdgeInsets.all(10),
                                            child: textWidget(
                                              stringText:
                                                  controller.professions[index],
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                                // Container(
                                //   margin: EdgeInsets.only(
                                //     top: 35,
                                //     bottom: 15,
                                //     left: 15,
                                //     right: 15,
                                //   ),
                                //   child: ElevatedButton(
                                //     style: ButtonStyle(
                                //       overlayColor: MaterialStateProperty.all(
                                //         controller.professionsColors[index],
                                //       ),
                                //       backgroundColor: MaterialStateProperty.all(Colors.white),
                                //       shape: MaterialStateProperty.all(
                                //         RoundedRectangleBorder(
                                //           side: BorderSide(
                                //             width: 3,
                                //             color: controller.professionsColors[index],
                                //           ),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //       ),
                                //       padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                                //     ),
                                //     onPressed: () =>
                                //       controller.routes[index],
                                //     child: ,
                                //   ),
                                // );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
