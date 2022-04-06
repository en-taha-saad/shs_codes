import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/routes/app_pages.dart';

import '../controllers/doctor_dashboard_controller.dart';

int? institutionId;

class DoctorDashboardView extends GetView<DoctorDashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DoctorDashboardController(),
      builder: (DoctorDashboardController controller) {
        return DoubleBack(
          message: 'لتأكيد الخروج يرجى الضغط مرتين على الرجوع',
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: FutureBuilder(
                future: controller.getRegisteredInstituionsVar,
                builder: (BuildContext context,
                    AsyncSnapshot<List<InstitutionsProfile>> snapshot) {
                  List<InstitutionsProfile>? institutions = snapshot.data;
                  if (snapshot.hasData) {
                    return CustomScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      slivers: <Widget>[
                        SliverAppBar(
                          elevation: 0,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          // backgroundColor: Color(0xff7c94b6),
                          backgroundColor: Colors.white,
                          leading: Container(),
                          pinned: false,
                          floating: true,
                          snap: true,
                          expandedHeight: 100,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff7c94b6),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.white.withOpacity(0.4),
                                        BlendMode.dstATop,
                                      ),
                                      image: AssetImage(
                                        'assets/onle_for_second_app/professions/1doctor.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 50, left: 10, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.all(10),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(5),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  generalColor),
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
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.all(10),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: BorderSide(
                                                      color: generalColor,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onPressed: sureToLogOut,
                                              child: textWidget(
                                                stringText: 'تأكيد',
                                                color: Colors.black,
                                                fontSize: 17,
                                              ),
                                            ),
                                            cancel: TextButton(
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.all(10),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 40,
                                            ),
                                            content: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
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
                                          stringText: 'خروج',
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      textWidget(
                                        fontWeight: FontWeight.w900,
                                        stringText: "لوحة التحكم",
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      Image.asset(
                                        faviconIMG,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            collapseMode: CollapseMode.none,
                          ),
                        ),
                        SliverFillRemaining(
                          fillOverscroll: true,
                          hasScrollBody: false,
                          child: Column(
                            children: <Widget>[
                              AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'مرحباً بكم في منظومة الرعاية الصحية الذكية في '
                                    'العراق',
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
                              Container(
                                height: 150.0 * controller.menus.length,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(20),
                                  shrinkWrap: true,
                                  itemCount: controller.menus.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        controller.routes[index] !=
                                                Routes.SIGNUP
                                            ? Get.toNamed(
                                                controller.routes[index])
                                            : null;
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: (5),
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  width: 2.0,
                                                  color:
                                                      controller.colors[index],
                                                ),
                                              ),
                                              color: Colors.white,
                                            ),
                                            height: 150,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    // color: controller.colors[index%6],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                  ),
                                                  child: Icon(
                                                    controller.icons[index],
                                                    color: controller
                                                        .colors[index],
                                                    size: 60,
                                                  ),
                                                  margin: EdgeInsets.all(5),
                                                ),
                                                Spacer(),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: textWidget(
                                                    stringText:
                                                        controller.menus[index],
                                                    color: Colors.black,
                                                    // color: controller.colors[index%6],
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  // height: MediaQuery.of(context).size.width/2
                                                  //     -110,
                                                  alignment: Alignment.center,
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 160.0 *
                                    int.parse(
                                        (institutions?.length.toString())!),
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  shrinkWrap: true,
                                  itemCount: institutions?.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var e = institutions?[index];
                                    // ignore: unused_local_variable
                                    bool? isProfileV = false;
                                    String? profileImage;
                                    e?.profileImage?.forEach((e) {
                                      if (e.isProfile == 1) {
                                        isProfileV = true;
                                        profileImage = e.imageUrl;
                                      }
                                      print('isCover = ${e.isCover}');
                                      print('isCover = ${e.isProfile}');
                                    });
                                    return InkWell(
                                      onTap: () {
                                        institutionId = e?.id;
                                        // setState(() {});
                                        Get.toNamed(
                                            Routes.INSTITUTION_DASHBOARD);
                                        // Get.toNamed(Routes.INSTITUTION_PROFILE);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: (5),
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  width: 2.0,
                                                  color: generalColor,
                                                ),
                                              ),
                                              color: Colors.white,
                                            ),
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                110,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    // color: controller.colors[index%6],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                  ),
                                                  // ignore: prefer_is_empty
                                                  child: profileImage != null
                                                      ? CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                            '$imageUrl/$profileImage',
                                                          ),
                                                          radius: 35,
                                                        )
                                                      : FaIcon(
                                                          FontAwesomeIcons
                                                              .solidBuilding,
                                                          color: generalColor,
                                                          size: 50,
                                                        ),
                                                  margin: EdgeInsets.all(5),
                                                ),
                                                Spacer(),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: textWidget(
                                                    stringText: e?.name,
                                                    color: Colors.black,
                                                    // color: controller.colors[index%6],
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  // height: MediaQuery.of(context).size.width/2
                                                  //     -110,
                                                  alignment: Alignment.center,
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Stack(
                              //   children: [
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: textWidget(stringText: '${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
