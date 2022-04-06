import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/otp/views/widgets/number_fields.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class OtpView extends StatefulWidget {
  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpView> {
  var tokeny = Get.arguments;
  bool? success;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  TextEditingController currController = TextEditingController();

  bool complete = false;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // fetchParentProfile();
    // fetchChildProfile();
    // getBarcode();
    // print('getImage = $getImage');
    super.initState();
    savedToken = tokeny;
    currController = controller1;
    sendVerification();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Padding(
        padding: EdgeInsets.only(left: 0.0, right: 2.0),
        child: Container(
          color: Colors.transparent,
        ),
      ),
      numberField(controller: controller6),
      numberField(controller: controller5),
      numberField(controller: controller4),
      numberField(controller: controller3),
      numberField(controller: controller2),
      numberField(controller: controller1),
      Padding(
        padding: EdgeInsets.only(left: 2.0, right: 0.0),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: BottomTheme(
        child: Column(
          children: <Widget>[
            HeaderTheme(),
            Spacer(flex: 2),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: textWidget(
                stringText: 'الرجاء إدخال رمز التأكيد المرسل الى هاتفك',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Spacer(flex: 1),
            GridView.count(
              crossAxisCount: 8,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              children: List<Container>.generate(
                8,
                (int index) => Container(
                  child: widgetList[index],
                ),
              ),
            ),
            Spacer(flex: 1),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      top: 16.0,
                      right: 8.0,
                      bottom: 0.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        numberButton(
                          text: "1",
                          onpressed: () => inputTextToField("1"),
                        ),
                        numberButton(
                          text: "2",
                          onpressed: () => inputTextToField("2"),
                        ),
                        numberButton(
                          text: "3",
                          onpressed: () => inputTextToField("3"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      top: 4.0,
                      right: 8.0,
                      bottom: 0.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        numberButton(
                          text: "4",
                          onpressed: () => inputTextToField("4"),
                        ),
                        numberButton(
                          text: "5",
                          onpressed: () => inputTextToField("5"),
                        ),
                        numberButton(
                          text: "6",
                          onpressed: () => inputTextToField("6"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      top: 4.0,
                      right: 8.0,
                      bottom: 0.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        numberButton(
                          text: "7",
                          onpressed: () => inputTextToField("7"),
                        ),
                        numberButton(
                          text: "8",
                          onpressed: () => inputTextToField("8"),
                        ),
                        numberButton(
                          text: "9",
                          onpressed: () => inputTextToField("9"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      top: 4.0,
                      right: 8.0,
                      bottom: 0.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () => deleteText(),
                          child: Icon(
                            Icons.backspace_outlined,
                            size: 25.0,
                          ),
                        ),
                        numberButton(
                          text: "0",
                          onpressed: () => inputTextToField("0"),
                        ),
                        MaterialButton(
                          onPressed: complete ? verifyCode : null,
                          child: Icon(
                            Icons.check_circle,
                            color: complete ? Colors.green : Colors.grey,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 1),
            Row(
              children: [
                Spacer(flex: 1),
                TextButton(
                  child: textWidget(stringText: 'إعادة الارسال مرة اخرى'),
                  onPressed: sendVerification,
                ),
                Spacer(flex: 1),
                TextButton(
                  child: textWidget(
                    stringText: 'تخطي',
                    //fontSize: 24,
                  ),
                  onPressed: () {
                    if (providers) {
                      Get.offNamed(Routes.SELECT_PROFESSION_SCREEN);
                    }
                    if (!providers) {
                      Get.offAllNamed(Routes.HOME);
                    }
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
            Spacer(flex: 2),
            // Image.asset(
            //     footerIMG,
            //     fit: BoxFit.cover,
            //     height: 60,
            //     width: MediaQuery.of(context).size.width,
            //   )
          ],
        ),
      ),
    );
  }

  void inputTextToField(String str) {
    List<TextEditingController> controllers = [
      controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6
    ];

    if (currController == controller6) {
      controller6.text = str;
      currController = controller6;
      setState(() {
        complete = true;
      });
      return;
    }
    for (int i = 0; i < 6; i++) {
      if (currController == controllers[i]) {
        controllers[i].text = str;
        currController = controllers[i + 1];
        break;
      }
    }
  }

  void deleteText() {
    List<TextEditingController> controllers = [
      controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6
    ];

    if (currController.text.isEmpty) {
    } else {
      currController.text = "";
      currController = controller6;
      setState(() {
        complete = false;
      });
      return;
    }
    if (currController == controller1) {
      controller1.text = "";
    } else {
      for (int i = 1; i < 6; i++) {
        if (currController == controllers[i]) {
          controllers[i - 1].text = "";
          currController = controllers[i - 1];
        }
      }
    }
  }

  void alertMatchOtp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: textWidget(
                stringText: "فشل التطابق",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              content: textWidget(
                stringText: "يرجى التحقق من الرمز وإعادة إدخاله",
                color: Colors.black,
                fontSize: 16,
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        child: textWidget(
                          stringText: "موافق",
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  verifyCode() async {
    String otp = controller6.text +
        controller5.text +
        controller4.text +
        controller3.text +
        controller2.text +
        controller1.text;
    var headers = {'Authorization': 'Bearer $savedToken'};
    var request = http.Request(
      'GET',
      Uri.parse('$url/verify_code/${int.parse(otp)}'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 && tokeny != null) {
      print('response.statusCode = ${response.statusCode}');
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      var dataMap = data["success"];
      print(dataMap);

      if (dataMap == 'true') {
        setState(() {
          success = true;
        });
        if (providers) {
          Get.offNamed(Routes.SELECT_PROFESSION_SCREEN);
        }
        if (!providers) {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } else {
      alertMatchOtp();
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      print('response.statusCode = $data');
    }
  }

  void sendVerification() async {
    var headers = {'Authorization': 'Bearer $savedToken'};
    var request = http.Request(
      'GET',
      Uri.parse('$url/send_verification_code'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 && tokeny != null) {
      print('response.statusCode = ${response.statusCode}');
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      // var dataMap = data[0];
    } else {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      print('response.statusCode = $data');
    }
  }
}
