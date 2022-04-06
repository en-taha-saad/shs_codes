// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps, non_constant_identifier_names, curly_braces_in_flow_control_structures
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/container_element.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/controllers/fetch_data.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/address.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class FamilySignupView extends StatefulWidget {
  @override
  _FamilySignupView createState() => _FamilySignupView();
}

class _FamilySignupView extends State<FamilySignupView> {
  String? genderSex;
  String? gender;
  String? date;
  bool? success;
  String text = '';
  Widget? nextButton;
  var backgroundColor = MaterialStateProperty.all(Colors.blue);
  var registerButtonColor = Colors.blue;
  var backgroundColor2 = MaterialStateProperty.all(Colors.grey);
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;
  final ImagePicker _picker = ImagePicker();
  String? image;
  int _currentstep = 0;
  var formKey = GlobalKey<FormBuilderState>();
  StepState step1State = StepState.editing;
  StepState step2State = StepState.editing;
  late TextEditingController relationInputController;
  late TextEditingController firstNameController;
  late TextEditingController enFirstNameController;
  late TextEditingController secondNameController;
  late TextEditingController enSecondNameController;
  late TextEditingController thirdNameController;
  late TextEditingController enThirdNameController;
  int? nationality1ID;
  String? nationality1Name;
  String? relationName;
  int? relationId;
  int? nationality2ID;
  String? nationality2Name;
  int? countryID = 106;
  String? countryName;
  int? governorateID;
  String? governorateName;
  int? cityID;
  String? cityName;
  int? destrictID;
  String? destrictName;
  int? chronicDiseasesID;
  String? chronicDiseasesName;
  int? handicapsID;
  String? handicapsName;
  int? selectedId, selectedId2;
  bool selectedItem = false;
  bool goToProfile = true;
  GetDataModel? selectedNationality1String;
  GetDataModel? selectedRelation;
  GetDataModel? selectedNationality2String;
  GetDataModel? selectedCountry;
  GetDataModel? selectedGovernorate;
  GetDataModel? selectedCity;
  GetDataModel? selectedDestrict;
  GetDataModel? selectedHandicapsString;
  GetDataModel? selectedChronicDiseasesString;
  bool otherIsSelected = false;
  bool isDateEnter = false;
  String? dateError = '';
  String? labeText1;
  String? enLabeText1;
  String? labeText2;
  String? enLabeText2;
  String? labeText3;
  String? enLabeText3;
  bool enabledInput1 = true;
  bool enabledInput2 = true;
  bool enabledInput3 = true;
  bool enabledEnInput1 = true;
  bool enabledEnInput2 = true;
  bool enabledEnInput3 = true;
  bool validateOrNotFirstName = false;
  bool validateOrNotSecondName = false;
  bool validateOrNotThirdName = false;
  List<GetDataModel>? relationsItems = [
    GetDataModel(id: 1, name: 'ابن'),
    GetDataModel(id: 2, name: 'ابنه'),
    GetDataModel(id: 3, name: 'اخ شقيق'),
    GetDataModel(id: 4, name: 'اخت شقيقة'),
    GetDataModel(id: 5, name: 'اب'),
    GetDataModel(id: 6, name: 'ام'),
    GetDataModel(id: 7, name: 'اخ غير شقيق'),
    if (getSex == 'ذكر') GetDataModel(id: 8, name: 'زوجة'),
    if (getSex == 'انثى') GetDataModel(id: 11, name: 'زوج'),
    GetDataModel(id: 9, name: 'اخت غير شقيقة'),
    GetDataModel(id: 10, name: 'اخر'),
  ];
  bool? toSelect = false;
  List<int?> multiSelectedHandicapsId = [];
  List<int?> multiSelectedChronicDiseasesId = [];
  List<GetDataModel> multiSelectedHandicapsString = [];
  List<GetDataModel> multiSelectedChronicDiseasesString = [];
  String? childFirstName;
  String? childSecondName;
  String? childThirdName;
  String? enChildFirstName = '';
  String? enChildSecondName = '';
  String? enChildThirdName = '';

