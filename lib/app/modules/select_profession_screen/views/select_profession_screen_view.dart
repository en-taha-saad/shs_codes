import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/signup_appbar.dart';

import '../controllers/select_profession_screen_controller.dart';

class SelectProfessionScreenView
    extends GetView<SelectProfessionScreenController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: SignUpAppBar(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                textWidget(
                  stringText: 'المعلومات المهنيه',
                  color: Colors.black,
                  fontSize: 25,
                ),
                GetBuilder(
                  builder: (SelectProfessionScreenController c) {
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(10),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: generalColor, width: 2),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "تسجيل الخروج",
                            titleStyle: style(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            confirm: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(10),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: generalColor, width: 2),
                                  ),
                                ),
                              ),
                              onPressed: c.sureToLogOut,
                              child: textWidget(
                                stringText: 'تأكيد',
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            cancel: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(10),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: generalColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: textWidget(
                                stringText: 'الغاء',
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            cancelTextColor: Colors.black,
                            confirmTextColor: Colors.white,
                            buttonColor: generalColor,
                            barrierDismissible: true,
                            radius: 40,
                            titlePadding: EdgeInsets.all(20),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            content: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: textWidget(
                                stringText:
                                    "هل انت متأكد من الغاء التسجيل؟\nسيتم تحويلك الى تسجيل الدخول",
                                fontSize: 18,
                                color: Colors.black,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        child: textWidget(
                          stringText: 'الغاء التسجيل',
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 170),
                child: textWidget(
                  stringText: 'إختيار المهنة',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: BottomTheme(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemCount: controller.professions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          index == 0
                              ? Get.toNamed(controller.routes[index])
                              : null;
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 150,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
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
                                      bottomRight: Radius.circular(20),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: textWidget(
                                    stringText: controller.professions[index],
                                    color: Colors.white,
                                    fontSize: 20,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
