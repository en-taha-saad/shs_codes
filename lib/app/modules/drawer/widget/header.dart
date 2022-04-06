import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/doctor_dashboard/controllers/doctor_dashboard_controller.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/personal_account_sign_up_view.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class HeaderWidget extends StatefulWidget {
  final String? image;
  final String? name;
  final String? phone;
  final VoidCallback? onClicked;

  HeaderWidget({
    this.image,
    this.name,
    this.phone,
    this.onClicked,
  });

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Widget verifiedNumber = Container();
  checkVerifiedNumber() async {
    var headers = {'Authorization': 'Bearer ${savedToken ?? ''}'};
    var request = http.Request(
      'GET',
      Uri.parse('$url/verify_code/111111}'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 && savedToken != null) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      var dataMap = data["success"];
      print(dataMap);

      if (dataMap == 'true') {
        setState(() {
          verifiedNumber = TextButton(
            child:
                textWidget(stringText: "مؤكد", color: Colors.lightGreenAccent),
            onPressed: null,
          );
        });
        print("مؤكد");
      }
    } else {
      setState(() {
        verifiedNumber = TextButton(
            child:
                textWidget(stringText: "تأكيد رقم الهاتف", color: Colors.red),
            onPressed: () => Get.toNamed(Routes.OTP));
      });
      print("غير مؤكد");
    }
  }

  @override
  void initState() {
    checkVerifiedNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClicked,
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 15, right: 40),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                getImage != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "$imageUrl/$getImage",
                        ),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          defaultAvatarIMG,
                        ),
                      ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: textWidget(
                        stringText: savedToken != null
                            ? '${getFirstName ?? ''} ${getSecondName ?? ''}'
                            : '',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    textWidget(
                      fontSize: 18,
                      stringText: personalIdDrawer,
                      color: Colors.white,
                    ),
                    //savedToken != null ? verifiedNumber : Container(),
                  ],
                ),
              ],
            ),
            if (!providers) SizedBox(height: 20),
            if (!providers)
              savedToken != null
                  ? statusCode != 401
                      ? Container(
                          child: InkWell(
                            onTap: () {
                              sureToLogOut();
                              setState(() {
                                savedToken = null;
                                getImage = null;
                                storedToken.remove('token');
                                personalIdDrawer = '';
                              });
                              Get.offAllNamed(Routes.HOME);
                            },
                            child: textWidget(
                              stringText: 'تسجيل الخروج',
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () => Get.toNamed(
                                    Routes.PERSONAL_ACCOUNT_SIGN_UP),
                                child: textWidget(
                                  stringText: 'تسجيل',
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              textWidget(
                                stringText: '    /    ',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(
                                    Routes.PERSONAL_ACCOUNT_SIGN_IN),
                                child: textWidget(
                                  stringText: 'تسجيل الدخول',
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                  : Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () =>
                                Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_UP),
                            child: textWidget(
                              stringText: 'تسجيل',
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          textWidget(
                            stringText: '    /    ',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_IN),
                            child: textWidget(
                              stringText: 'تسجيل الدخول',
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