  @override
  void initState() {
    super.initState();
    nextButtonStyle();
    relationInputController = TextEditingController();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    thirdNameController = TextEditingController();
    enFirstNameController = TextEditingController();
    enSecondNameController = TextEditingController();
    enThirdNameController = TextEditingController();
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
            Get.offNamed(
              Routes.FAMILY_INFO_PREVIEW,
              arguments: [
                image,
                childFirstName!.isEmpty
                    ? firstNameController.text
                    : childFirstName,
                childSecondName!.isEmpty
                    ? secondNameController.text
                    : childSecondName,
                childThirdName!.isEmpty
                    ? thirdNameController.text
                    : childThirdName,
                gender ?? '',
                nationality1Name ?? '',
                nationality2Name ?? '',
                countryName ?? '',
                governorateName ?? '',
                cityName ?? '',
                destrictName ?? '',
                date,
                multiSelectedChronicDiseasesString.join('\n'),
                multiSelectedHandicapsString.join('\n'),
              ],
            );
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

  onStepback() {
    if (_currentstep == 0) {
    } else if (_currentstep == 1) {
      setState(() {
        step1State = StepState.editing;
        backgroundColor2 = MaterialStateProperty.all(Colors.grey);
        _currentstep--;
      });
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

  Widget buildTextWithIcon() {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
          text: "تأكيد",
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
      // animationEnd: ,
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
        setState(() {
          stateTextWithIcon = ButtonState.loading;
        });
        httpPost().then((value) {
          setState(() {
            stateTextWithIcon = ButtonState.idle;
          });
          onPressedIconWithText();
        });
      },
      state: stateTextWithIcon,
    );
  }

  Widget controlsBuilder(BuildContext context, controlDetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _currentstep == 0
            ? TextButton(
                onPressed: controlDetails.onStepCancel,
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
        _currentstep == 0 ? nextButtonStyle()! : Container(),
      ],
    );
  }

  showInputStringBasedOnSelectedRelation() {}

  onStepContinue() {
    genderFunc();
    print('childFirstName = $childFirstName');
    if (_currentstep == 0) {
      backgroundColor2 = MaterialStateProperty.all(Colors.blue);
      if (!formKey.currentState!.saveAndValidate()) {
        step1State = StepState.error;
        dateError = 'يرجى تحديد تاريخ الميلاد';
        setState(() {});
      } else {
        if (isDateEnter == true) {
          _currentstep++;
          step1State = StepState.complete;
        } else {
          dateError = 'يرجى تحديد تاريخ الميلاد';
        }
      }
      setState(() {});
    } else if (_currentstep == 1) {
      setState(() {
        registerButtonColor = Colors.grey;
        if (!formKey.currentState!.saveAndValidate()) {
          step2State = StepState.error;
        } else {
          registerButtonColor = Colors.grey;
          _currentstep++;
          backgroundColor = MaterialStateProperty.all(Colors.grey);
          registerButtonColor = Colors.grey;
          step2State = StepState.complete;
        }
      });
    }
  }

