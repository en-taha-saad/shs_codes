import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/container_element.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/family_information/views/family_information_view.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';

class FamilyInfoPreviewView extends StatefulWidget {
  const FamilyInfoPreviewView({Key? key}) : super(key: key);

  @override
  _FamilyInfoPreviewViewState createState() => _FamilyInfoPreviewViewState();
}

class _FamilyInfoPreviewViewState extends State<FamilyInfoPreviewView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    fetchChildProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 140,
                        height: 50,
                        color: generalColor,
                        child: TextButton(
                          onPressed: () {
                            Get.to(() => FamilyInformationView());
                          },
                          child: textWidget(
                            stringText: "الملف الشخصي",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 140,
                        height: 50,
                        color: generalColor,
                        child: TextButton(
                          onPressed: () =>
                              Get.offNamed(Routes.DOCTOR_DASHBOARD),
                          child: textWidget(
                            stringText: "الرئيسية",
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'مرحباً بكم في خدمة الرعاية الصحية الذكية',
                        textStyle: style(
                          fontSize: 17,
                          color: generalColor,
                          fontWeight: FontWeight.bold,
                        )!,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetCircularAnimator(
                        innerColor: Colors.black,
                        outerColor: Colors.blue,
                        innerAnimation: Curves.easeIn,
                        outerAnimation: Curves.elasticIn,
                        innerIconsSize: 3,
                        outerIconsSize: 3,
                        reverse: true,
                        size: 140,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Get.arguments[0] != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(
                                      File(Get.arguments[0] as String)),
                                )
                              : CircleAvatar(
                                  backgroundImage: AssetImage(
                                      defaultAvatarIMG),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                BuildContainer(
                  stringText1: 'اسم المستخدم',
                  stringText2: '${Get.arguments[1]} ${Get.arguments[2]} '
                      '${Get.arguments[3]}',
                ),
                BuildContainer(
                  stringText1: 'الجنس',
                  stringText2: '${Get.arguments[4]}',
                ),
                BuildContainer(
                  stringText1: 'تاريخ الميلاد',
                  stringText2: '${Get.arguments[11]}',
                ),
                BuildContainer(
                  stringText1: 'الجنسية',
                  stringText2: '${Get.arguments[5]} '
                      '${Get.arguments[6]} ',
                ),
                BuildContainer(
                  stringText1: 'العنوان',
                  stringText2:
                      '${Get.arguments[7]} ${Get.arguments[8]} ${Get.arguments[9]} ${Get.arguments[10]}',
                ),
                // getRelatedCountry2 != null ||
                SizedBox(height: 10),
                Get.arguments[12] != ''
                    ? BuildContainer(
                        stringText1: 'أمراض مزمنة',
                        stringText2: '${Get.arguments[12]}',
                      )
                    : Container(),
                Get.arguments[13] != ''
                    ? BuildContainer(
                        stringText1: 'علامات فارقة',
                        stringText2: '${Get.arguments[13]}',
                      )
                    : Container(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
