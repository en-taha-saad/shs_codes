// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'dart:io';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/main.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  bool appearError = false;
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  bool hidePassword = true;
  String error = '';

  bool? success;
  int? providerParentId;
  Future getData() async {
    error = '';
    setState(() {});
    try {
      var request = http.Request(
        'POST',
        Uri.parse('$url/login_professional_account'),
      );
      print('response1 = ${request.persistentConnection}');
      request.bodyFields = {
        'username': '${usernameController.text}',
        'password': '${userpasswordController.text}',
      };
      request.headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = jsonDecode(await response.stream.bytesToString());
        var dataMap = data['data'];
        storedToken.write('token', dataMap['token']);
        savedToken = storedToken.read('token');
        print('@login_professional_account@savedToken = $savedToken');
        error = '';
        success = true;
        setState(() {});
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        var dataMap = data['data'];
        var successData = data['success'];
        if (usernameController.text.isNotEmpty &&
            userpasswordController.text.isNotEmpty) {
          if (dataMap == 'the username is not registerd in our db') {
            error = 'اسم المستخدم خاطئ';
            setState(() {});
          }
          if (dataMap == 'Wrong password') {
            error = 'كلمة السر خطأ';
            setState(() {});
          }
        } else {
          error = 'يرجى ملئ المعلومات';
          setState(() {});
        }

        setState(() {
          success = successData;
        });
      }
    } on SocketException catch (error1) {
      error = 'يرجى الاتصال بالانترنت';
      print('error1 = $error1');
      return false;
    }
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;

        if (success == true) {
          print('success8 value is $success');

          setState(() {
            stateTextWithIcon = ButtonState.success;
          });
        } else {
          print('success9 value is $success');

          setState(() {
            stateTextWithIcon = ButtonState.fail;
          });
        }

        if (stateTextWithIcon == ButtonState.success) {
          Future.delayed(Duration(seconds: 1), () {
            fetchParentProfile();
            Get.offNamed(Routes.DOCTOR_DASHBOARD);
          });
        }
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
      print('success10 value is $success');
    });
    print('success11 value is $success');
  }

  Widget buildTextWithIcon() {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
          text: "تسجيل الدخول",
          icon: Icon(Icons.send, color: Colors.white),
          color: generalColor,
        ),
        ButtonState.loading: IconedButton(
          text: "إنتظار",
          color: generalColor,
        ),
        ButtonState.fail: IconedButton(
          text: "فشل",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300,
        ),
        ButtonState.success: IconedButton(
          text: "نجاح",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400,
        ),
      },
      maxWidth: 300.0,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: Colors.white,
        strokeWidth: 1,
      ),
      minWidth: 100.0,
      height: 45.0,
      radius: 5.0,
      progressIndicatorSize: 25.0,
      textStyle: style(
        fontSize: 15,
        color: Colors.white,
      ),
      onPressed: () {
        stateTextWithIcon = ButtonState.loading;
        FocusScope.of(context).unfocus();
        setState(() {});
        getData().then((value) {
          stateTextWithIcon = ButtonState.idle;
          setState(() {});
          onPressedIconWithText();
        });
      },
      state: stateTextWithIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: 'لتأكيد الرجوع يرجى الضغط مرتين على الرجوع',
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: BottomTheme(
                  child: Column(
                    children: [
                      HeaderTheme(),
                      Spacer(),
                      textWidget(
                          stringText:
                              'الدخول الخاص للحسابات المهنية\n    للمؤسسات والكوادر '
                              'الصحية',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: textWidget(
                          stringText:
                              'تمتع بخدمات التحول الرقمي للرعاية الصحية الذكية',
                          color: Colors.pinkAccent,
                          fontSize: 20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(flex: 1),
                      Image.asset(
                        "assets/onle_for_second_app/doctor/doctorSignIn.jpg",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width - 100,
                      ),
                      Spacer(flex: 1),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          right: 50,
                          left: 50,
                        ),
                        height: SizeConfig().heightSize(context, 8),
                        child: FormBuilderTextField(
                          obscureText: false,
                          controller: usernameController,
                          name: 'usernameOrPhone',
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.disabled,
                          enabled: true,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'رقم الهاتف او اسم المستخدم',
                            labelStyle: style(fontSize: 12),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                          right: 50,
                          left: 50,
                        ),
                        height: SizeConfig().heightSize(context, 8),
                        child: FormBuilderTextField(
                          controller: userpasswordController,
                          obscureText: hidePassword,
                          name: 'password',
                          keyboardType: TextInputType.text,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: 'يرجى ملئ الحقل',
                            ),
                            FormBuilderValidators.match(
                              context,
                              "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$",
                              errorText:
                                  'يجب ان يحتوي الرمز على حرف كبير , رمز, رقم  , ولا يقل عن 8',
                            ),
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          enabled: true,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'كلمة السر',
                            errorMaxLines: 2,
                            errorStyle: style(
                              fontSize: 10,
                              color: Colors.red,
                            ),
                            labelStyle: style(fontSize: 12),
                            suffix: IconButton(
                                icon: Icon(
                                  hidePassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () => setState(() {
                                      hidePassword = !hidePassword;
                                    })),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          child: textWidget(
                            stringText: 'نسيت اسم المستخدم او كلمة السر',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      buildTextWithIcon(),
                      Container(
                        child: Row(
                          children: <Widget>[
                            textWidget(
                              stringText: 'ليس لديك حساب مهني!',
                              fontSize: 15,
                            ),
                            TextButton(
                              child: textWidget(
                                stringText: 'سجل الآن',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Get.to(() => BetweenPagesScreenView());
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: textWidget(
                          stringText: '$error',
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BetweenPagesScreenView extends GetView<SigninController> {
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
            flexibleSpace: HeaderTheme(),
          ),
          backgroundColor: Colors.white,
          body: BottomTheme(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  textWidget(
                      stringText: "التسجيل في منظومة الرعاية الصحية",
                      fontSize: 20,
                      color: generalColor,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/onle_for_second_app/doctor/doctorSignUp.png",
                      width: MediaQuery.of(context).size.width - 100,
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.red, width: 4),
                      color: Colors.red,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(30)),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                      ),
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 500), () async {
                          Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_IN);
                        });
                      },
                      child: textWidget(
                        stringText: 'إنشاء حساب مهني',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.blue, width: 4),
                      color: Colors.blue,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(EdgeInsets.all(30)),
                      ),
                      onPressed: () =>
                          Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_UP),
                      child: textWidget(
                        stringText: 'لا تمتلك حساب شخصي , بدأ التسجيل',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
