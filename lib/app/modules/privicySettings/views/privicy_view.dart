import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/noAccount.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
import 'package:shs108private/app/modules/profile/widgets/card_item.dart';
import 'package:shs108private/main.dart';

class PrivicyView extends StatefulWidget {
  @override
  _PrivicyViewState createState() => _PrivicyViewState();
}

class _PrivicyViewState extends State<PrivicyView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        appBar: AppBar(
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
          backgroundColor: Colors.white,
          elevation: 0,
          title: textWidget(
            stringText: "إعدادات الأمان",
            color: Colors.black,
            fontSize: 25,
          ),
          centerTitle: true,
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
        body: savedToken == null
            ? noAccount()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                        CardItem(
                          stringText: "تغيير كلمة المرور",
                          onPressed: null,
                          icon: Icons.password_sharp,
                        ),
                        CardItem(
                          stringText: "تأكيد الرقم",
                          onPressed: null,
                          icon: Icons.message_outlined,
                        ),
                        CardItem(
                          stringText: "الغاء تنشيط الحساب",
                          onPressed: null,
                          icon: Icons.delete_forever_outlined,
                        ),
                      ],
                    ),
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