  Future httpPost() async {
    try {
      setState(() => text = '');

      print('selectedRelation = ${selectedRelation!.name}');
      print('relationInputController = ${relationInputController.text}');
      if (selectedRelation!.name == 'اخر') {
        print('if ${relationInputController.text}');
      } else {
        print('else ${selectedRelation!.name}');
      }
      debugPrint('getParentId = $getParentId');
      Map<String, dynamic> json = {
        "parent_id": getParentId,
        "relation":
            "${selectedRelation!.name == 'اخر' ? relationInputController.text : selectedRelation!.name}",
        "patient": {
          "first_name":
              "${childFirstName!.isEmpty ? firstNameController.text : childFirstName}",
          "second_name":
              "${childSecondName!.isEmpty ? secondNameController.text : childSecondName}",
          "sure_name":
              "${childThirdName!.isEmpty ? thirdNameController.text : childThirdName}",
          "en_first_name":
              "${enChildFirstName == '' ? enFirstNameController.text : enChildFirstName}",
          "en_second_name":
              "${enChildSecondName == '' ? enSecondNameController.text : enChildSecondName ?? ''}",
          "en_sure_name":
              "${enChildThirdName == '' ? enThirdNameController.text : enChildThirdName ?? ''}",
          "date_of_birth": "$date",
          "sex": "$genderSex",
          "independent": 0
        },
        "addresses": [
          {
            "region_id": destrictID,
            "city_id": cityID,
            "governorate_id": governorateID,
            "country_id": countryID,
          }
        ],
        "nationalities": sendNationality(),
        "handicaps": multiSelectedHandicapsId,
        "chronic_diseases": multiSelectedChronicDiseasesId,
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '$url/register',
        ),
      );
      request.fields.addAll({'json': jsonEncode(json)});

      ///
      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', image!),
        );
      }

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data = jsonDecode(await response.stream.bytesToString());
        debugPrint('data = $data');
        setState(() {
          success = true;
        });
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        debugPrint('data = $data');
        setState(() {
          success = false;
        });
      }
    } on SocketException {
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  sendNationality() {
    if (nationality2ID == null) {
      return [nationality1ID];
    }
    return [nationality1ID, nationality2ID];
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
            title: textWidget(
              stringText: 'إضافة أفراد العائلة',
              color: Colors.black,
              fontSize: 20,
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
        content: Column(
          children: <Widget>[
            /// relation ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: SizeConfig().widthSize(context, 25),
                  height: SizeConfig().heightSize(context, 6),
                  child: textWidget(
                    stringText: 'صلة القرابة*',
                    fontSize: 15,
                  ),
                ),
                DropDownFormField(
                  items: relationsItems,
                  clearButtonBuilder: (context) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          selectedRelation = GetDataModel(name: '');
                          toSelect = false;
                          validateOrNotFirstName = false;
                          validateOrNotSecondName = false;
                          validateOrNotThirdName = false;
                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالإنكليزي';
                          labeText2 = 'إسم الأب بالعربي';
                          enLabeText2 = 'إسم الأب بالإنكليزي';
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = false;
                        });
                      },
                      icon: Icon(Icons.clear),
                    );
                  },
                  onChanged: (GetDataModel? model) {
                    print(model!.name);
                    print(model.id);
                    print('getSex = $getSex');
                    setState(() {
                      toSelect = true;
                      selectedRelation = model;
                      relationName = model.name;
                      relationId = model.id;
                    });
                    if (getSex == 'انثى') {
                      if (relationId == 1 ||
                          relationId == 3 ||
                          relationId == 5 ||
                          relationId == 7) {
                        setState(() {
                          print('male selected');
                          gender = 'ذكر';
                        });
                      }
                      if (relationId == 2 ||
                          relationId == 4 ||
                          relationId == 6 ||
                          relationId == 9) {
                        setState(() {
                          print('female selected');
                          gender = 'انثى';
                        });
                      }

                      // ابن ابنه اخ غير شقيق اخت غير شقيقة ام
                      if (relationId == 1 ||
                          relationId == 2 ||
                          relationId == 7 ||
                          relationId == 9 ||
                          relationId == 6) {
                        setState(() {
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = true;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = false;
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = secondNameController.text;
                          enChildSecondName = enSecondNameController.text;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = true;
                          enabledEnInput2 = true;
                          enabledInput3 = true;
                          enabledEnInput3 = true;

                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالإنكليزي';
                          labeText2 = 'إسم الأب بالعربي';
                          enLabeText2 = 'إسم الأب بالإنكليزي';
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                        });
                      }

                      // اخ شقيق اخت شقيقة
                      if (relationId == 3 || relationId == 4) {
                        setState(() {
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = false;
                          validateOrNotThirdName = false;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = false;
                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالانكليزي';
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = getSecondName;
                          enChildSecondName = getEnSecondName ?? "";
                          print('getEnFirstName ${enChildSecondName}');
                          childThirdName = getSurName;
                          enChildThirdName = getEnSurName ?? "";
                          labeText2 = getSecondName;
                          enLabeText2 = getEnSecondName;
                          labeText3 = getSurName;
                          enLabeText3 = getEnSurName;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = false;
                          enabledEnInput2 = false;
                          enabledInput3 = false;
                          enabledEnInput3 = false;
                        });
                      }

                      /// اب
                      if (relationId == 5) {
                        setState(() {
                          validateOrNotFirstName = false;
                          validateOrNotSecondName = false;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          // thirdNameController.clear();
                          // enThirdNameController.clear();
                          otherIsSelected = false;
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                          labeText1 = getSecondName;
                          enLabeText1 = getEnSecondName;
                          labeText2 = getSurName;
                          enLabeText2 = getEnSurName;

                          childFirstName = getSecondName;
                          enChildFirstName = getEnSecondName;
                          childSecondName = getSurName;
                          enChildSecondName = getEnSurName;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;

                          enabledInput1 = false;
                          enabledEnInput1 = false;
                          enabledInput2 = false;
                          enabledEnInput2 = false;
                          enabledInput3 = true;
                          enabledEnInput3 = true;
                        });
                      }

                      /// اخر
                      if (relationId == 10) {
                        setState(() {
                          gender = null;
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = true;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = true;
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = secondNameController.text;
                          enChildSecondName = enSecondNameController.text;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = true;
                          enabledEnInput2 = true;
                          enabledInput3 = true;
                          enabledEnInput3 = true;

                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالإنكليزي';
                          labeText2 = 'إسم الأب بالعربي';
                          enLabeText2 = 'إسم الأب بالإنكليزي';
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                        });
                      }

                      print('gender = $gender');
                    } else {
                      if (relationId == 1 ||
                          relationId == 3 ||
                          relationId == 5 ||
                          relationId == 7) {
                        setState(() {
                          print('male selected');
                          gender = 'ذكر';
                        });
                      }
                      if (relationId == 2 ||
                          relationId == 4 ||
                          relationId == 6 ||
                          relationId == 8 ||
                          relationId == 9) {
                        setState(() {
                          print('female selected');
                          gender = 'انثى';
                        });
                      }

                      // ابن ابنه
                      if (relationId == 1 || relationId == 2) {
                        setState(() {
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = false;
                          validateOrNotThirdName = false;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = false;
                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالانكليزي';
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          print('getFirstName = $getFirstName');
                          print('enChildSecondName = $enChildSecondName');
                          childSecondName = getFirstName;
                          enChildSecondName = getEnFirstName ?? "";
                          print('getEnFirstName ${enChildSecondName}');
                          childThirdName = getSecondName;
                          enChildThirdName = getEnSecondName ?? "";
                          labeText2 = getFirstName;
                          enLabeText2 = getEnFirstName;
                          labeText3 = getSecondName;
                          enLabeText3 = getEnSecondName;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = false;
                          enabledEnInput2 = false;
                          enabledInput3 = false;
                          enabledEnInput3 = false;
                        });
                      }

                      // اخ شقيق اخت شقيقة
                      if (relationId == 3 || relationId == 4) {
                        setState(() {
                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالانكليزي';
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = getSecondName;
                          enChildSecondName = getEnSecondName ?? "";
                          print('getEnFirstName ${enChildSecondName}');
                          childThirdName = getSurName;
                          enChildThirdName = getEnSurName ?? "";
                          labeText2 = getSecondName;
                          enLabeText2 = getEnSecondName;
                          labeText3 = getSurName;
                          enLabeText3 = getEnSurName;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = false;
                          enabledEnInput2 = false;
                          enabledInput3 = false;
                          enabledEnInput3 = false;
                        });
                      }

                      /// اب
                      if (relationId == 5) {
                        setState(() {
                          validateOrNotFirstName = false;
                          validateOrNotSecondName = false;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          // thirdNameController.clear();
                          // enThirdNameController.clear();
                          otherIsSelected = false;
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                          labeText1 = getSecondName;
                          enLabeText1 = getEnSecondName;
                          labeText2 = getSurName;
                          enLabeText2 = getEnSurName;
                          childFirstName = getSecondName;
                          enChildFirstName = getEnSecondName;
                          childSecondName = getSurName;
                          enChildSecondName = getEnSurName;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;

                          enabledInput1 = false;
                          enabledEnInput1 = false;
                          enabledInput2 = false;
                          enabledEnInput2 = false;
                          enabledInput3 = true;
                          enabledEnInput3 = true;
                        });
                      }

                      /// ام اخ غير شقيق زوجة اخت غير شقيقة
                      if (relationId == 6 ||
                          relationId == 7 ||
                          relationId == 8 ||
                          relationId == 9) {
                        setState(() {
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = true;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = false;
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = secondNameController.text;
                          enChildSecondName = enSecondNameController.text;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = true;
                          enabledEnInput2 = true;
                          enabledInput3 = true;
                          enabledEnInput3 = true;

                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالإنكليزي';
                          labeText2 = 'إسم الأب بالعربي';
                          enLabeText2 = 'إسم الأب بالإنكليزي';
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                        });
                      }

                      /// اخر
                      if (relationId == 10) {
                        setState(() {
                          gender = null;
                          validateOrNotFirstName = true;
                          validateOrNotSecondName = true;
                          validateOrNotThirdName = true;
                          relationInputController.clear();
                          firstNameController.clear();
                          enFirstNameController.clear();
                          secondNameController.clear();
                          enSecondNameController.clear();
                          thirdNameController.clear();
                          enThirdNameController.clear();
                          otherIsSelected = true;
                          childFirstName = firstNameController.text;
                          enChildFirstName = enFirstNameController.text;
                          childSecondName = secondNameController.text;
                          enChildSecondName = enSecondNameController.text;
                          childThirdName = thirdNameController.text;
                          enChildThirdName = enThirdNameController.text;
                          enabledInput1 = true;
                          enabledEnInput1 = true;
                          enabledInput2 = true;
                          enabledEnInput2 = true;
                          enabledInput3 = true;
                          enabledEnInput3 = true;

                          labeText1 = 'الإسم الاول بالعربي';
                          enLabeText1 = 'الإسم الاول بالإنكليزي';
                          labeText2 = 'إسم الأب بالعربي';
                          enLabeText2 = 'إسم الأب بالإنكليزي';
                          labeText3 = 'الجد او اللقب بالعربي';
                          enLabeText3 = 'الجد او اللقب بالإنكليزي';
                        });
                      }
                    }
                  },
                  selectedItem: selectedRelation,
                  validator: FormBuilderValidators.required(
                    context,
                    errorText: dropdownErrorText,
                  ),
                ),
              ],
            ),
            otherIsSelected == true
                ? Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: SizeConfig().widthSize(context, 25),
                          height: SizeConfig().heightSize(context, 6),
                          child: textWidget(
                            stringText: '',
                            fontSize: 15,
                          ),
                        ),
                        TextFieldForm(
                          height: SizeConfig().heightSize(context, 7),
                          controller: relationInputController,
                          icons: Icons.person,
                          obscureText: false,
                          name: 'other_relation',
                          keyboardType: TextInputType.name,
                          labelText: 'العلاقة ذات الصلة',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: textfieldErrorText,
                            ),
                            FormBuilderValidators.maxLength(
                              context,
                              15,
                              errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                            ),
                            FormBuilderValidators.minLength(
                              context,
                              2,
                              errorText: 'يجب ان لا يقل الإسم عن حرفين',
                            ),
                            FormBuilderValidators.match(
                              context,
                              '^[\u0621-\u064A040 ]+\$',
                              errorText: 'يسمح بحروف عربية ومسافة فقط',
                            ),
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ],
                    ),
                  )
                : Container(),

            /// name ///
            toSelect == true
                ? Container(
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
                                  height: SizeConfig().heightSize(context, 7),
                                  controller: firstNameController,
                                  icons: Icons.person,
                                  obscureText: false,
                                  enabled: enabledInput1,
                                  name: 'first_name',
                                  keyboardType: TextInputType.name,
                                  labelText: labeText1,
                                  validator: validateOrNotFirstName
                                      ? FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                            context,
                                            errorText: textfieldErrorText,
                                          ),
                                          FormBuilderValidators.maxLength(
                                            context,
                                            25,
                                            errorText:
                                                'يجب ان لا يزيد الإسم عن 25 حرف',
                                          ),
                                          FormBuilderValidators.minLength(
                                            context,
                                            2,
                                            errorText:
                                                'يجب ان لا يقل الإسم عن حرفين',
                                          ),
                                          FormBuilderValidators.match(
                                            context,
                                            '^[\u0621-\u064A040 ]+\$',
                                            errorText:
                                                'يسمح بحروف عربية ومسافة فقط',
                                          ),
                                        ])
                                      : null,
                                  autovalidateMode: validateOrNotFirstName
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                ),
                                TextFieldForm(
                                  controller: enFirstNameController,
                                  icons: Icons.person,
                                  enabled: enabledEnInput1,
                                  labelText: enLabeText1,
                                  obscureText: false,
                                  name: 'en_first_name',
                                  keyboardType: TextInputType.name,
                                  // validator: FormBuilderValidators.compose([
                                  //   FormBuilderValidators.maxLength(
                                  //     context,
                                  //     25,
                                  //     errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                                  //   ),
                                  //   FormBuilderValidators.minLength(
                                  //     context,
                                  //     2,
                                  //     errorText: 'يجب ان لا يقل الإسم عن حرفين',
                                  //   ),
                                  //   FormBuilderValidators.match(
                                  //     context,
                                  //     '^[a-zA-Z][a-zA-Z ]+\$',
                                  //     errorText: 'يسمح بحروف إنكليزية ومسافة فقط',
                                  //   ),
                                  // ]),
                                  validator: (String? englishFirstName) {
                                    if (englishFirstName!.isNotEmpty) {
                                      print(
                                          'englishFirstName = $englishFirstName');
                                      RegExp regExp =
                                          RegExp('^[a-zA-Z][a-zA-Z ]+\$');
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
                                  height: SizeConfig().heightSize(context, 7),
                                  controller: secondNameController,
                                  icons: Icons.person,
                                  enabled: enabledInput2,
                                  obscureText: false,
                                  name: 'second_name',
                                  keyboardType: TextInputType.name,
                                  labelText: labeText2,
                                  validator: validateOrNotSecondName
                                      ? FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                            context,
                                            errorText: textfieldErrorText,
                                          ),
                                          FormBuilderValidators.maxLength(
                                            context,
                                            25,
                                            errorText:
                                                'يجب ان لا يزيد الإسم عن 25 حرف',
                                          ),
                                          FormBuilderValidators.minLength(
                                            context,
                                            2,
                                            errorText:
                                                'يجب ان لا يقل الإسم عن حرفين',
                                          ),
                                          FormBuilderValidators.match(
                                            context,
                                            '^[\u0621-\u064A040 ]+\$',
                                            errorText:
                                                'يسمح بحروف عربية ومسافة فقط',
                                          ),
                                        ])
                                      : null,
                                  autovalidateMode: validateOrNotSecondName
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                ),
                                TextFieldForm(
                                  controller: enSecondNameController,
                                  icons: Icons.person,
                                  obscureText: false,
                                  enabled: enabledEnInput2,
                                  labelText: enLabeText2,
                                  name: 'en_second_name',
                                  keyboardType: TextInputType.name,
                                  // validator: FormBuilderValidators.compose([
                                  //   FormBuilderValidators.maxLength(
                                  //     context,
                                  //     25,
                                  //     errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                                  //   ),
                                  //   FormBuilderValidators.minLength(
                                  //     context,
                                  //     2,
                                  //     errorText: 'يجب ان لا يقل الإسم عن حرفين',
                                  //   ),
                                  //   FormBuilderValidators.match(
                                  //     context,
                                  //     '^[a-zA-Z][a-zA-Z ]+\$',
                                  //     errorText: 'يسمح بحروف إنكليزية ومسافة فقط',
                                  //   ),
                                  // ]),
                                  validator: (String? englishFirstName) {
                                    if (englishFirstName!.isNotEmpty) {
                                      print(
                                          'englishFirstName = $englishFirstName');
                                      RegExp regExp =
                                          RegExp('^[a-zA-Z][a-zA-Z ]+\$');
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
                                  height: SizeConfig().heightSize(context, 7),
                                  controller: thirdNameController,
                                  icons: Icons.person,
                                  obscureText: false,
                                  name: 'third_name',
                                  enabled: enabledInput3,
                                  keyboardType: TextInputType.name,
                                  labelText: labeText3,
                                  validator: validateOrNotThirdName
                                      ? FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                            context,
                                            errorText: textfieldErrorText,
                                          ),
                                          FormBuilderValidators.maxLength(
                                            context,
                                            25,
                                            errorText:
                                                'يجب ان لا يزيد الإسم عن 25 حرف',
                                          ),
                                          FormBuilderValidators.minLength(
                                            context,
                                            2,
                                            errorText:
                                                'يجب ان لا يقل الإسم عن حرفين',
                                          ),
                                          FormBuilderValidators.match(
                                            context,
                                            '^[\u0621-\u064A040 ]+\$',
                                            errorText:
                                                'يسمح بحروف عربية ومسافة فقط',
                                          ),
                                        ])
                                      : null,
                                  autovalidateMode: validateOrNotThirdName
                                      ? AutovalidateMode.onUserInteraction
                                      : AutovalidateMode.disabled,
                                ),
                                TextFieldForm(
                                  controller: enThirdNameController,
                                  icons: Icons.person,
                                  obscureText: false,
                                  name: 'en_third_name',
                                  enabled: enabledEnInput3,
                                  keyboardType: TextInputType.name,
                                  labelText: enLabeText3,
                                  // validator: FormBuilderValidators.compose([
                                  //   FormBuilderValidators.maxLength(
                                  //     context,
                                  //     25,
                                  //     errorText: 'يجب ان لا يزيد الإسم عن 25 حرف',
                                  //   ),
                                  //   FormBuilderValidators.minLength(
                                  //     context,
                                  //     2,
                                  //     errorText: 'يجب ان لا يقل الإسم عن حرفين',
                                  //   ),
                                  //   FormBuilderValidators.match(
                                  //     context,
                                  //     '^[a-zA-Z][a-zA-Z ]+\$',
                                  //     errorText: 'يسمح بحروف إنكليزية ومسافة فقط',
                                  //   ),
                                  // ]),
                                  validator: (String? englishFirstName) {
                                    if (englishFirstName!.isNotEmpty) {
                                      print(
                                          'englishFirstName = $englishFirstName');
                                      RegExp regExp =
                                          RegExp('^[a-zA-Z][a-zA-Z ]+\$');
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
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),

            /// gender ///
            otherIsSelected == true
                ? Container(
                    margin: EdgeInsets.only(
                        right: SizeConfig().widthSize(context, 20), bottom: 20),
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
                  )
                : Container(),

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
                              Nationality2.id) {
                            return ("يرجى تحديد جنسية اخرى");
                          }
                        },
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
                        color: generalColor,
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
                                setState(() {
                                  isDateEnter = true;
                                });
                              },
                              maximumYear: DateTime.now().year,
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
                                setState(() {
                                  dateError = 'يرجى تحديد تاريخ الميلاد';
                                  date = '';
                                  isDateEnter = false;
                                });
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
                                  setState(() {
                                    dateError = null;
                                    isDateEnter = true;
                                  });
                                  Get.back();
                                } else {
                                  setState(() {
                                    dateError = 'يرجى تحديد تاريخ الميلاد';
                                    isDateEnter = false;
                                  });
                                }
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
                            )
                                .then((value) {
                              setState(() {
                                image = value!.path;
                              });
                            });
                            File? croppedFile = await ImageCropper.cropImage(
                                maxHeight: 300,
                                maxWidth: 300,
                                sourcePath: image!,
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.square,
                                  CropAspectRatioPreset.ratio3x2,
                                  CropAspectRatioPreset.original,
                                  CropAspectRatioPreset.ratio4x3,
                                  CropAspectRatioPreset.ratio16x9,
                                ],
                                androidUiSettings: AndroidUiSettings(
                                    toolbarTitle: 'Cropper',
                                    toolbarColor: Colors.deepOrange,
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

                            print('image = $image');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () async {
                            await _picker
                                .pickImage(
                              source: ImageSource.gallery,
                            )
                                .then((value) {
                              setState(() {
                                image = value!.path;
                              });
                            });
                            File? croppedFile = await ImageCropper.cropImage(
                                maxHeight: 600,
                                maxWidth: 600,
                                sourcePath: image!,
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.square,
                                ],
                                androidUiSettings: AndroidUiSettings(
                                  toolbarTitle: 'Cropper',
                                  toolbarColor: Colors.deepOrange,
                                  toolbarWidgetColor: Colors.white,
                                  initAspectRatio: CropAspectRatioPreset.square,
                                  lockAspectRatio: false,
                                ),
                                iosUiSettings: IOSUiSettings(
                                  minimumAspectRatio: 1.0,
                                ));
                            setState(() {
                              image = croppedFile!.path;
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

            /// addresses ///
            SizedBox(height: 20),
            Address(
              groupName: 'العنوان الاول',
              stringText1: 'الدولة',
              onFindCountry: (String? filter) {
                return getData(filter, countriesUrl);
              },
              onChangedCountry: (GetDataModel? model) {
                print('model?.name = ${model?.name}');
                setState(() {
                  selectedCountry = model;
                });
                countryID = model?.id;
                countryName = model?.name;
              },
              validatorCountry: FormBuilderValidators.required(
                context,
                errorText: dropdownErrorText,
              ),
              selectedItemCountry: selectedCountry,
              stringText2: 'المحافظة',
              onFindGovernorate: (String? filter) {
                return getData(filter, '$governoratesUrl/$countryID');
              },
              onChangedGovernorate: (GetDataModel? model) {
                print(model!.name);
                print(model.id);
                setState(() {
                  selectedGovernorate = model;
                  selectedCity = null;
                  selectedDestrict = null;
                });
                governorateID = model.id;
                governorateName = model.name;
              },
              validatorGovernorate: FormBuilderValidators.required(
                context,
                errorText: dropdownErrorText,
              ),
              selectedItemGovernorate: selectedGovernorate,
              stringText3: 'المدينة',
              onChangedCity: (GetDataModel? model) {
                print(model!.name);
                print(model.id);
                setState(() {
                  selectedCity = model;
                  selectedDestrict = null;
                });
                cityID = model.id;
                cityName = model.name;
                print('destrictID = $destrictID');
                print('destrictName = $destrictName');
              },
              validatorCity: FormBuilderValidators.required(
                context,
                errorText: dropdownErrorText,
              ),
              onFindCity: (String? filter) {
                return getData(filter, '$citiesUrl/$governorateID');
              },
              selectedItemCity: selectedCity,
              stringText4: 'المنطقة',
              onFindDestrict: (String? filter) {
                return getData(
                  filter,
                  '$destrictsUrl/$cityID',
                );
              },
              onChangedDestrict: (GetDataModel? model) {
                print(model!.name);
                print(model.id);
                setState(() {
                  selectedDestrict = model;
                });
                destrictID = model.id;
                destrictName = model.name;
                print('destrictID = $destrictID');
                print('destrictName = $destrictName');
              },
              selectedItemDestrict: selectedDestrict,
            ),

            /// chronic diseases and handicaps ///
            Container(
              alignment: Alignment.centerRight,
              child: textWidget(stringText: 'الحالة الصحية', fontSize: 17),
            ),
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
                            multiSelectedChronicDiseasesId.add(i.id);
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
      Step(
        title: textWidget(stringText: 'تأكيد المعلومات', fontSize: 12),
        isActive: _currentstep == 1,
        state: step2State,
        content: Container(
          child: Column(
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
              selectedRelation != null
                  ? BuildContainer(
                      stringText1: 'صلة القرابة',
                      stringText2:
                          '${selectedRelation!.name == 'اخر' ? relationInputController.text : selectedRelation!.name}',
                    )
                  : Container(),
              firstNameController.text.isNotEmpty ||
                      secondNameController.text.isNotEmpty ||
                      thirdNameController.text.isNotEmpty
                  ? BuildContainer(
                      stringText1: 'اسم المستخدم',
                      stringText2:
                          '${childFirstName!.isEmpty ? firstNameController.text : childFirstName} ${childSecondName!.isEmpty ? secondNameController.text : childSecondName} ${childThirdName!.isEmpty ? thirdNameController.text : childThirdName}',
                    )
                  : Container(),
              enFirstNameController.text.isNotEmpty ||
                      enSecondNameController.text.isNotEmpty ||
                      enThirdNameController.text.isNotEmpty
                  ? BuildContainer(
                      stringText1: '',
                      stringText2:
                          '${enChildFirstName!.isEmpty ? enFirstNameController.text : enChildFirstName} ${enChildSecondName!.isEmpty ? enSecondNameController.text : enChildSecondName} ${enChildThirdName!.isEmpty ? enThirdNameController.text : enChildThirdName}',
                    )
                  : Container(),
              BuildContainer(
                stringText1: 'الجنس',
                stringText2: '${gender ?? ''}',
              ),
              BuildContainer(
                stringText1: 'الجنسية',
                stringText2: '${nationality1Name ?? ''}',
              ),
              BuildContainer(
                stringText1: 'العنوان في العراق',
                stringText2:
                    '${countryName ?? ''} ${governorateName ?? ''} ${cityName ?? ''} ${destrictName ?? ''}',
              ),
              BuildContainer(
                stringText1: 'تاريخ الميلاد',
                stringText2: '$date',
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
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
              ),
              SizedBox(height: 30),
              Center(
                child: textWidget(
                  stringText: success == true ? '' : text,
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
