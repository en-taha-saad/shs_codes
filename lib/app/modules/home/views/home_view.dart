import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
import 'package:shs108private/app/modules/home/controllers/home_controller.dart';
import 'package:shs108private/app/modules/home/views/home_profile_map.dart';
import 'package:shs108private/app/modules/home/views/widgets/articals.dart';
import 'package:shs108private/app/modules/home/views/widgets/categories.dart';
import 'package:shs108private/app/modules/home/views/widgets/closestLocationButtons.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugs_search_bar.dart';
import 'package:shs108private/app/modules/home/views/widgets/filters.dart';
import 'package:shs108private/app/modules/home/views/widgets/news.dart';
import 'package:shs108private/app/modules/home/views/widgets/parteners.dart';
import 'package:shs108private/app/modules/home/views/widgets/search_bar.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: 'لتأكيد الخروج يرجى الضغط مرتين على الرجوع',
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: MainDrawer(),
          floatingActionButton: ambulanceFloating(),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: Color(0xff7c94b6),
                // backgroundColor: Colors.white,
                leading: Container(),
                pinned: false,
                floating: true,
                snap: true,
                expandedHeight: 80,
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
                                BlendMode.dstATop),
                            image: AssetImage(
                              'assets/general_for_two_apps/categoriesIcons/appbarBackground.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: textWidget(
                            fontWeight: FontWeight.w900,
                            stringText: "الرئيسية",
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 30.0,
                        child: Image.asset(
                          faviconIMG,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                      // Positioned(
                      //   top: 120,
                      //   child: Center(
                      //     child: Container(
                      //       width: MediaQuery.of(context).size.width - 20,
                      //       height: 180,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(7),
                      //         color: Colors.white.withOpacity(0.2),
                      //       ),
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.all(10),
                      //       margin: EdgeInsets.only(right: 10, left: 10),
                      //       child: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: <Widget>[
                      //           textWidget(
                      //               stringText:
                      //                   'منظومة الرعاية الصحية الذكية توفر لجميع المواطنين والمقيمين في العراق خدمة البحث والاستدلال عن مقدمي الرعاية الصحية في داخل وخارج العراق وحجز المواعيد وطلب العلاج وارشفة التاريخ المرضي للمواطنين مجانا.',
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //               height: 1.7,
                      //               fontWeight: FontWeight.bold),
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               textWidget(
                      //                 stringText: 'لمعلومات اكثر ',
                      //                 color: Colors.white,
                      //                 fontSize: 16,
                      //               ),
                      //               TextButton(
                      //                 onPressed: () {
                      //                   Get.toNamed(Routes.OUR_SERVICES);
                      //                 },
                      //                 child: textWidget(
                      //                   stringText: 'اضغط هنا',
                      //                   color: Colors.white,
                      //                   fontSize: 16,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                    Stack(
                      children: [
                        Container(
                          height: 240,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.4),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                'assets/general_for_two_apps/hospitals/hos-5.jpg',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 360,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: <Color>[
                                  Colors.white,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 50,
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     alignment: Alignment.center,
                        //     child: textWidget(
                        //       fontWeight: FontWeight.w900,
                        //       stringText: "الرئيسية",
                        //       color: Colors.white,
                        //       fontSize: 24,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //     left: 0,
                        //     top: 20,
                        //     child: Image.asset(
                        //       faviconIMG,
                        //       width: 100,
                        //       height: 100,
                        //     )),
                        // Positioned(
                        //   top: 32,
                        //   right: 0,
                        //   child: IconButton(
                        //     icon: Icon(
                        //       Icons.menu,
                        //       color: Colors.white,
                        //       size: 55,
                        //     ),
                        //     onPressed: () {
                        //       scaffoldKey.currentState!.openDrawer();
                        //     },
                        //   ),
                        // ),
                        Positioned(
                          top: 10,
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  textWidget(
                                      stringText:
                                          'منظومة الرعاية الصحية الذكية توفر لجميع المواطنين والمقيمين في العراق خدمة البحث والاستدلال عن مقدمي الرعاية الصحية في داخل وخارج العراق وحجز المواعيد وطلب العلاج وارشفة التاريخ المرضي للمواطنين مجانا.',
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.7,
                                      fontWeight: FontWeight.bold),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      textWidget(
                                        stringText: 'لمعلومات اكثر ',
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.OUR_SERVICES);
                                        },
                                        child: textWidget(
                                          stringText: 'اضغط هنا',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
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
                    SizedBox(
                      height: 25,
                      child: AnimatedTextKit(
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
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 9,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: HomeMarkersPage(),
                    ),
                    SizedBox(height: 15),
                    closestLocationButtons(),
                    SizedBox(height: 15),
                    Center(
                      child: textWidget(
                          stringText:
                              'بحث سريع عن خدمات الرعاية الصحية في العراق'),
                    ),
                    Filters(),
                    SizedBox(height: 15),
                    searchBar(),
                    NewDrugsSearchBar(),
                    // DrugSearchBar(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xff7c94b6),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.white.withOpacity(0.7),
                                        BlendMode.dstATop),
                                    image: AssetImage(
                                      pharmaceuticalIMG,
                                    ),
                                  ),
                                ),
                                child: FloatingActionButton.extended(
                                  heroTag: "btn4",
                                  backgroundColor: Colors.white.withOpacity(0),
                                  label: textWidget(
                                    stringText: 'طلب ادوية',
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                  color: Color(0xff7c94b6),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.white.withOpacity(0.7),
                                        BlendMode.dstATop),
                                    image: AssetImage(
                                      ambulanceIMG,
                                    ),
                                  ),
                                ),
                                child: FloatingActionButton.extended(
                                  heroTag: "btn3",
                                  backgroundColor: Colors.white.withOpacity(0),
                                  label: textWidget(
                                    stringText: 'طلب اسعاف فوري',
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: textWidget(
                        stringText:
                            'بحث في دليل منظومة الرعاية الصحية في العراق',
                        color: generalColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    categoriesSection(categoryImages, servicesItems, context),
                    SizedBox(height: 15),
                    Center(
                      child: textWidget(
                        stringText: 'تصفح العروض والخصومات المقدمة',
                        color: generalColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(ad2IMG),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(ad2IMG),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(ad2IMG),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    NewsSection(),
                    SizedBox(height: 15),
                    ArticalsSection(),
                    SizedBox(height: 15),
                    PartenersSection(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
