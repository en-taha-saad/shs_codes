import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/routes/app_pages.dart';

Widget categoriesSection(
  List<String> categoryImages,
  List<String> categoryTexts,
  BuildContext context,
) {
  return Container(
    height: 170.0 * categoryTexts.length,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      padding: EdgeInsets.all(0.0),
      itemCount: categoryTexts.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          if ([4, 10, 11, 15].contains(index)) {
            Get.toNamed(
              Routes.EXPLORE_CATEGORIES,
              arguments: categoryTexts[index],
            );
          } else {
            Get.toNamed(servicesRoutes[index]);
          }
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
                    categoryImages[index],
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
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 30),
                      Container(
                        // alignment: Alignment.bottomRight,
                        // height: 200,
                        // width: MediaQuery.of(context).size.width-150,
                        child: textWidget(
                          stringText: categoryTexts[index],
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );

/* 
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/suppliesOrganizations.svg',
              stringText: 'شركات ومكاتب تجهيز',
              textSize: 15,
              width: 140,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
            SizedBox(width: 100),
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/medicalSupplies.svg',
              stringText: 'مستلزمات علاجية',
              textSize: 15,
              width: 125,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            containerWidget(
              icon: labsimg,
              stringText: 'مختبرات',
              textSize: 15,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
            SizedBox(width: 29),
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/doctor.svg',
              stringText: 'اطباء',
              textSize: 15,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
            SizedBox(width: 29),
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/pharmacy.svg',
              stringText: 'صيدليات',
              textSize: 15,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
            SizedBox(width: 29),
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/hospital.svg',
              stringText: 'مستشفيات',
              textSize: 15,
              width: 80,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/servicesOutside.svg',
              stringText: 'خدمات طبية خارج العراق',
              textSize: 15,
              width: 175,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
            SizedBox(width: 120),
            containerWidget(
              icon: 'assets/general_for_two_apps/categoriesIcons/medicative.svg',
              stringText: 'معالجين',
              textSize: 15,
              iconSize: 30,
              colorBackground: Color(0XFF2968AF),
            ),
          ],
        ),
      ],
    );

 */
}
