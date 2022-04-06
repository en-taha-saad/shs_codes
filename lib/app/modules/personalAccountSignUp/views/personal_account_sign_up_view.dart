// ignore_for_file: unnecessary_string_interpolations, unnecessary_string_escapes, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/container_element.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/controllers/fetch_data.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/address.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/textfieldform.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';


class PersonalAccountSignUpView extends StatefulWidget {
  @override
  _PersonalAccountSignUpView createState() => _PersonalAccountSignUpView();
}

class _PersonalAccountSignUpView extends State<PersonalAccountSignUpView> {
  Future httpPost() async {
    try {
      debugPrint('sendEmail() = ${sendEmail()}');
      setState(() => text = '');
      Map<String, dynamic> json = {
        "patient": {
          "first_name": "${firstNameController.text}",
          "second_name": "${secondNameController.text}",
          "sure_name": "${thirdNameController.text}",
          "en_first_name": "${enFirstNameController.text}",
          "en_second_name": "${enSecondNameController.text}",
          "en_sure_name": "${enThirdNameController.text}",
          "date_of_birth": "$date",
          "sex": "$genderSex",
          "independent": 1
        },
        "addresses": sendAddress(),
        "nationalities": sendNationality(),
        "handicaps": multiSelectedHandicapsId,
        "chronic_diseases": multiSelectedChronicDiseasesId,
        "phones": sendPhone(),
        "emails": sendEmail(),
        "password": "${passwordController.text}"
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$url/register',
        ),
      );
      request.fields.addAll({'json': jsonEncode(json)});

      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', image!),
        );
      }

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print('121212121212121');
        var dataMapConvert = jsonDecode(await response.stream.bytesToString());
        storedToken.write('token', dataMapConvert['data']['token']);
        setState(() {
          personalIdDrawer = dataMapConvert['data']['patient']['personal_id'];
          success = true;
        });
      } else {
        var dataMapConvert = jsonDecode(await response.stream.bytesToString());
        String dataError = "${dataMapConvert['data']}";
        if (dataError.contains('email')) {
          text = 'الايميل مستخدم مسبقا';
        }
        if (dataError.contains('phone')) {
          text = 'رقم الهاتف مستخدم مسبقا';
        }
        success = false;
        setState(() {});
      }
    } on SocketException {
      setState(() {
        success = false;
      });
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      setState(() {
        success = false;
      });
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      setState(() {
        success = false;
      });
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  void onPressedIconWithText() {
    print('success6 value is $success');

    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        print('success7 value is $success');
        if (success == true) {
          print('success8 value is $success');

          setState(() {
            stateTextWithIcon = ButtonState.success;
          });
          if (stateTextWithIcon == ButtonState.success) {
            Future.delayed(Duration(seconds: 2), () {
              Get.offNamed(Routes.OTP);
            });
          }
        } else {
          print('success9 value is $success');
          setState(() {
            stateTextWithIcon = ButtonState.fail;
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
          text: "تسجيل",
          icon: Icon(Icons.send, color: Colors.white),
          color: registerButtonColor,
        ),
        ButtonState.loading: IconedButton(
          text: "إنتظار",
          color: registerButtonColor,
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
      maxWidth: 110.0,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: Colors.white,
        strokeWidth: 1,
      ),
      minWidth: 50.0,
      height: 39.0,
      radius: 5.0,
      progressIndicatorSize: 25.0,
      textStyle: style(
        fontSize: 15,
        color: Colors.white,
      ),
      onPressed: () {
        if (agree == true) {
          registerButtonColor = Colors.blue;
          stateTextWithIcon = ButtonState.loading;
          httpPost().then((value) {
            stateTextWithIcon = ButtonState.idle;
            onPressedIconWithText();
          });

          setState(() {});
        } else {
          print('agree = $agree');
          setState(() {
            text = 'يجب الموافقة على الشروط والأحكام';
          });
        }
      },
      state: stateTextWithIcon,
    );
  }

  var formKey = GlobalKey<FormBuilderState>();
  StepState step1State = StepState.editing;
  StepState step2State = StepState.editing;
  StepState step3State = StepState.editing;
  bool agree = false;
  Widget? nextButton;
  var registerButtonColor = Colors.grey;
  String? date;
  String? dateError = '';
  bool isDateEnter = false;

  bool hidePassword = true;

  var backgroundColor = MaterialStateProperty.all(Colors.blue);
  var backgroundColor2 = MaterialStateProperty.all(Colors.grey);
  int _currentstep = 0;

  onStepback() {
    if (_currentstep == 0) {
    } else if (_currentstep == 1) {
      setState(() {
        step1State = StepState.editing;
        backgroundColor2 = MaterialStateProperty.all(Colors.grey);
        _currentstep--;
      });
    } else if (_currentstep == 2) {
      setState(() {
        text = '';
        nextButtonStyle();
        stateTextWithIcon = ButtonState.idle;
        step3State = StepState.editing;
        step2State = StepState.editing;
        if (backgroundColor == MaterialStateProperty.all(Colors.blue)) {
          backgroundColor = MaterialStateProperty.all(Colors.grey);
        } else {
          backgroundColor = MaterialStateProperty.all(Colors.blue);
        }
        agree = false;
        setState(() {});
        _currentstep--;
      });
    }
  }

  onStepContinue() {
    debugPrint('11111111111');
    genderFunc();
    if (_currentstep == 0) {
      debugPrint('2222222222222');
      print('date = $date');
      setState(() {
        backgroundColor2 = MaterialStateProperty.all(Colors.blue);
        if (!formKey.currentState!.saveAndValidate()) {
          print(formKey.currentState!.value);
          debugPrint('333333333333');
          step1State = StepState.error;
          dateError = 'يرجى تحديد تاريخ الميلاد';
        } else {
          debugPrint('4444444444444');
          if (isDateEnter == true) {
            debugPrint('555555555555');
            debugPrint('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
            backgroundColor2 = MaterialStateProperty.all(Colors.blue);
            _currentstep++;
            step1State = StepState.complete;
          } else {
            debugPrint('555555555555');
            dateError = 'يرجى تحديد تاريخ الميلاد';
          }
        }
      });
    } else if (_currentstep == 1) {
      setState(() {
        registerButtonColor = Colors.grey;
        if (!formKey.currentState!.saveAndValidate()) {
          step2State = StepState.error;
        } else {
          text = '';
          stateTextWithIcon = ButtonState.idle;
          setState(() {});
          registerButtonColor = Colors.grey;
          _currentstep++;
          backgroundColor = MaterialStateProperty.all(Colors.grey);

          registerButtonColor = Colors.grey;
          step2State = StepState.complete;
        }
      });
    } else if (_currentstep == 2) {
      if (agree == true) {
        setState(() {
          registerButtonColor = Colors.grey;
        });
      }
    }
  }

  Widget? nextButtonStyle() {
    nextButton = TextButton(
      style: ButtonStyle(
        backgroundColor: backgroundColor,
      ),
      onPressed: onStepContinue,
      child: textWidget(
        stringText: "التالي",
        color: Colors.white,
        fontSize: 15,
      ),
    );
    return nextButton;
  }

  final ImagePicker _picker = ImagePicker();
  String? genderSex;
  String? gender;
  bool? success;
  String? text = '';
  List<GetDataModel> multiSelectedHandicapsString = [];
  List<GetDataModel> multiSelectedChronicDiseasesString = [];

  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;

  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController thirdNameController;
  late TextEditingController enFirstNameController;
  late TextEditingController enSecondNameController;
  late TextEditingController enThirdNameController;
  late TextEditingController primaryPhoneController;
  late TextEditingController secondPhoneController;
  late TextEditingController primaryEmailController;
  late TextEditingController secondEmailController;
  late TextEditingController passwordController;
  int? nationality1ID;
  String? nationality1Name;
  int? nationality2ID;
  String? nationality2Name;
  int? country1ID = 106;
  String? country1Name;
  int? governorate1ID;
  String? governorate1Name;
  int? city1ID;
  String? city1Name;
  int? destrict1ID;
  String? destrict1Name;
  int? country2ID;
  String? country2Name;
  int? governorate2ID;
  String? governorate2Name;
  int? city2ID;
  String? city2Name;
  int? destrict2ID;
  String? destrict2Name;
  int? chronicDiseasesID;
  String? chronicDiseasesName;
  int? handicapsID;
  String? handicapsName;
  bool selectedItem = false;
  bool goToProfile = true;
  GetDataModel? selectedNationality1String;
  GetDataModel? selectedNationality2String;
  GetDataModel? selectedCountry1;
  GetDataModel? selectedCountry2;
  GetDataModel? selectedGovernorate1;
  GetDataModel? selectedGovernorate2;
  GetDataModel? selectedCity1;
  GetDataModel? selectedCity2;
  GetDataModel? selectedDestrict1;
  GetDataModel? selectedDestrict2;
  GetDataModel? selectedHandicapsString;
  GetDataModel? selectedChronicDiseasesString;
  List<int?> multiSelectedHandicapsId = [];
  List<int?> multiSelectedChronicDiseasesId = [];
  String? image;
  bool email1NotWritten = false;
  @override
  void initState() {
    super.initState();
    nextButtonStyle();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    thirdNameController = TextEditingController();
    enFirstNameController = TextEditingController();
    enSecondNameController = TextEditingController();
    enThirdNameController = TextEditingController();
    primaryPhoneController = TextEditingController();
    secondPhoneController = TextEditingController();
    primaryEmailController = TextEditingController();
    secondEmailController = TextEditingController();
    passwordController = TextEditingController();
  }

  genderFunc() {
    if (gender == 'ذكر') {
      genderSex = 'male';
    } else if (gender == 'انثى') {
      genderSex = 'female';
    } else {
      genderSex = '';
    }
  }

  sendAddress() {
    if (governorate2ID == null) {
      return [
        {
          "region_id": destrict1ID ?? '',
          "city_id": city1ID,
          "governorate_id": governorate1ID,
          "country_id": country1ID,
        }
      ];
    }
    return [
      {
        "region_id": destrict1ID ?? '',
        "city_id": city1ID,
        "governorate_id": governorate1ID,
        "country_id": country1ID,
      },
      {
        "region_id": destrict2ID ?? '',
        "city_id": city2ID,
        "governorate_id": governorate2ID,
        "country_id": country2ID,
      }
    ];
  }

  sendPhone() {
    if (secondPhoneController.text.isEmpty) {
      print('aaaaa11111111111111111');
      return [
        {
          "phone":
              "+964${primaryPhoneController.text.startsWith('0') ? primaryPhoneController.text.toString().substring(1) : primaryPhoneController.text}",
          "primary": 1,
        }
      ];
    } else {
      print('aaaa2222222222222222');
      return [
        {
          "phone":
              "+964${primaryPhoneController.text.startsWith('0') ? primaryPhoneController.text.toString().substring(1) : primaryPhoneController.text}",
          "primary": 1,
        },
        {
          "phone":
              "+964${secondPhoneController.text.startsWith('0') ? secondPhoneController.text.toString().substring(1) : secondPhoneController.text}",
          "primary": 0,
        }
      ];
    }
  }

  sendEmail() {
    if (primaryEmailController.text.isNotEmpty) {
      if (secondEmailController.text.isNotEmpty) {
        return [
          {
            "email": "${primaryEmailController.text}",
            "primary": 1,
          },
          {
            "email": "${secondEmailController.text}",
            "primary": 0,
          }
        ];
      } else {
        return [
          {
            "email": "${primaryEmailController.text}",
            "primary": 1,
          }
        ];
      }
    } else {
      if (secondEmailController.text.isNotEmpty) {
        return [
          {
            "email": "${secondEmailController.text}",
            "primary": 1,
          }
        ];
      } else {
        return [];
      }
    }
  }

  sendNationality() {
    if (nationality2ID == null) {
      return [nationality1ID];
    }
    return [nationality1ID, nationality2ID];
  }

  Widget controlsBuilder(
    BuildContext context,
    details,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _currentstep == 0 || _currentstep == 1
            ? TextButton(
                onPressed: details.onStepCancel,
                child: textWidget(
                  stringText: 'رجوع',
                  color: Colors.white,
                  fontSize: 15,
                ),
                style: ButtonStyle(
                  backgroundColor: backgroundColor2,
                ),
              )
            : Container(),
        _currentstep == 0 || _currentstep == 1
            ? nextButtonStyle()!
            : Container(),
      ],
    );
  }

  Future<dynamic> termsAndConditionDialog() {
    return Get.defaultDialog(
        title: "شروط وأحكام التسجيل",
        titleStyle: style(
          fontSize: 25,
          color: generalColor,
        ),
        backgroundColor: Colors.white,
        barrierDismissible: true,
        titlePadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.all(20),
        content: Container(
          height: MediaQuery.of(context).size.height - 250,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(children: [
              conditions(),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: agree,
              //       onChanged: (value) {
              //         setState(() {
              //           agree = value!;
              //           print(value);
              //           // print(agree);
              //           // backgroundColor = agree
              //           //     ? MaterialStateProperty.all(Colors.blue)
              //           //     : MaterialStateProperty.all(Colors.grey);
              //           // registerButtonColor =
              //           // agree ? Colors.blue : Colors.grey;
              //         });
              //       },
              //     ),
              //
              //     InkWell(
              //       child: textWidget(
              //         stringText: 'لقد قرأت ووافقت على '
              //             'الشروط والأحكام',
              //         color: generalColor,
              //       ),
              //     ),
              //   ],
              // )
              // StatefulBuilder(  // You need this, notice the parameters below:
              // builder: (BuildContext context, StateSetter setState) {
              // return Row(
              //   children: [
              //     Checkbox(
              //       value: agree,
              //       onChanged: (value) {
              //         setState(() {
              //           agree = value!;
              //           print(value);
              //           // print(agree);
              //           // backgroundColor = agree
              //           //     ? MaterialStateProperty.all(Colors.blue)
              //           //     : MaterialStateProperty.all(Colors.grey);
              //           // registerButtonColor =
              //           // agree ? Colors.blue : Colors.grey;
              //         });
              //       },
              //     ),
              //     InkWell(
              //       child: textWidget(
              //         stringText: 'لقد قرأت ووافقت على '
              //             'الشروط والأحكام',
              //         color: generalColor,
              //       ),
              //     ),
              //   ],
              // );})
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    width: 120,
                    height: 50,
                    color: generalColor,
                    child: TextButton(
                        onPressed: () {
                          text = '';
                          setState(() {
                            agree = true;
                          });
                          Navigator.pop(context);
                          registerButtonColor =
                              agree ? Colors.blue : Colors.grey;
                        },
                        child: textWidget(
                          stringText: "موافق",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        )),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: generalColor,
                      ),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: TextButton(
                        onPressed: () {
                          text = 'يجب الموافقة على الشروط والاحكام';

                          setState(() {
                            agree = false;
                          });
                          Navigator.pop(context);
                          registerButtonColor =
                              agree ? Colors.blue : Colors.grey;
                        },
                        child: textWidget(
                          stringText: "غير موافق",
                          color: generalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
              SizedBox(
                height: 40,
              )
            ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  headerIMG,
                  fit: BoxFit.cover,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            title: Center(
              child: Container(
                child: Row(
                  children: <Widget>[
                    textWidget(
                      stringText: 'إنشاء حساب جديد',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        textWidget(
                            stringText: 'لديك حساب بالفعل',
                            color: Colors.black,
                            fontSize: 12),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: textWidget(
                            stringText: 'تسجيل الدخول',
                            fontSize: 12,
                            color: generalColor,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.SIGNIN);
                          },
                        )
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    footerIMG,
                    fit: BoxFit.cover,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                FormBuilder(
                  key: formKey,
                  skipDisabled: true,
                  child: Container(
                    child: Stepper(
                      elevation: 0,
                      onStepTapped: null,
                      physics: ScrollPhysics(),
                      type: StepperType.horizontal,
                      steps: steps,
                      currentStep: _currentstep,
                      onStepContinue: onStepContinue,
                      onStepCancel: onStepback,
                      controlsBuilder: controlsBuilder,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Step> get steps {
    return [
      Step(
        title: textWidget(stringText: 'المعلومات الشخصيه', fontSize: 12),
        isActive: _currentstep == 0,
        state: step1State,
        content: Container(
          child: Column(
            children: <Widget>[
              /// name ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig().widthSize(context, 25),
                        height: SizeConfig().heightSize(context, 17),
                        child: textWidget(
                          stringText: 'الإسم الاول*',
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        width: SizeConfig().widthSize(context, 25),
                        height: SizeConfig().heightSize(context, 18),
                        child: textWidget(
                          stringText: 'إسم الأب*',
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        width: SizeConfig().widthSize(context, 25),
                        height: SizeConfig().heightSize(context, 7),
                        child: textWidget(
                          stringText: 'إسم اللقب او الجد*',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          TextFieldForm(
                            height: SizeConfig().heightSize(context, 8),
                            controller: firstNameController,
                            icons: Icons.person,
                            obscureText: false,
                            name: 'first_name',
                            keyboardType: TextInputType.name,
                            labelText: 'الإسم الاول بالعربي',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: textfieldErrorText,
                              ),
                              FormBuilderValidators.maxLength(
                                context,
                                25,
                                errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                              ),
                              FormBuilderValidators.minLength(
                                context,
                                2,
                                errorText: 'يجب ان لا يقل الإسم عن حرفين',
                              ),
                              FormBuilderValidators.match(
                                context,
                                '^[\u0621-\u064A\040 ]+\$',
                                errorText: 'يسمح بحروف عربية ومسافة فقط',
                              ),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          TextFieldForm(
                            controller: enFirstNameController,
                            icons: Icons.person,
                            obscureText: false,
                            labelText: 'الإسم الاول بالإنكليزي',
                            name: 'en_first_name',
                            keyboardType: TextInputType.name,
                            validator: (String? englishFirstName) {
                              if (englishFirstName!.isNotEmpty) {
                                print('englishFirstName = $englishFirstName');
                                RegExp regExp = RegExp('^[a-zA-Z][a-zA-Z ]+\$');
                                if (!regExp.hasMatch(englishFirstName)) {
                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                }
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextFieldForm(
                            height: SizeConfig().heightSize(context, 8),
                            controller: secondNameController,
                            icons: Icons.person,
                            obscureText: false,
                            name: 'second_name',
                            keyboardType: TextInputType.name,
                            labelText: 'إسم الأب بالعربي',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: textfieldErrorText,
                              ),
                              FormBuilderValidators.maxLength(
                                context,
                                25,
                                errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                              ),
                              FormBuilderValidators.minLength(
                                context,
                                2,
                                errorText: 'يجب ان لا يقل الإسم عن حرفين',
                              ),
                              FormBuilderValidators.match(
                                context,
                                '^[\u0621-\u064A\040 ]+\$',
                                errorText: 'يسمح بحروف عربية ومسافة فقط',
                              ),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          TextFieldForm(
                            controller: enSecondNameController,
                            icons: Icons.person,
                            obscureText: false,
                            labelText: 'إسم الأب بالإنكليزي',
                            name: 'en_second_name',
                            keyboardType: TextInputType.name,
                            validator: (String? englishSecondName) {
                              if (englishSecondName!.isNotEmpty) {
                                print('englishFirstName = $englishSecondName');
                                RegExp regExp = RegExp('^[a-zA-Z][a-zA-Z ]+\$');
                                if (!regExp.hasMatch(englishSecondName)) {
                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                }
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextFieldForm(
                            height: SizeConfig().heightSize(context, 8),
                            controller: thirdNameController,
                            icons: Icons.person,
                            obscureText: false,
                            name: 'third_name',
                            keyboardType: TextInputType.name,
                            labelText: 'الجد او اللقب بالعربي',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: textfieldErrorText,
                              ),
                              FormBuilderValidators.maxLength(
                                context,
                                25,
                                errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                              ),
                              FormBuilderValidators.minLength(
                                context,
                                2,
                                errorText: 'يجب ان لا يقل الإسم عن حرفين',
                              ),
                              FormBuilderValidators.match(
                                context,
                                '^[\u0621-\u064A\040 ]+\$',
                                errorText: 'يسمح بحروف عربية ومسافة فقط',
                              ),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          TextFieldForm(
                            controller: enThirdNameController,
                            icons: Icons.person,
                            obscureText: false,
                            name: 'en_third_name',
                            keyboardType: TextInputType.name,
                            labelText: 'الجد او اللقب بالإنكليزي',
                            validator: (String? englishSurName) {
                              if (englishSurName!.isNotEmpty) {
                                print('englishFirstName = $englishSurName');
                                RegExp regExp = RegExp('^[a-zA-Z][a-zA-Z ]+\$');
                                if (!regExp.hasMatch(englishSurName)) {
                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                }
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// gender ///
              Container(
                margin: EdgeInsets.only(
                  right: SizeConfig().widthSize(context, 20),
                  bottom: 20,
                ),
                child: FormBuilderRadioGroup<String?>(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (String? selected) {
                    setState(() {
                      if (selected == 'ذكر') {
                        gender = selected;
                      }
                      if (selected == 'انثى') {
                        gender = selected;
                      }
                    });
                  },
                  initialValue: gender,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorStyle: style(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                  wrapSpacing: 100,
                  name: 'gender',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.required(
                    context,
                    errorText: dropdownErrorText,
                  ),
                  options: genderList.map(
                    (String? selection) {
                      return FormBuilderFieldOption(
                        value: selection,
                        child: textWidget(stringText: selection),
                      );
                    },
                  ).toList(),
                  controlAffinity: ControlAffinity.trailing,
                ),
              ),

              /// nationalities ///
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 10),
                          child: textWidget(
                            stringText: 'الجنسية الاولى*',
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 2),
                          child: textWidget(
                            stringText: 'الجنسية الثانية',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DropDownFormField(
                          onFind: (String? filter) =>
                              getData(filter, nationalitiesUrl),
                          onChanged: (GetDataModel? model) {
                            print(model!.name);
                            print(model.id);
                            setState(() {
                              selectedNationality1String = model;
                            });
                            nationality1ID = model.id;
                            nationality1Name = model.name;
                          },
                          selectedItem: selectedNationality1String,
                          validator: FormBuilderValidators.required(
                            context,
                            errorText: dropdownErrorText,
                          ),
                        ),
                        DropDownFormField(
                            onFind: (String? filter) =>
                                getData(filter, nationalitiesUrl),
                            selectedItem: selectedNationality2String,
                            onChanged: (GetDataModel? model) {
                              print(model!.name);
                              print(model.id);
                              setState(() {
                                selectedNationality2String = model;
                              });

                              nationality2ID = model.id;
                              nationality2Name = model.name;
                            },
                            validator: (GetDataModel? Nationality2) {
                              if (selectedNationality1String != null &&
                                  Nationality2 !=
                                      null) if (selectedNationality1String!.id ==
                                  Nationality2.id)
                                return ("يرجى تحديد جنسية اخرى");
                            }
                            // FormBuilderValidators.notEqual(
                            //   context,
                            //   selectedNationality1String!,
                            //   errorText: "يرجى تحديد جنسية اخرى",
                            // ),
                            ),
                      ],
                    ),
                  ],
                ),
              ),

              /// date and personal_picture ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textWidget(stringText: 'تاريخ الميلاد*'),
                      SizedBox(height: 12),
                      TextButton(
                        child: SvgPicture.asset(
                          'assets/general_for_two_apps/icons/date.svg',
                          width: 70,
                          height: 60,
                          fit: BoxFit.fill,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "تاريخ الميلاد",
                            titleStyle: style(fontSize: 25),
                            backgroundColor: Colors.white,
                            barrierDismissible: false,
                            titlePadding: EdgeInsets.all(10),
                            contentPadding: EdgeInsets.all(20),
                            content: Container(
                              height: 250,
                              width: 270,
                              child: CupertinoDatePicker(
                                onDateTimeChanged: (DateTime value) {
                                  date =
                                      '${value.year}-${value.month}-${value.day}';
                                  isDateEnter = true;
                                  setState(() {});
                                },
                                maximumYear: DateTime.now().year - 18,
                                minimumYear: DateTime.now().year - 120,
                                maximumDate: DateTime(
                                  DateTime.now().year - 18,
                                  DateTime.now().month - 0,
                                  DateTime.now().day - 0,
                                ),
                                minimumDate: DateTime(
                                  DateTime.now().year - 120,
                                  DateTime.now().month - 0,
                                  DateTime.now().day - 0,
                                ),
                                initialDateTime:
                                    DateTime(DateTime.now().year - 18),
                                dateOrder: DatePickerDateOrder.dmy,
                                mode: CupertinoDatePickerMode.date,
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: textWidget(
                                  stringText: "الغاء",
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  dateError = 'يرجى تحديد تاريخ الميلاد';
                                  date = null;
                                  isDateEnter = false;
                                  setState(() {});
                                  print(date);
                                  Get.back();
                                },
                              ),
                              TextButton(
                                child: textWidget(
                                  stringText: "تأكيد",
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  if (date != null) {
                                    dateError = null;
                                    isDateEnter = true;
                                  } else {
                                    date = '${DateTime.now().year - 18}-1-1';
                                    isDateEnter = true;
                                  }
                                  Get.back();
                                  setState(() {});
                                  print(date);
                                },
                              )
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      isDateEnter == false
                          ? textWidget(
                              stringText: dateError,
                              color: Colors.red,
                              fontSize: 15,
                            )
                          : textWidget(
                              stringText: date,
                              fontSize: 15,
                            ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_camera),
                            onPressed: () async {
                              setState(() {
                                image = '';
                              });
                              await _picker
                                  .pickImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front,
                              )
                                  .then((value) async {
                                setState(() {
                                  image = value!.path;
                                });
                              });
                              print('image = $image');
                              File? croppedFile = await ImageCropper.cropImage(
                                  sourcePath: image!,
                                  aspectRatioPresets: [
                                    CropAspectRatioPreset.square,
                                  ],
                                  androidUiSettings: AndroidUiSettings(
                                    toolbarTitle: 'Cropper',
                                    toolbarColor: Colors.deepOrange,
                                    toolbarWidgetColor: Colors.white,
                                    initAspectRatio:
                                        CropAspectRatioPreset.square,
                                    lockAspectRatio: false,
                                  ),
                                  iosUiSettings: IOSUiSettings(
                                    minimumAspectRatio: 1.0,
                                  ));
                              setState(() {
                                image = croppedFile!.path;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.photo),
                            onPressed: () async {
                              await _picker
                                  .pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 50,
                              )
                                  .then((value) async {
                                setState(() {
                                  image = value!.path;
                                });
                                File? croppedFile =
                                    await ImageCropper.cropImage(
                                        sourcePath: image!,
                                        aspectRatioPresets: [
                                          CropAspectRatioPreset.square,
                                          CropAspectRatioPreset.ratio3x2,
                                          CropAspectRatioPreset.original,
                                          CropAspectRatioPreset.ratio4x3,
                                          CropAspectRatioPreset.ratio16x9
                                        ],
                                        androidUiSettings: AndroidUiSettings(
                                            toolbarTitle: 'Cropper',
                                            toolbarColor: generalColor,
                                            toolbarWidgetColor: Colors.white,
                                            initAspectRatio:
                                                CropAspectRatioPreset.original,
                                            lockAspectRatio: false),
                                        iosUiSettings: IOSUiSettings(
                                          minimumAspectRatio: 1.0,
                                        ));
                                setState(() {
                                  image = croppedFile!.path;
                                });
                              });
                              print('image = $image');
                            },
                          ),
                        ],
                      ),
                      image != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(File(image as String)),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                defaultAvatarIMG,
                              ),
                            ),
                    ],
                  ),
                ],
              ),

              /// mobiles ///
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 10),
                          child: textWidget(
                            stringText: 'رقم الهاتف الاول*',
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 7),
                          child: textWidget(
                            stringText: 'رقم الهاتف الثاني',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFieldForm(
                          maxLength: 10,
                          controller: primaryPhoneController,
                          icons: Icons.phone,
                          suffix: textWidget(stringText: '+964'),
                          obscureText: false,
                          name: 'primary_phone',
                          keyboardType: TextInputType.number,
                          labelText: 'رقم الهاتف الاول',
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
                        ),
                        TextFieldForm(
                          maxLength: 10,
                          controller: secondPhoneController,
                          suffix: textWidget(stringText: '+964'),
                          icons: Icons.phone,
                          obscureText: false,
                          name: 'second_phone',
                          keyboardType: TextInputType.number,
                          labelText: 'رقم الهاتف الثاني',
                          validator: (String? secondPhone) {
                            print('secondPhone = $secondPhone');
                            if (secondPhone!.isNotEmpty) {
                              if (secondPhone == primaryPhoneController.text) {
                                return (" يرجى ادخال رقم اّخر");
                              }
                              if (secondPhone.length < 10) {
                                return ("يجب ان لا يقل الرقم عن 10 رقم");
                              }
                              if (!(secondPhone.startsWith('75') ||
                                  secondPhone.startsWith('77') ||
                                  secondPhone.startsWith('78') ||
                                  secondPhone.startsWith('79'))) {
                                return ("يجب إدخال رقم عراقي");
                              }
                            } else {
                              return null;
                            }
                            //
                          },
                          autovalidateMode: AutovalidateMode.always,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// emails ///
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 10),
                          child: textWidget(
                            stringText: 'الإيميل الاول*',
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 7),
                          child: textWidget(
                            stringText: 'الإيميل الثاني',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFieldForm(
                          controller: primaryEmailController,
                          icons: Icons.email,
                          obscureText: false,
                          name: 'primary_email',
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'الإيميل الاول',
                          validator: (String? firstEmail) {
                            if (firstEmail!.isNotEmpty) {
                              if (!firstEmail.contains('@')) {
                                return ("يرجى ادخال ايميل صالح");
                              }
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        Stack(
                          children: [
                            TextFieldForm(
                              controller: secondEmailController,
                              icons: Icons.email,
                              obscureText: false,
                              name: 'second_email',
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'الإيميل الثاني',
                              validator: (String? secondEmail) {
                                if (primaryEmailController.text.isNotEmpty) {
                                  email1NotWritten = false;
                                  // setState(() {});
                                  if (secondEmail!.isNotEmpty) {
                                    if (secondEmail ==
                                        primaryEmailController.text) {
                                      return (" يرجى ادخال أيميل اّخر");
                                    }
                                    if (!secondEmail.contains('@')) {
                                      return ("يرجى ادخال ايميل صالح");
                                    }
                                  } else {
                                    return null;
                                  }
                                } else {
                                  email1NotWritten = true;
                                  setState(() {});
                                  if (secondEmail!.isNotEmpty) {
                                    if (secondEmail ==
                                        primaryEmailController.text) {
                                      return (" يرجى ادخال أيميل اّخر");
                                    }
                                    if (!secondEmail.contains('@')) {
                                      return ("يرجى ادخال ايميل صالح");
                                    }
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            email1NotWritten
                                ? Container(
                                    margin: EdgeInsets.only(top: 60, right: 10),
                                    child: textWidget(
                                      stringText: 'سيتم اعتماده كايميل رئيسي',
                                      fontSize: 13,
                                      color: Colors.green,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// addresses ///
              Address(
                groupName: 'العنوان الاول*',
                stringText1: 'الدولة*',
                onFindCountry: (String? filter) {
                  return getData(filter, countriesUrl);
                },
                onChangedCountry: (GetDataModel? model) {
                  print('model?.name = ${model?.name}');
                  setState(() {
                    selectedCountry1 = model;
                  });
                  country1ID = model?.id;
                  country1Name = model?.name;
                },
                validatorCountry: FormBuilderValidators.required(
                  context,
                  errorText: dropdownErrorText,
                ),
                selectedItemCountry: selectedCountry1 ??
                    GetDataModel(
                      name: 'العراق',
                      id: 106,
                    ),
                stringText2: 'المحافظة*',
                onFindGovernorate: (String? filter) {
                  return getData(filter, '$governoratesUrl/$country1ID');
                },
                onChangedGovernorate: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedGovernorate1 = model;
                    selectedCity1 = null;
                    selectedDestrict1 = null;
                  });
                  governorate1ID = model.id;
                  governorate1Name = model.name;
                  // selectedCountryId = model.id;
                  // print('city1ID = $city1ID');
                  // print('city1Name = $city1Name');
                  // print('selectedId = $selectedId');
                },
                validatorGovernorate: FormBuilderValidators.required(
                  context,
                  errorText: dropdownErrorText,
                ),
                selectedItemGovernorate: selectedGovernorate1,
                stringText3: 'المدينة*',
                onChangedCity: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedCity1 = model;
                    selectedDestrict1 = null;
                  });
                  city1ID = model.id;
                  city1Name = model.name;
                  print('destrict1ID = $destrict1ID');
                  print('destrict1Name = $destrict1Name');
                },
                onFindCity: (String? filter) {
                  return getData(filter, '$citiesUrl/$governorate1ID');
                },
                validatorCity: FormBuilderValidators.required(
                  context,
                  errorText: dropdownErrorText,
                ),
                selectedItemCity: selectedCity1,
                stringText4: 'المنطقة*',
                onFindDestrict: (String? filter) {
                  return getData(
                    filter,
                    '$destrictsUrl/$city1ID',
                  );
                },
                onChangedDestrict: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedDestrict1 = model;
                  });
                  destrict1ID = model.id;
                  destrict1Name = model.name;
                  print('destrict1ID = $destrict1ID');
                  print('destrict1Name = $destrict1Name');
                },
                selectedItemDestrict: selectedDestrict1,
              ),
              Address(
                groupName: 'العنوان الثاني',
                stringText1: 'الدولة',
                onFindCountry: (String? filter) {
                  return getData(filter, countriesUrl);
                },
                onChangedCountry: (GetDataModel? model) {
                  print('model?.name = ${model?.name}');
                  setState(() {
                    selectedCountry2 = model;
                  });
                  country2ID = model?.id;
                  country2Name = model?.name;
                },
                selectedItemCountry: selectedCountry2,
                stringText2: 'المحافظة',
                onFindGovernorate: (String? filter) {
                  return getData(filter, '$governoratesUrl/$country2ID');
                },
                onChangedGovernorate: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedGovernorate2 = model;
                    selectedCity2 = null;
                    selectedDestrict2 = null;
                  });
                  governorate2ID = model.id;
                  governorate2Name = model.name;
                  // selectedCountryId = model.id;
                  // print('city1ID = $city1ID');
                  // print('city1Name = $city1Name');
                  // print('selectedId = $selectedId');
                },
                selectedItemGovernorate: selectedGovernorate2,
                stringText3: 'المدينة',
                onChangedCity: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedCity2 = model;
                    selectedDestrict2 = null;
                  });
                  city2ID = model.id;
                  city2Name = model.name;
                  print('destrict2ID = $destrict2ID');
                  print('destrict2Name = $destrict2Name');
                },
                onFindCity: (String? filter) {
                  return getData(filter, '$citiesUrl/$governorate2ID');
                },
                selectedItemCity: selectedCity2,
                stringText4: 'المنطقة',
                onFindDestrict: (String? filter) {
                  return getData(
                    filter,
                    '$destrictsUrl/$city2ID',
                  );
                },
                onChangedDestrict: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedDestrict2 = model;
                  });
                  destrict2ID = model.id;
                  destrict2Name = model.name;
                  print('destrict2ID = $destrict2ID');
                  print('destrict2Name = $destrict2Name');
                },
                selectedItemDestrict: selectedDestrict2,
              ),

              /// chronic diseases and handicaps ///
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  child: textWidget(stringText: "الحالة الصحية", fontSize: 17)),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 10),
                          child: textWidget(
                            stringText: 'الأمراض المزمنة',
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 2),
                          child: textWidget(
                            stringText: 'علامات فارقة',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MultiSelectDropDownFormField(
                          onChange: (model) {
                            setState(() {
                              multiSelectedChronicDiseasesId = [];
                            });
                            multiSelectedChronicDiseasesString = model;
                            for (var i in model) {
                              print(
                                  'multiSelectedChronicDiseasesId = $multiSelectedChronicDiseasesId');
                              setState(() {
                                multiSelectedChronicDiseasesId.add(i.id);
                              });
                            }
                          },
                          selectedItems: multiSelectedChronicDiseasesString,
                          onFind: (String? filter) =>
                              getData(filter, chronicDiseasesUrl),
                        ),
                        MultiSelectDropDownFormField(
                          onChange: (model) {
                            setState(() {
                              multiSelectedHandicapsId = [];
                            });
                            multiSelectedHandicapsString = model;
                            for (var i in model) {
                              multiSelectedHandicapsId.add(i.id);
                            }
                          },
                          selectedItems: multiSelectedHandicapsString,
                          onFind: (String? filter) =>
                              getData(filter, handicapsUrl),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        title: textWidget(stringText: 'كلمة السر', fontSize: 12),
        isActive: _currentstep == 1,
        state: step2State,
        content: Column(
          children: [
            image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(image as String)),
                  )
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      defaultAvatarIMG,
                    ),
                  ),

            BuildContainer(
              stringText1: 'اسم المستخدم',
              stringText2:
                  '${firstNameController.text} ${secondNameController.text}',
            ),
            BuildContainer(
              stringText1: 'الهاتف',
              stringText2: '+964${primaryPhoneController.text}',
            ),
            BuildContainer(
              stringText1: 'الإيميل',
              stringText2: '${primaryEmailController.text}',
            ),

            /// password and verify password ///
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig().widthSize(context, 25),
                        height: SizeConfig().heightSize(context, 10),
                        child: textWidget(
                          stringText: 'كلمة السر*',
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        width: SizeConfig().widthSize(context, 25),
                        height: SizeConfig().heightSize(context, 7),
                        child: textWidget(
                          stringText: 'تأكيد كلمة السر*',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldForm(
                        width: SizeConfig().widthSize(context, 65),
                        controller: passwordController,
                        height: SizeConfig().heightSize(context, 7.0),
                        margin: EdgeInsets.only(bottom: 20),
                        icons: Icons.lock,
                        name: 'password',
                        obscureText: hidePassword,
                        suffix: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () => setState(() {
                                  hidePassword = !hidePassword;
                                })),
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'كلمة السر',
                        validator: _currentstep == 1
                            ? FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  context,
                                  errorText: textfieldErrorText,
                                ),
                                FormBuilderValidators.match(
                                  context,
                                  "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$",
                                  errorText:
                                      'يجب ان يحتوي الرمز على حرف كبير , رمز, رقم  , ولا يقل عن 8',
                                ),
                              ])
                            : null,
                        autovalidateMode: _currentstep == 1
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                      ),
                      TextFieldForm(
                        width: SizeConfig().widthSize(context, 65),
                        height: SizeConfig().heightSize(context, 7.0),
                        margin: EdgeInsets.only(bottom: 40),
                        icons: Icons.lock,
                        obscureText: hidePassword,
                        suffix: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () => setState(() {
                                  hidePassword = !hidePassword;
                                })),
                        name: 'verify_password',
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'تأكيد كلمة السر',
                        autovalidateMode: _currentstep == 1
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        validator: _currentstep == 1
                            ? (String? confirmedPassword) {
                                if (passwordController.text !=
                                    confirmedPassword) {
                                  return ('كلمة السر غير متطابقة');
                                }
                              }
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Step(
        title: textWidget(stringText: 'تأكيد المعلومات', fontSize: 12),
        isActive: _currentstep == 2,
        state: step3State,
        content: Column(
          children: [
            image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(image as String)),
                  )
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      defaultAvatarIMG,
                    ),
                  ),
            BuildContainer(
              stringText1: 'اسم المستخدم',
              stringText2:
                  '${firstNameController.text} ${secondNameController.text} ${thirdNameController.text}',
            ),
            enFirstNameController.text != '' ||
                    enSecondNameController.text != '' ||
                    enThirdNameController.text != ''
                ? BuildContainer(
                    stringText1: '',
                    stringText2:
                        '${enFirstNameController.text} ${enSecondNameController.text} ${enThirdNameController.text}',
                  )
                : Container(),
            BuildContainer(
              stringText1: 'الجنس',
              stringText2: '${gender ?? ''}',
            ),
            BuildContainer(
              stringText1: 'الجنسية',
              stringText2:
                  '${nationality1Name ?? ''} - ${nationality2Name ?? ''}',
            ),
            BuildContainer(
              stringText1: 'العنوان في العراق',
              stringText2: '${city1Name ?? ''} ${destrict1Name ?? ''}',
            ),
            city2Name != null || destrict2Name != null
                ? BuildContainer(
                    stringText1: '',
                    stringText2: '${city2Name ?? ''} ${destrict2Name ?? ''}',
                  )
                : Container(),
            BuildContainer(
              stringText1: 'تاريخ الميلاد',
              stringText2: '${date ?? ''}',
            ),
            multiSelectedChronicDiseasesString.isNotEmpty
                ? BuildContainer(
                    stringText1: 'الأمراض المزمنة',
                    stringText2:
                        '${multiSelectedChronicDiseasesString.join('\n')}',
                  )
                : Container(),
            multiSelectedHandicapsString.isNotEmpty
                ? BuildContainer(
                    stringText1: 'علامات فارقة',
                    stringText2: '${multiSelectedHandicapsString.join('\n')}',
                  )
                : Container(),
            BuildContainer(
              stringText1: 'رقم الهاتف الاول',
              stringText2: '+964${primaryPhoneController.text}',
            ),
            secondPhoneController.text != ''
                ? BuildContainer(
                    stringText1: '',
                    stringText2: '+964${secondPhoneController.text}',
                  )
                : Container(),
            BuildContainer(
              stringText1: 'الايميل الاول',
              stringText2: '${primaryEmailController.text}',
            ),
            secondEmailController.text != ''
                ? BuildContainer(
                    stringText1: '',
                    stringText2: '${secondEmailController.text}',
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
              child: InkWell(
                onTap: () => termsAndConditionDialog(),
                child: Row(
                  children: [
                    // Material(
                    //   child: Checkbox(
                    //     value: agree,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         agree = value!;
                    //         backgroundColor = agree
                    //             ? MaterialStateProperty.all(Colors.blue)
                    //             : MaterialStateProperty.all(Colors.grey);
                    //         registerButtonColor =
                    //             agree ? Colors.blue : Colors.grey;
                    //       });
                    //     },
                    //   ),
                    // ),
                    Icon(
                      agree
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                    ),
                    textWidget(
                      stringText: 'لقد قرأت ووافقت على ',
                      color: Colors.black87,
                    ),
                    textWidget(
                        stringText: "الشروط والأحكام",
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if (_currentstep == 0) {
                    } else if (_currentstep == 1) {
                      setState(() {
                        step1State = StepState.editing;
                        backgroundColor2 =
                            MaterialStateProperty.all(Colors.grey);
                        _currentstep--;
                      });
                    } else if (_currentstep == 2) {
                      setState(() {
                        nextButtonStyle();
                        step3State = StepState.editing;
                        step2State = StepState.editing;
                        if (backgroundColor ==
                            MaterialStateProperty.all(Colors.blue)) {
                          backgroundColor =
                              MaterialStateProperty.all(Colors.grey);
                        } else {
                          backgroundColor =
                              MaterialStateProperty.all(Colors.blue);
                        }
                        agree = false;
                        _currentstep--;
                      });
                    }
                  },
                  child: textWidget(
                    stringText: 'رجوع',
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  style: ButtonStyle(
                    backgroundColor: backgroundColor2,
                  ),
                ),
                buildTextWithIcon(),
              ],
            ),
            text != null
                ? Container(
                    margin: EdgeInsets.only(top: 20),
                    child: textWidget(
                      stringText: text,
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ];
  }
}

Column conditions() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
              stringText: "نطاق الخدمة",
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: generalColor),
          SizedBox(
            height: 10,
          ),
          textWidget(
            stringText: "•توفر شركة الانظمة"
                " المتحدة عبر منظومة الرعاية الصحية "
                "الذكية (SHS) خدمة تكنولوجيا المعلومات "
                "لتسهيل تقديم الخدمات و الاستشارات "
                "الصحية المتكاملة من قبل المؤسسات و "
                "الكوادر الصحية داخل و خارج العراق من "
                "خلال شبكة من البرامجيات و المواقع و "
                "التطبيقات الذكية لاتمتة كافة العمليات "
                "الصحية وإكمال التحول الرقمي.\n\n•"
                "كافة المؤسسات و الكوادر الصحية المدرجة"
                " في خدمات المنظومة يتم التحقق من "
                "اعتماديتهم و تسجيلهم في العراق و خارج "
                "العراق ضمن الوزارات و المؤسسات و "
                "النقابات  المعنية و لن يتم ادارج اي "
                "كيان او فرد في المنظومة دون اكمال شروط الالتحاق و التحقق من  الامتثال للمتطلبات القانونية.\n\n•تصنف خدمات المنظومة الى صنفين الاولى هي الخدمات المتاحة دون الحاجة الى اجراءآت التسجيل و الصنف الثاني هي الخدمات التي تتطلب إكمال إجراءآت التسجيل لتكون متاحة لمستخدم المنظومة."
                "\n\n•خدمة التسجيل للمواطنين متوفرة لمن اتم السن القانوني (الثامنة عشرة من عمره) وفقاً للقانون العراقي، يمكن لمن هم دون الثامنة عشر من العمر إستخدام الخدمات عن طريق أولياء أمورهم أو الأوصياء عليهم.",
          )
        ],
      ),
      SizedBox(
        height: 40,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
                stringText: "شروط الإستخدام",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: generalColor),
            SizedBox(
              height: 10,
            ),
            textWidget(
              stringText:
                  '''•ان استخدامكم لنظام الرعاية الصحية الذكية (SHS) المقدمة من قبل شركة الانظمة المتحدة فإنكم توافقون على الالتزام بهذه الشروط والأحكام و في حال عدم موافقتكم عليها فيرجى منكم عدم التسجيل او الادراج في هذه الخدمة.

•إن الموافقة على التسجيل في منظومة الرعاية الصحية الذكية (SHS) يعتبر موافقة من المريض على الشروط و الأحكام المتعلقة بخدمات المنظومة و وفقاً لما يلي:
''',
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: textWidget(stringText: '''•الموافقة على نطاق الخدمة.
•موافقة المريض على منح المعلومات المطلوبة لتقديم الخدمة.
•الموافقة على أن يتم حفظ التاريخ الطبي للمريض لدى السجلات الطبية الالكترونية الخاصة بالخدمات المقدمة.

'''),
            ),
            textWidget(
              stringText: '''
•إن الموافقة على التسجيل في منظومة الرعاية الصحية الذكية (SHS) يعتبر موافقة 
من الكوادر و المؤسسات الصحية على الشروط و الأحكام المتعلقة بخدمات المنظومة و 
وفقاً لما يلي:''',
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: textWidget(
                stringText: '''•الموافقة على نطاق الخدمة.
•موافقة الكوادر و المؤسسات الصحية على منح المعلومات المهنية المطلوبة لتقديم الخدمة.''',
              ),
            ),
            textWidget(stringText: '''
  
•الموافقة على أن يتم حفظ المعلومات المهنية و التاريخ الطبي عبر السجلات الطبية الالكترونية الخاصة بالخدمات المقدمة.

•يحق لشركة الانظمة المتحدة عبر منظومة الرعاية الصحية الذكية (SHS) التحفظ في قبول تسجيل اي شخص أو مؤسسة أو كيان في المنظومة دون ابدآء اسباب أو تبريرات.

•يحق لشركة الانظمة المتحدة عبر منظومة الرعاية الصحية الذكية (SHS) الغاء تسجيل أو تقيد او حجب بعض الخدمات اي شخص أو مؤسسة أو كيان في المنظومة في حالة الأستخدام السيء للخدمات من قبل المستخدمين من ادون ابدآء اسباب أو تبريرات.

•يحق لمقدمي الخدمات الصحية الامتناع عن تقديم خدمة الطبية لأي سبب كان او الاعتذار عن التواصل عن طريق الهاتف أو الانترنت.

•في حال تم الغاء تقديم الخدمة من قبل مقدمي الخدمات الصحية لأي سبب، فبإمكان النظام بإعادة جدولة الخدمة بناء على الوقت المناسب للمريض و لمقدمي الخدمات الطبية. وفي حال تعذر إعادة جدولة وقت الاستشارة، فسوف يتم ابلاغ المريض بذلك.

•في حال قيام احد الاطراف بإلغاء الخدمة قبل موعدها، شرط أن يتم هذا الإلغاء قبل الوقت المحدد إزآء كل خدمة و إشعار الطرف الاخر عبر المنظومة حصراُ.

•سوف يتم تقديم الخدمات الصحية وانجاز كافة العمليات الاخرى ضمن الوقت المتفق عليه بين المريض و مقدمي الخدمات الصحية و كافة الاطراف المعنية الاخرى، لذا فأن شركة الانظمة المتحدة المقدمة لنظام الرعاية الصحية الذكية (SHS) غير مسؤولة عن التاخير الحاصل في تقديم الخدمة أو اي قصور من مقدمي الخدمة الصحية في جودة الخدمات المقدة.
 
•يحق لإي طرف من الاطراف المعنية من أفراد أو مقدمي الخدمات الصحية تقديم شكوى لشركة الانظمة المتحدة عبر منظومة الرعاية الصحية الذكية (SHS) للتحقق في حالة تجاوز أي من الاطراف المعنية للمعايير الاجتماعية و المهنية.

•ظهور الاعلانات في المواقع او التطبيقات او مكونات المنظومة تخضع للسياسة التشغيلية لشركة الانظمة المتحدة عبر منظومة الرعاية الصحية الذكية (SHS) في تمويل اعمال المنظومة و يتم تدقيق جميع الاعلانات من قبل المنظومة لتأكد من مطابقاتها للمعايير الاجتماعية و المهنية و لا يحق لأي مستخدم حجب الاعلانات او رفضها في حالة عدم ملائمتها لإحتياجه و يحق له تقديم شكوى للمنظومة للتحقق في حالة وجود أي إعلان مخالف للمعايير الاجتماعية و المهنية.
''')
          ]),
      SizedBox(
        height: 40,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
                stringText: "إخلاء مسؤولية",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: generalColor),
            SizedBox(
              height: 10,
            ),
            textWidget(
                stringText:
                    '''•إن هذا التصريح يمثل سياستنا الحالية بشأن السرية و الخصوصية و أن استخدامكم لنظام الرعاية الصحية الذكية (SHS) المقدمة من قبل شركة الانظمة المتحدة يعني قبولكم للأحكام و الشروط وأيضاً تصريح السرية و الخصوصية هذا.
                                    
•أننا نحافظ على أمن المعلومات لجميع المتعاملين مع خدماتنا كما نحتفظ بأنظمة أمن مادية و إلكترونية وإجرائية لحماية معلوماتكم.

•سوف لن نقوم بجمع أية معلومات عنكم إلا ما تزودونا به من قبلكم من خلال موقعنا على شبكة الإنترنت  و التطبيقات كما أن المعلومات التي نجمعها عنكم تعتمد على كيفية استخدامكم للخدمات المتوفرة من خلال الموقع و التطبيقات.

•لن يتم بيع أو تقاسم المعلومات الخاصة بكم مع أي طرف آخر غير مرتبط بنا لأغراض التسويق الخاصة به، كما أننا لن نفشي أية معلومات عنكم إلى أية مؤسسة خارجية ما لم نحصل على تفويض منكم أو بموجب القانون أو أمر من سلطة مختصة.
''')
          ]),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
