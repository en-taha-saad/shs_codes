import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/routes/app_pages.dart';

import '../controllers/institution_dashboard_controller.dart';

class InstitutionDashboardView extends GetView<InstitutionDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
              future: controller.getInstituionsVar,
              builder: (
                BuildContext context,
                AsyncSnapshot<InstitutionsProfile> snapshot,
              ) {
                if (snapshot.hasData) {
                  InstitutionsProfile? institut = snapshot.data;
                  bool? isProfileV = false;
                  String? profileImage;
                  institut?.profileImage?.forEach((e) {
                    if (e.isProfile == 1) {
                      isProfileV = true;
                      profileImage = e.imageUrl;
                    }
                  });
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
                        leading: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                        ),
                        pinned: true,
                        floating: false,
                        snap: false,
                        toolbarHeight: 150,
                        // expandedHeight: 100,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              // Container(
                              //   height: 150,
                              //   color: Colors.white,
                              //   decoration: BoxDecoration(
                              //     color: const Color(0xff7c94b6),
                              //     image: DecorationImage(
                              //       fit: BoxFit.cover,
                              //       colorFilter: ColorFilter.mode(
                              //         Colors.white.withOpacity(0.4),
                              //         BlendMode.dstATop,
                              //       ),
                              //       image: AssetImage(
                              //         'assets/onle_for_second_app/professions/1doctor.jpg',
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                margin:
                                    EdgeInsets.only(top: 20, left: 5, right: 5),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textWidget(
                                          fontWeight: FontWeight.w900,
                                          stringText:
                                              "الحساب : ${institut!.issuer!.firstName} ${institut.issuer!.secondName} ${institut.issuer!.sureName}",
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        textWidget(
                                          fontWeight: FontWeight.w900,
                                          stringText:
                                              "الدور : مالك حساب العيادة",
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                Routes.INSTITUTION_PROFILE);
                                          },
                                          child: textWidget(
                                            // fontWeight: FontWeight.w900,
                                            textDecoration:
                                                TextDecoration.underline,
                                            stringText: "صفحة العيادة",
                                            color: generalColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(80),
                                          ),
                                          child: profileImage != null
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    '$imageUrl/$profileImage',
                                                  ),
                                                  radius: 35,
                                                )
                                              : SvgPicture.asset(
                                                  'assets/general_for_two_apps/icons/hospital-1066.svg',
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.fill,
                                                  color: Colors.grey,
                                                ),
                                          margin: EdgeInsets.all(5),
                                        ),
                                        textWidget(
                                            stringText: institut.name ?? '',
                                            fontWeight: FontWeight.bold)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
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
                            // Stack(
                            //   children: [
                            //     Container(
                            //       height: 260,
                            //       decoration: BoxDecoration(
                            //         color: const Color(0xff7c94b6),
                            //         image: DecorationImage(
                            //           fit: BoxFit.cover,
                            //           colorFilter: ColorFilter.mode(
                            //               Colors.white.withOpacity(0.4),
                            //               BlendMode.dstATop),
                            //           image: AssetImage(
                            //             'assets/onle_for_second_app/professions/hos-5.jpg',
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       bottom: 0,
                            //       left: 0,
                            //       right: 0,
                            //       child: Container(
                            //         height: 360,
                            //         decoration: BoxDecoration(
                            //           gradient: LinearGradient(
                            //             begin: Alignment.bottomCenter,
                            //             end: Alignment.topCenter,
                            //             colors: <Color>[
                            //               Colors.white,
                            //               Colors.transparent,
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       top: 10,
                            //       child: Center(
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width - 20,
                            //           height: 190,
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(7),
                            //             color: Colors.white.withOpacity(0.2),
                            //           ),
                            //           alignment: Alignment.center,
                            //           padding: EdgeInsets.all(10),
                            //           margin: EdgeInsets.only(right: 10, left: 10),
                            //           child: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: <Widget>[
                            //               textWidget(
                            //                 stringText:
                            //                     'منظومة الرعاية الصحية الذكية توفر لجميع المواطنين والمقيمين في العراق خدمة البحث والاستدلال عن مقدمي الرعاية الصحية في داخل وخارج العراق وحجز المواعيد وطلب العلاج وارشفة التاريخ المرضي للمواطنين مجانا.',
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 height: 1.7,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //               Row(
                            //                 mainAxisAlignment: MainAxisAlignment.center,
                            //                 children: <Widget>[
                            //                   textWidget(
                            //                     stringText: 'لمعلومات اكثر ',
                            //                     color: Colors.white,
                            //                     fontSize: 16,
                            //                   ),
                            //                   TextButton(
                            //                     onPressed: () {},
                            //                     child: textWidget(
                            //                       stringText: 'اضغط هنا',
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 20.0),
                            Stack(
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  height: 150.0 * controller.menus.length +
                                      70 * controller.switchesTitles.length,
                                  margin: EdgeInsets.only(top: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GridView.builder(
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
                                              // controller.routes[index] != Routes.SIGNUP
                                              //     ? Get.toNamed(controller.routes[index],preventDuplicates: true)
                                              //     : null;
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
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
                                                    // color: Colors.greenAccent.withOpacity(0.05),
                                                    // borderRadius: BorderRadius.circular(20),
                                                    // border: Border.all(
                                                    //     color: controller.color,
                                                    //     // color: controller.colors[index%6],
                                                    //     width: 4)
                                                    border: Border(
                                                      top: BorderSide(
                                                        width: 2.0,
                                                        color: controller
                                                            .colors[index],
                                                      ),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      30,
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          // color: controller.colors[index%6],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(80),
                                                        ),
                                                        child: Icon(
                                                          controller
                                                              .icons[index],
                                                          color: controller
                                                              .colors[index],
                                                          size: 60,
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: textWidget(
                                                          stringText: controller
                                                              .menus[index],
                                                          color: Colors.black,
                                                          // color: controller.colors[index%6],
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            30,
                                                        // height: MediaQuery.of(context).size.width/2
                                                        //     -110,
                                                        alignment:
                                                            Alignment.center,
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
                                      Container(
                                          padding: EdgeInsets.only(right: 40),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              textWidget(
                                                  stringText: "مفاتيح الحالة",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .switchesTitles.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 1,
                                                  childAspectRatio: 8.5,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      textWidget(
                                                          stringText: controller
                                                                  .switchesTitles[
                                                              index],
                                                          fontSize: 19),
                                                      GetBuilder(builder:
                                                          (InstitutionDashboardController
                                                              c) {
                                                        return CupertinoSwitch(
                                                          value: !controller
                                                                  .switchesValues[
                                                              index],
                                                          onChanged: (b) =>
                                                              controller
                                                                  .onSwitchChanged(
                                                                      index),
                                                          activeColor: controller
                                                                  .switchesColors[
                                                              index],
                                                        );
                                                      })
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: textWidget(
                      stringText: 'حدث خطأ ما يرجى إعادة المحاولة',
                      fontSize: 20,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
