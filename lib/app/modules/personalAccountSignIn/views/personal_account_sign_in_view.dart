// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class PersonalAccountSignInView extends StatefulWidget {
  const PersonalAccountSignInView({Key? key}) : super(key: key);

  @override
  _PersonalAccountSignInViewState createState() =>
      _PersonalAccountSignInViewState();
}

///

class _PersonalAccountSignInViewState extends State<PersonalAccountSignInView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool appearError = false;
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  bool hidePassword = true;
  String error = '';

  bool? success;

  getData() async {
    try {
      var request = http.Request('POST', Uri.parse('$url/login'));
      print('response1 = ${request.persistentConnection}');
      request.bodyFields = {
        'phone':
            '+964${phoneController.text.startsWith('0') ? phoneController.text.toString().substring(1) : phoneController.text}',
        'password': '${passwordController.text}',
      };
      request.headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        error = '';
        var data = jsonDecode(await response.stream.bytesToString());
        var dataMap = data['data'];
        storedToken.write('token', dataMap['token']);
        savedToken = storedToken.read('token');
        setState(() {
          success = true;
        });
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        var dataMap = data['data'];
        var successData = data['success'];
        if (phoneController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          if (dataMap != 'Wrong password') {
            error = dataMap['phone'][0];
            error = 'رقم الهاتف خاطئ';
          }
          if (dataMap == 'Wrong password') {
            error = 'كلمة السر خطأ';
          }
        } else {
          error = 'يرجى ملئ المعلومات';
        }

        setState(() {
          success = successData;
        });
      }
      // ignore: unused_catch_clause
    } on SocketException catch (error1) {
      error = 'يرجى الاتصال بالانترنت';
      return false;
    }
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;

        if (success == true) {
          setState(() {
            stateTextWithIcon = ButtonState.success;
          });
        } else {
          setState(() {
            stateTextWithIcon = ButtonState.fail;
          });
        }

        if (stateTextWithIcon == ButtonState.success) {
          Future.delayed(Duration(seconds: 1), () {
            fetchParentProfile();
            getBarcode();
            if (providers) {
              Get.toNamed(Routes.SELECT_PROFESSION_SCREEN);
            }
            if (!providers) {
              Get.offAllNamed(Routes.HOME);
            }
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
    });
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
      // animationEnd: ,
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
        getData();
        FocusScope.of(context).unfocus();
        setState(() {
          stateTextWithIcon = ButtonState.loading;
        });
        Future.delayed(Duration(milliseconds: 3000), () {
          setState(() {
            stateTextWithIcon = ButtonState.idle;
          });
          onPressedIconWithText();
        });
      },
      state: stateTextWithIcon,
    );
  }

  // 6517894853
  // Tt@2qweras
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Image.asset(
                    headerIMG,
                    fit: BoxFit.cover,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Spacer(flex: 1),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: textWidget(
                      stringText: 'تسجيل الدخول كمستخدم',
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  if (providers)
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: textWidget(
                        stringText: 'لأكمال تسجيل الكوادر',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  Image.asset(
                    "assets/general_for_two_apps/sign_in/login-banner.png",
                    fit: BoxFit.fitHeight,
                    // width: MediaQuery.of(context).size.width-100,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  // Spacer(flex: 1),
                  Container(
                      alignment: Alignment.center,
                      child: textWidget(
                        stringText: appearError
                            ? 'الرجاء إدخال رقم او كلمة سر صحيحة'
                            : '',
                        color: Colors.red,
                        fontSize: 15,
                      )),
                  // Spacer(flex: 1),
                  // phone
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      right: 50,
                      left: 50,
                    ),
                    child: FormBuilderTextField(
                      maxLength: 10,
                      controller: phoneController,
                      obscureText: false,
                      name: 'phone',
                      // initialValue: "kkkkk",
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.integer(
                          context,
                          errorText: 'يرجى إدخال ارقام فقط',
                        ),
                        FormBuilderValidators.maxLength(
                          context,
                          10,
                          errorText: 'يجب ان لا يزيد الرقم عن 10 رقم',
                        ),
                        FormBuilderValidators.minLength(
                          context,
                          10,
                          errorText: 'يجب ان لا يقل الرقم عن 10 رقم',
                        ),
                        (String? primaryPhone) {
                          if (!(primaryPhone!.startsWith('75') ||
                              primaryPhone.startsWith('77') ||
                              primaryPhone.startsWith('78') ||
                              primaryPhone.startsWith('79'))) {
                            return ("يجب إدخال رقم عراقي");
                          }
                        }
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // onChanged: onChanged,
                      // initialValue: '',
                      enabled: true,
                      enableInteractiveSelection: true,
                      onSaved: (input) => input,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'الرقم',
                        errorMaxLines: 2,
                        errorStyle: style(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                        labelStyle: style(fontSize: 12),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: generalColor,
                        ),
                        suffix: textWidget(stringText: '+964'),
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
                            color: generalColor,
                            width: 1,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: generalColor),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  // password
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      right: 50,
                      left: 50,
                    ),
                    child: FormBuilderTextField(
                      controller: passwordController,
                      obscureText: hidePassword,
                      name: 'password',
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.match(
                          context,
                          "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$",
                          errorText:
                              'يجب ان يحتوي الرمز على حرف كبير , رمز, رقم , ولا يقل عن 8',
                        ),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // onChanged: onChanged,
                      // initialValue: '',
                      enabled: true,
                      enableInteractiveSelection: true,
                      onSaved: (input) => input,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'كلمة السر',
                        errorMaxLines: 2,
                        errorStyle: style(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                        labelStyle: style(fontSize: 12),
                        prefixIcon: Icon(
                          Icons.password,
                          color: generalColor,
                        ),
                        suffixIcon: IconButton(
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
                            color: generalColor,
                            width: 1,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: generalColor),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(generalColor),
                    ),
                    child: textWidget(
                      stringText: 'نسيت كلمة السر',
                      fontSize: 15,
                    ),
                  ),
                  buildTextWithIcon(),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            textWidget(
                              stringText: 'ليس لديك حساب؟',
                              fontSize: 15,
                            ),
                            TextButton(
                              child: textWidget(
                                stringText: 'سجل الآن',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.PERSONAL_ACCOUNT_SIGN_UP);
                              },
                            ),
                            // textWidget(
                            //   stringText: 'او',
                            //   fontSize: 15,
                            // ),
                            // TextButton(
                            //   child: textWidget(
                            //     stringText: 'دخول كضيف',
                            //     fontSize: 15,
                            //     color: generalColor,
                            //   ),
                            //   onPressed: () {
                            //     Get.toNamed(Routes.HOME);
                            //   },
                            // )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  textWidget(
                    stringText: '$error',
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(flex: 1),
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
        ),
      ),
    );
  }
}
