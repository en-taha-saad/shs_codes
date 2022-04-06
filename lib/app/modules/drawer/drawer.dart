import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/widget/header.dart';
import 'package:shs108private/app/modules/drawer/widget/menu_item.dart';
import 'package:shs108private/app/modules/drawer/widget/submenu_item.dart';
import 'package:shs108private/app/modules/inbox/views/inbox_static.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: generalColor,
        child: ListView(
          controller: ScrollController(),
          children: <Widget>[
            HeaderWidget(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24),
                  if (providers)
                    menuItem(
                      text: 'لوحة التحكم',
                      icon: Icons.dashboard,
                      tileColor: Get.currentRoute == Routes.DOCTOR_DASHBOARD
                          ? Colors.white.withOpacity(0.3)
                          : null,
                      onClicked: () => Get.offNamed(Routes.DOCTOR_DASHBOARD),
                    ),
                  if (providers) SizedBox(height: 10),
                  menuItem(
                    text: 'الرئيسية',
                    icon: Icons.home,
                    tileColor: Get.currentRoute == Routes.HOME
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () => Get.offNamed(Routes.HOME),
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'الهوية الرقمية',
                    icon: Icons.article_outlined,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'المعلومات الشخصية',
                    icon: Icons.person,
                    tileColor: Get.currentRoute == Routes.PROFILE
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () {
                      if (providers) {
                        Get.offNamed(Routes.PROFILE);
                      }
                      if (!providers) {
                        Get.toNamed(Routes.PROFILE);
                      }
                    },
                  ),
                  // SizedBox(height: 10),
                  // menuItem(
                  //   text: 'المعلومات المهنية',
                  //   icon: Icons.person_pin_outlined,
                  //   tileColor: Get.currentRoute == Routes.DOCTOR_PROFILE
                  //       ? Colors.white.withOpacity(0.3)
                  //       : null,
                  //   onClicked: () => Get.offNamed(Routes.DOCTOR_PROFILE),
                  // ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'المعلومات العائلية',
                    icon: Icons.family_restroom,
                    tileColor: Get.currentRoute == Routes.FAMILY_INFORMATION
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () {
                      if (providers) {
                        Get.offNamed(Routes.FAMILY_INFORMATION);
                      }
                      if (!providers) {
                        Get.toNamed(Routes.FAMILY_INFORMATION);
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'المعلومات الرسمية',
                    icon: Icons.all_inbox,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'التاريخ المرضي',
                    icon: Icons.history,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      menuItem(
                        text: 'الاشعارات',
                        icon: Icons.notifications,
                        tileColor: Get.currentRoute == Routes.INBOX
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        onClicked: () => Get.toNamed(Routes.INBOX),
                      ),
                      savedToken == null
                          ? Container()
                          : Positioned(
                              left: 0,
                              top: 16,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: textWidget(
                                      stringText:
                                          "${inboxIsRead.where((value) => value == false).length}",
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'سجل طلب الأدوية',
                    icon: Icons.medication_outlined,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'خدمات الضمان الصحي',
                    icon: Icons.health_and_safety_outlined,
                    tileColor: Get.currentRoute == Routes.HEALTH_INSURANCE
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () => Get.toNamed(Routes.HEALTH_INSURANCE),
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'إعدادات الأمان',
                    icon: Icons.privacy_tip_outlined,
                    tileColor: Get.currentRoute == Routes.PRIVICY_SETTINGS
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () => Get.toNamed(Routes.PRIVICY_SETTINGS),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.black38),
                  menuItem(
                    text: 'الأخبار',
                    icon: Icons.voice_chat_sharp,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'المقالات',
                    icon: Icons.article_outlined,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'السلة',
                    icon: Icons.shopping_cart,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'قائمة المفضلات',
                    icon: Icons.bookmark,
                    tileColor: null,
                    onClicked: () {},
                  ),
                  SizedBox(height: 10),
                  menuItem(
                    text: 'خدماتنا',
                    icon: Icons.medical_services,
                    tileColor: Get.currentRoute == Routes.OUR_SERVICES
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () => Get.toNamed(Routes.OUR_SERVICES),
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    title: menuItem(
                      text: 'سجلاتنا',
                      icon: Icons.style,
                    ),
                    tilePadding: EdgeInsets.all(0),
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
                    childrenPadding: EdgeInsets.only(right: 20),
                    children: <Widget>[
                      subMenuItem(
                        text: 'دليل الكوادر',
                        tileColor: Get.currentRoute == Routes.STAFF
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        onClicked: () => Get.toNamed(Routes.STAFF),
                      ),
                      subMenuItem(
                        text: 'دليل المؤسسات الصحية داخل وخارج العراق',
                        tileColor:
                            Get.currentRoute == Routes.INSTITUTIONS_DIRECTORIES
                                ? Colors.white.withOpacity(0.3)
                                : null,
                        onClicked: () =>
                            Get.toNamed(Routes.INSTITUTIONS_DIRECTORIES),
                      ),
                      subMenuItem(
                        text: 'دليل الادوية و المستلزمات و المواد الصيدلانية',
                        tileColor: Get.currentRoute ==
                                Routes.DRUG_AND_MATERIALS_DIRECTORIES
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        onClicked: () =>
                            Get.toNamed(Routes.DRUG_AND_MATERIALS_DIRECTORIES),
                      ),
                      subMenuItem(
                        text: 'دليل الأعمال الخيرية',
                        tileColor:
                            Get.currentRoute == Routes.CHARITY_DIRECTORIES
                                ? Colors.white.withOpacity(0.3)
                                : null,
                        onClicked: () =>
                            Get.toNamed(Routes.CHARITY_DIRECTORIES),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: menuItem(
                      text: 'من نحن',
                      icon: Icons.help,
                    ),
                    tilePadding: EdgeInsets.all(0),
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
                    childrenPadding: EdgeInsets.only(right: 20),
                    //textWidget(stringText: 'عن الشركة', color: Colors.white,fontSize: 20),
                    children: <Widget>[
                      subMenuItem(
                        text: 'منظومة الرعاية الصحية الذكية',
                        tileColor: Get.currentRoute == Routes.ABOUT
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        onClicked: () => Get.toNamed(Routes.ABOUT),
                      ),
                      subMenuItem(
                        text: 'عن الشركة',
                        tileColor: Get.currentRoute == Routes.ABOUT
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        onClicked: () => Get.toNamed(Routes.ABOUT),
                      ),
                      subMenuItem(
                        text: 'معايير الأستخدام',
                        tileColor: null,
                        onClicked: () {},
                      ),
                      subMenuItem(
                        text: 'الشروط والأحكام',
                        tileColor:
                            Get.currentRoute == Routes.TERMS_AND_CONDITIONS
                                ? Colors.white.withOpacity(0.3)
                                : null,
                        onClicked: () =>
                            Get.toNamed(Routes.TERMS_AND_CONDITIONS),
                      ),
                      subMenuItem(
                        text: 'الأسئلة الشائعة',
                        tileColor: null,
                        onClicked: () {},
                      ),
                      subMenuItem(
                        text: 'الشكاوى',
                        tileColor: null,
                        onClicked: () {},
                      ),
                    ],
                  ),
                  menuItem(
                    text: 'حول التطبيق',
                    icon: Icons.phone_android,
                    tileColor: Get.currentRoute == Routes.ABOUT_APP
                        ? Colors.white.withOpacity(0.3)
                        : null,
                    onClicked: () => Get.toNamed(Routes.ABOUT_APP),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
