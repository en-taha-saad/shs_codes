// ignore: must_be_immutable
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/controllers/fetch_data.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/address.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

// ignore: must_be_immutable
class EditChildInformationView extends StatefulWidget {
  final String? getImage;
  final String? getRelatedFirstName;
  final String? getRelatedSecondName;
  final String? getRelatedSurName;
  final String? getRelatedSex;
  final DateTime? getRelatedDateOfBirth;
  final String? getRelatedHandicaps;
  final String? getRelatedChronicDiseases;
  final String? getRelatedNationalities1;
  final String? getRelatedNationalities2;
  final String? getRelatedCountry1;
  final String? getRelatedGov1;
  final String? getRelatedDestrict1;
  final String? getFamilyMemberPersonalId;
  final String? getRelatedEnFirstName;
  final String? getRelatedEnSecondName;
  final String? getRelatedEnSurName;
  final List<GetDataModel>? getRelatedChronicDiseasesList;
  final List<GetDataModel>? getRelatedHandicapsList;
  final List<GetDataModel>? getRelatedNationalitiesList;
  GetDataModel? getRelatedCountry1Model;
  GetDataModel? getRelatedGov1Model;
  GetDataModel? getRelatedCity1Model;
  GetDataModel? getRelatedDestrict1Model;
  final GetDataModel? getRelationModel;
  final int? getRelatedId;
  final int? getAddress1Id;
  final String? getRelatedSexEn;
  final String? getRelatedName;

  EditChildInformationView({
    this.getRelatedName,
    this.getRelatedSexEn,
    this.getAddress1Id,
    this.getRelatedId,
    this.getRelationModel,
    this.getRelatedChronicDiseasesList,
    this.getRelatedHandicapsList,
    this.getRelatedNationalitiesList,
    this.getRelatedCountry1Model,
    this.getRelatedGov1Model,
    this.getRelatedCity1Model,
    this.getRelatedDestrict1Model,
    this.getImage,
    this.getRelatedEnFirstName,
    this.getRelatedEnSecondName,
    this.getRelatedEnSurName,
    this.getFamilyMemberPersonalId,
    this.getRelatedFirstName,
    this.getRelatedSecondName,
    this.getRelatedSurName,
    this.getRelatedSex,
    this.getRelatedDateOfBirth,
    this.getRelatedHandicaps,
    this.getRelatedChronicDiseases,
    this.getRelatedNationalities1,
    this.getRelatedNationalities2,
    this.getRelatedCountry1,
    this.getRelatedGov1,
    this.getRelatedDestrict1,
  });

  @override
  _EditChildInformationView createState() => _EditChildInformationView();
}

class _EditChildInformationView extends State<EditChildInformationView> {
  @override
  void initState() {
    debugPrint('');
    confirmThatOtherIsSelected();
    debugPrint('gender = $gender');
    debugPrint('genderSex = $genderSex');
    debugPrint('widget.getRelatedSex = ${widget.getRelatedSex}');
    debugPrint('widget.getRelatedSexEn = ${widget.getRelatedSexEn}');
    debugPrint('femmaleGender = $femmaleGender');
    debugPrint('maleGender = $maleGender');
    super.initState();
  }

  var formKey = GlobalKey<FormBuilderState>();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;
  // var token = "112|AFY5SIOfhYGdhwUvSRkGWARs1pJR0q1xJcxkTIH3";
  bool? success1;
  bool? success2;
  bool? success3;
  bool? success4;
  bool? success5EditAddress1;
  bool? successRelation;
  DateTime? date;
  String? genderSex;
  String? gender;
  String maleGender = 'ذكر';
  String femmaleGender = 'انثى';
  String? text = '';
  GetDataModel? selectedNationality1;
  GetDataModel? selectedNationality2;
  List<GetDataModel>? multiSelectedChronicDiseasesModel = [];
  List<GetDataModel>? multiSelectedHandicapsModel = [];
  List<int?> multiSelectedHandicapsId = [];
  List<int?> multiSelectedChronicDiseasesId = [];
  GetDataModel? selectedCountry1;
  GetDataModel? selectedGovernorate1;
  GetDataModel? selectedCity1;
  GetDataModel? selectedDestrict1;
  GetDataModel? selectedCountry2;
  GetDataModel? selectedGovernorate2;
  GetDataModel? selectedCity2;
  GetDataModel? selectedDestrict2;
  bool? otherIsSelected = false;
  bool? toSelect = true;
  GetDataModel? selectedRelation;
  String? childFirstName;
  String? childSecondName;
  String? childThirdName;
  String? enChildFirstName;
  String? enChildSecondName;
  String? enChildThirdName;
  int? relationId;
  String? relationName;
  listOfRelationsItems() {
    return [
      GetDataModel(id: 1, name: 'ابن'),
      GetDataModel(id: 2, name: 'ابنة'),
      GetDataModel(id: 3, name: 'اخ شقيق'),
      GetDataModel(id: 4, name: 'اخت شقيقة'),
      GetDataModel(id: 5, name: 'اب'),
      GetDataModel(id: 6, name: 'ام'),
      GetDataModel(id: 7, name: 'اخ غير شقيق'),
      if (widget.getRelatedSex != 'ذكر') GetDataModel(id: 8, name: 'زوجة'),
      if (widget.getRelatedSex != 'انثى') GetDataModel(id: 11, name: 'زوج'),
      GetDataModel(id: 9, name: 'اخت غير شقيقة'),
      GetDataModel(id: 10, name: 'اخر'),
    ];
  }

  confirmThatOtherIsSelected() {
    print('@0');
    if (widget.getRelatedName != 'ابن' &&
        widget.getRelatedName != 'ابنه' &&
        widget.getRelatedName != 'ابنة' &&
        widget.getRelatedName != 'اخ شقيق' &&
        widget.getRelatedName != 'اخت شقيقة' &&
        widget.getRelatedName != 'اخت شقيقه' &&
        widget.getRelatedName != 'اب' &&
        widget.getRelatedName != 'ام' &&
        widget.getRelatedName != 'اخ غير شقيق' &&
        widget.getRelatedName != 'زوجه' &&
        widget.getRelatedName != 'زوجة' &&
        widget.getRelatedName != 'زوج' &&
        widget.getRelatedName != 'اخت غير شقيقة' &&
        widget.getRelatedName != 'اخت غير شقيقه') {
      print('@1');
      otherIsSelected = true;
      selectedRelation = GetDataModel(name: 'اخر');
      print('widget.getRelationModel?.name = ${widget.getRelationModel}');
      relationName = widget.getRelatedName;
      setState(() {});
    } else {
      print('@2');
      otherIsSelected = false;
      selectedRelation = GetDataModel(name: (widget.getRelatedName!));
      setState(() {});
    }
  }

  sendNationalities() {
    if (selectedNationality2 != null) {
      return [
        selectedNationality1?.id ?? widget.getRelatedNationalitiesList?[0].id,
        selectedNationality2?.id,
      ];
    }
    if (selectedNationality2 == null &&
        widget.getRelatedNationalitiesList?.length == 2) {
      return [
        selectedNationality1?.id ?? widget.getRelatedNationalitiesList?[0].id,
        widget.getRelatedNationalitiesList?[1].id,
      ];
    }
    if (selectedNationality2 == null &&
        widget.getRelatedNationalitiesList?.length == 1) {
      return [
        selectedNationality1?.id ?? widget.getRelatedNationalitiesList?[0].id
      ];
    }
  }

  Future nationalitiesEdit() async {
    try {
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateChildUurl/nationalities/${widget.getRelatedId}'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
      };
      request.headers.addAll(headers);

      request.fields.addAll({
        '_method': 'PUT',
        'nationalities': '${sendNationalities()}',
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        success2 = true;
      } else {
        success2 = false;
      }
      setState(() {});
    } on SocketException {
      success2 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success2 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success2 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future chronicDiseasesEdit() async {
    try {
      // ignore: prefer_is_empty
      debugPrint('chronicDiseasesEdit will be activiated');

      debugPrint(
        'map = ${{
          '_method': 'PUT',
          'chronic_diseases': '$multiSelectedChronicDiseasesId',
        }}',
      );
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateChildUurl/chronic_diseases/${widget.getRelatedId}'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
      };
      request.headers.addAll(headers);

      request.fields.addAll({
        '_method': 'PUT',
        'chronic_diseases': '$multiSelectedChronicDiseasesId',
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        success3 = true;
      } else {
        success3 = false;
      }
      setState(() {});
    } on SocketException {
      success3 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success3 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success3 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future handicapsEdit() async {
    try {
      // ignore: prefer_is_empty
      debugPrint('handicapsEdit will be activiated');
      debugPrint(
        'map = ${{
          '_method': 'PUT',
          'handicaps': '$multiSelectedHandicapsId',
        }}',
      );
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateChildUurl/handicaps/${widget.getRelatedId}'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
      };
      request.headers.addAll(headers);

      request.fields.addAll({
        '_method': 'PUT',
        'handicaps': '$multiSelectedHandicapsId',
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        success4 = true;
      } else {
        success4 = false;
      }
      setState(() {});
    } on SocketException {
      success4 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success4 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success4 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future infoEdit() async {
    try {
      if (childFirstName != null ||
          enChildFirstName != null ||
          childSecondName != null ||
          enChildSecondName != null ||
          childThirdName != null ||
          enChildThirdName != null ||
          genderSex != null ||
          date != null) {
        debugPrint('infoEdit will be activiated');
        debugPrint(
          'map = ${{
            "first_name": '${childFirstName ?? widget.getRelatedFirstName}',
            "second_name": '${childSecondName ?? widget.getRelatedSecondName}',
            "sure_name": '${childThirdName ?? widget.getRelatedSurName}',
            "en_first_name":
                '${enChildFirstName ?? widget.getRelatedEnFirstName}',
            "en_second_name":
                '${enChildSecondName ?? widget.getRelatedEnSecondName}',
            "en_sure_name": '${enChildThirdName ?? widget.getRelatedEnSurName}',
            "sex": '${genderSex ?? widget.getRelatedSexEn}',
            "date_of_birth": date != null
                ? '${date?.year}-${date?.month.toString().length == 1 ? '0${date?.month}' : date?.month}-${date?.day}'
                : '${widget.getRelatedDateOfBirth?.year}-${widget.getRelatedDateOfBirth?.month.toString().length == 1 ? '0${widget.getRelatedDateOfBirth?.month}' : widget.getRelatedDateOfBirth?.month}-${getDateOfBirth?.day}',
            "independent": '0',
            '_method': 'PUT',
          }}',
        );
        setState(() => text = '');
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('$updateChildUurl/info/${widget.getRelatedId}'),
        );
        request.fields.addAll({
          "first_name": '${childFirstName ?? widget.getRelatedFirstName}',
          "second_name": '${childSecondName ?? widget.getRelatedSecondName}',
          "sure_name": '${childThirdName ?? widget.getRelatedSurName}',
          "en_first_name":
              '${enChildFirstName ?? widget.getRelatedEnFirstName}',
          "en_second_name":
              '${enChildSecondName ?? widget.getRelatedEnSecondName}',
          "en_sure_name": '${enChildThirdName ?? widget.getRelatedEnSurName}',
          "sex": '${genderSex ?? widget.getRelatedSexEn}',
          "date_of_birth": date != null
              ? '${date?.year}-${date?.month.toString().length == 1 ? '0${date?.month}' : date?.month}-${date?.day}'
              : '${widget.getRelatedDateOfBirth?.year}-${widget.getRelatedDateOfBirth?.month.toString().length == 1 ? '0${widget.getRelatedDateOfBirth?.month}' : widget.getRelatedDateOfBirth?.month}-${getDateOfBirth?.day}',
          "independent": '0',
          '_method': 'PUT',
        });

        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $savedToken'
        };
        debugPrint('@1');
        request.headers.addAll(headers);
        debugPrint('@1');
        http.StreamedResponse response = await request.send();
        debugPrint('@1');

        if (response.statusCode == 200) {
          debugPrint(
            '200 await response.stream.bytesToString() = ${await response.stream.bytesToString()}',
          );
          success1 = true;
        } else {
          debugPrint(
            'await response.stream.bytesToString() = ${await response.stream.bytesToString()}',
          );
          success1 = false;
        }
      } else {
        debugPrint(
          'map = ${{
            "first_name": '${childFirstName ?? widget.getRelatedFirstName}',
            "second_name": '${childSecondName ?? widget.getRelatedSecondName}',
            "sure_name": '${childThirdName ?? widget.getRelatedSurName}',
            "en_first_name":
                '${enChildFirstName ?? widget.getRelatedEnFirstName}',
            "en_second_name":
                '${enChildSecondName ?? widget.getRelatedEnSecondName}',
            "en_sure_name": '${enChildThirdName ?? widget.getRelatedEnSurName}',
            "sex": '${genderSex ?? widget.getRelatedSexEn}',
            "date_of_birth": date != null
                ? '${date?.year}-${date?.month.toString().length == 1 ? '0${date?.month}' : date?.month}-${date?.day}'
                : '${widget.getRelatedDateOfBirth?.year}-${widget.getRelatedDateOfBirth?.month.toString().length == 1 ? '0${widget.getRelatedDateOfBirth?.month}' : widget.getRelatedDateOfBirth?.month}-${getDateOfBirth?.day}',
            "independent": '0',
            '_method': 'PUT',
          }}',
        );

        success1 = true;
      }
      setState(() {});
    } on SocketException {
      success1 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success1 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success1 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future relationEdit() async {
    try {
      if (relationName != null || widget.getRelationModel != null) {
        setState(() => text = '');
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
            'https://shs-iq.com/api/api/update_profile/related/${widget.getRelatedId}',
          ),
        );
        request.fields.addAll({
          "relation": '${relationName ?? widget.getRelationModel?.name}',
          '_method': 'PUT',
        });

        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $savedToken'
        };

        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          successRelation = true;
        } else {
          successRelation = false;
        }
      } else {
        successRelation = true;
      }
      setState(() {});
    } on SocketException {
      successRelation = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      successRelation = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      successRelation = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future address1Edit() async {
    try {
      if (selectedDestrict1 != null ||
          selectedCity1 != null ||
          selectedGovernorate1 != null ||
          selectedCountry1 != null) {
        debugPrint('addresses1Edit will be activiated');

        debugPrint(
          'address1 map1 = ${{
            'region_id': '${selectedDestrict1?.id}',
            'city_id': '${selectedCity1?.id}',
            'governorate_id': '${selectedGovernorate1?.id}',
            'country_id': '${selectedCountry1?.id}',
            '_method': 'PUT'
          }}',
        );

        debugPrint(
          'address1 map2 = ${{
            'region_id': '${getRegion1Model?.id}',
            'city_id': '${getCity1Model?.id}',
            'governorate_id': '${getGov1Model?.id}',
            'country_id': '${getCountry1Model?.id}',
            '_method': 'PUT'
          }}',
        );

        debugPrint(
          'address1 map3 = ${{
            'region_id':
                '${selectedDestrict1?.id ?? widget.getRelatedDestrict1Model?.id ?? ''}',
            'city_id':
                '${selectedCity1?.id ?? widget.getRelatedCity1Model?.id}',
            'governorate_id':
                '${selectedGovernorate1?.id ?? widget.getRelatedGov1Model?.id}',
            'country_id':
                '${selectedCountry1?.id ?? widget.getRelatedCountry1Model?.id}',
            '_method': 'PUT'
          }}',
        );

        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $savedToken'
        };
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
            '$updateChildUurl/address/${widget.getRelatedId}/${widget.getAddress1Id}',
          ),
        );
        request.fields.addAll({
          'region_id':
              '${selectedDestrict1?.id ?? widget.getRelatedDestrict1Model?.id ?? ''}',
          'city_id': '${selectedCity1?.id ?? widget.getRelatedCity1Model?.id}',
          'governorate_id':
              '${selectedGovernorate1?.id ?? widget.getRelatedGov1Model?.id}',
          'country_id':
              '${selectedCountry1?.id ?? widget.getRelatedCountry1Model?.id}',
          '_method': 'PUT'
        });

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          success5EditAddress1 = true;
          print(
            'await response.stream.bytesToString() = ${await response.stream.bytesToString()}',
          );
        } else {
          debugPrint('@7');
          success5EditAddress1 = false;
          print(response.reasonPhrase);
        }
      } else {
        success5EditAddress1 = true;
      }
      setState(() {});
    } on SocketException {
      success5EditAddress1 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success5EditAddress1 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success5EditAddress1 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
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
              child: textWidget(
                stringText:
                    'تعديل حساب ${widget.getRelatedFirstName ?? ''} ${widget.getRelatedSecondName ?? ''}',
                color: Colors.black,
                fontSize: 20,
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
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 30),

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
                            enabled: false,
                            items: listOfRelationsItems(),
                            clearButtonBuilder: (context) {
                              return IconButton(
                                onPressed: () {
                                  selectedRelation = GetDataModel(name: '');
                                  relationName = null;
                                  relationId = null;
                                  gender = null;
                                  genderSex = null;
                                  childFirstName = null;
                                  childSecondName = null;
                                  childThirdName = null;
                                  enChildFirstName = null;
                                  enChildSecondName = null;
                                  enChildThirdName = null;
                                  toSelect = false;
                                  otherIsSelected = false;
                                  setState(() {});
                                },
                                icon: Icon(Icons.clear),
                              );
                            },
                            onChanged: (GetDataModel? model) {
                              relationName = null;
                              selectedRelation = null;
                              relationId = null;
                              selectedRelation = model;
                              relationName = model?.name;
                              relationId = model?.id;
                              if (relationId == 1 ||
                                  relationId == 3 ||
                                  relationId == 5 ||
                                  relationId == 7 ||
                                  relationId == 11) {
                                toSelect = true;
                                otherIsSelected == false;
                                gender = 'ذكر';
                                genderSex = 'male';
                                setState(() {});
                              }
                              if (relationId == 2 ||
                                  relationId == 4 ||
                                  relationId == 6 ||
                                  relationId == 8 ||
                                  relationId == 9) {
                                toSelect = true;
                                otherIsSelected == false;
                                gender = 'ذكر';
                                genderSex = 'male';
                                setState(() {});
                              }
                              if (relationId == 10) {
                                toSelect = true;
                                otherIsSelected == true;
                                gender = null;
                                genderSex = null;
                                setState(() {});
                              }
                              setState(() {});
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    enabled: false,
                                    height: SizeConfig().heightSize(context, 7),
                                    onChanged: (value) {
                                      relationName = value!;
                                      setState(() {});
                                    },
                                    initialValue: relationName,
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
                                    ]),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            SizeConfig().widthSize(context, 25),
                                        height: SizeConfig()
                                            .heightSize(context, 17),
                                        child: textWidget(
                                          stringText: 'الإسم الاول*',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            SizeConfig().widthSize(context, 25),
                                        height: SizeConfig()
                                            .heightSize(context, 18),
                                        child: textWidget(
                                          stringText: 'إسم الأب*',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            SizeConfig().widthSize(context, 25),
                                        height:
                                            SizeConfig().heightSize(context, 7),
                                        child: textWidget(
                                          stringText: 'إسم اللقب او الجد*',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          TextFieldForm(
                                            height: SizeConfig()
                                                .heightSize(context, 7),
                                            onChanged: (value) {
                                              childFirstName = value!;
                                              setState(() {});
                                            },
                                            initialValue: childFirstName ??
                                                widget.getRelatedFirstName ??
                                                '',
                                            obscureText: false,
                                            icons: Icons.person,
                                            name: 'first_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'الإسم الاول بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
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
                                            ]),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                          TextFieldForm(
                                            obscureText: false,
                                            onChanged: (value) {
                                              enChildFirstName = value!;
                                              setState(() {});
                                            },
                                            initialValue: enChildFirstName ??
                                                widget.getRelatedEnFirstName ??
                                                '',
                                            icons: Icons.person,
                                            labelText: 'الإسم الاول بالإنكليزي',
                                            name: 'en_first_name',
                                            keyboardType: TextInputType.name,
                                            validator:
                                                (String? englishFirstName) {
                                              if (englishFirstName!
                                                  .isNotEmpty) {
                                                RegExp regExp = RegExp(
                                                    '^[a-zA-Z][a-zA-Z ]+\$');
                                                if (!regExp.hasMatch(
                                                    englishFirstName)) {
                                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                                }
                                              } else {
                                                return null;
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextFieldForm(
                                            obscureText: false,
                                            height: SizeConfig()
                                                .heightSize(context, 7),
                                            onChanged: (value) {
                                              childSecondName = value!;
                                              setState(() {});
                                            },
                                            initialValue: childSecondName ??
                                                widget.getRelatedSecondName ??
                                                '',
                                            icons: Icons.person,
                                            name: 'second_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'إسم الأب بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
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
                                            ]),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                          TextFieldForm(
                                            obscureText: false,
                                            onChanged: (value) {
                                              enChildSecondName = value!;
                                              setState(() {});
                                            },
                                            initialValue: enChildSecondName ??
                                                widget.getRelatedEnSecondName ??
                                                '',
                                            icons: Icons.person,
                                            labelText: 'إسم الأب بالإنكليزي',
                                            name: 'en_second_name',
                                            keyboardType: TextInputType.name,
                                            validator:
                                                (String? englishFirstName) {
                                              if (englishFirstName!
                                                  .isNotEmpty) {
                                                RegExp regExp = RegExp(
                                                    '^[a-zA-Z][a-zA-Z ]+\$');
                                                if (!regExp.hasMatch(
                                                    englishFirstName)) {
                                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                                }
                                              } else {
                                                return null;
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextFieldForm(
                                            obscureText: false,
                                            height: SizeConfig()
                                                .heightSize(context, 7),
                                            onChanged: (value) {
                                              childThirdName = value!;
                                              setState(() {});
                                            },
                                            initialValue: childThirdName ??
                                                widget.getRelatedSurName ??
                                                '',
                                            icons: Icons.person,
                                            name: 'third_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'الجد او اللقب بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
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
                                            ]),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                          TextFieldForm(
                                            obscureText: false,
                                            onChanged: (value) {
                                              enChildThirdName = value!;
                                              setState(() {});
                                            },
                                            initialValue: enChildThirdName ??
                                                widget.getRelatedEnSurName ??
                                                '',
                                            icons: Icons.person,
                                            name: 'en_third_name',
                                            keyboardType: TextInputType.name,
                                            labelText:
                                                'الجد او اللقب بالإنكليزي',
                                            validator:
                                                (String? englishFirstName) {
                                              if (englishFirstName!
                                                  .isNotEmpty) {
                                                RegExp regExp = RegExp(
                                                    '^[a-zA-Z][a-zA-Z ]+\$');
                                                if (!regExp.hasMatch(
                                                    englishFirstName)) {
                                                  return ("يسمح فقط ب حروف انكليزية ومسافه");
                                                }
                                              } else {
                                                return null;
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
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
                                right: SizeConfig().widthSize(context, 20),
                                bottom: 20,
                              ),
                              child: FormBuilderRadioGroup<String?>(
                                onChanged: (String? selected) {
                                  gender = selected;
                                  if (gender == 'ذكر') {
                                    genderSex = 'male';
                                  }
                                  if (gender == 'انثى') {
                                    genderSex = 'female';
                                  }
                                  debugPrint('selected = $selected');
                                  debugPrint('gender = $gender');
                                  debugPrint('genderSex = $genderSex');
                                  debugPrint(
                                      'widget.getRelatedSex = ${widget.getRelatedSex}');
                                  debugPrint(
                                      'widget.getRelatedSexEn = ${widget.getRelatedSexEn}');

                                  debugPrint('femmaleGender = $femmaleGender');
                                  debugPrint('maleGender = $maleGender');

                                  setState(() {});
                                },
                                initialValue: gender ?? widget.getRelatedSex,
                                separator: SizedBox(width: 35),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorStyle: style(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                                wrapSpacing: 100,
                                name: 'gender',
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                options: [
                                  FormBuilderFieldOption(
                                    value: maleGender,
                                    child: Text(
                                      maleGender,
                                      style: style(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  FormBuilderFieldOption(
                                    value: femmaleGender,
                                    child: Text(
                                      femmaleGender,
                                      style: style(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                                controlAffinity: ControlAffinity.trailing,
                              ),
                            )
                          : Container(),

                      /// date ///
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textWidget(stringText: 'تاريخ الميلاد'),
                                SizedBox(height: 12),
                                TextButton(
                                  child: SvgPicture.asset(
                                    'assets/general_for_two_apps/selectsIcons/date.svg',
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
                                            date = value;
                                            setState(() {});
                                          },
                                          maximumYear: DateTime.now().year,
                                          initialDateTime: DateTime(
                                            (date?.year ??
                                                (widget.getRelatedDateOfBirth
                                                    ?.year)!),
                                            (date?.month ??
                                                (widget.getRelatedDateOfBirth
                                                    ?.month)!),
                                            (date?.day ??
                                                (widget.getRelatedDateOfBirth
                                                    ?.day)!),
                                          ),
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
                                              date = DateTime(
                                                date?.year ??
                                                    DateTime.now().year,
                                                date?.month ??
                                                    DateTime.now().month,
                                                date?.day ?? DateTime.now().day,
                                              );
                                              setState(() {});
                                              Get.back();
                                            } else {
                                              Get.back();
                                            }
                                          },
                                        )
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              child: textWidget(
                                // ignore: unnecessary_string_interpolations
                                stringText:
                                    '${date?.year ?? widget.getRelatedDateOfBirth?.year}-${date?.month ?? widget.getRelatedDateOfBirth?.month}-${date?.day ?? widget.getRelatedDateOfBirth?.day}',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                                    stringText: 'الجنسية الاولى',
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
                                    selectedNationality1 = model;
                                    setState(() {});
                                  },
                                  selectedItem: selectedNationality1 ??
                                      widget.getRelatedNationalitiesList?[0],
                                  validator: FormBuilderValidators.required(
                                    context,
                                    errorText: dropdownErrorText,
                                  ),
                                  clearButton: IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      selectedNationality1 = null;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                DropDownFormField(
                                  onFind: (String? filter) => getData(
                                    filter,
                                    nationalitiesUrl,
                                  ),
                                  selectedItem: selectedNationality2 ??
                                      ((widget.getRelatedNationalitiesList
                                                  ?.length)! >
                                              1
                                          ? (widget
                                              .getRelatedNationalitiesList?[1])
                                          : selectedNationality2),
                                  clearButton: IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      selectedNationality2 = null;
                                      setState(() {});
                                    },
                                  ),
                                  onChanged: (GetDataModel? model) {
                                    selectedNationality2 = model;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// addresses ///
                      Address(
                        groupName: 'العنوان الاول',
                        stringText1: 'الدولة',
                        onFindCountry: (String? filter) {
                          return getData(filter, countriesUrl);
                        },
                        onChangedCountry: (GetDataModel? model) {
                          selectedCountry1 = model;
                          selectedGovernorate1 = null;
                          selectedCity1 = null;
                          selectedDestrict1 = null;
                          widget.getRelatedGov1Model = null;
                          widget.getRelatedCity1Model = null;
                          widget.getRelatedDestrict1Model = null;
                          setState(() {});
                        },
                        clearButtonCountry: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            selectedCountry1 = null;
                            selectedGovernorate1 = null;
                            selectedCity1 = null;
                            selectedDestrict1 = null;
                            widget.getRelatedCountry1Model = null;
                            widget.getRelatedGov1Model = null;
                            widget.getRelatedCity1Model = null;
                            widget.getRelatedDestrict1Model = null;
                            Get.snackbar(
                              '',
                              '',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              titleText: Center(
                                child: textWidget(
                                  stringText: 'يرجى ملى الحقول المطلوبة',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              messageText: Container(),
                              padding: EdgeInsets.all(15),
                              snackStyle: SnackStyle.FLOATING,
                              duration: Duration(seconds: 4),
                              dismissDirection: SnackDismissDirection.VERTICAL,
                                          // dismissDirection: DismissDirection.vertical,

                              margin: EdgeInsets.all(15),
                              borderRadius: 20,
                            );
                            setState(() {});
                          },
                        ),
                        validatorCountry: FormBuilderValidators.required(
                          context,
                          errorText: dropdownErrorText,
                        ),
                        selectedItemCountry:
                            selectedCountry1 ?? widget.getRelatedCountry1Model,
                        stringText2: 'المحافظة',
                        onFindGovernorate: (String? filter) {
                          return getData(
                            filter,
                            '$governoratesUrl/${selectedCountry1?.id ?? widget.getRelatedCountry1Model?.id}',
                          );
                        },
                        onChangedGovernorate: (GetDataModel? model) {
                          selectedGovernorate1 = model;
                          selectedCity1 = null;
                          selectedDestrict1 = null;
                          widget.getRelatedCity1Model = null;
                          widget.getRelatedDestrict1Model = null;

                          setState(() {});
                        },
                        clearButtonGovernorate: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            selectedGovernorate1 = null;
                            selectedCity1 = null;
                            selectedDestrict1 = null;
                            widget.getRelatedGov1Model = null;
                            widget.getRelatedCity1Model = null;
                            widget.getRelatedDestrict1Model = null;

                            Get.snackbar(
                              '',
                              '',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              titleText: Center(
                                child: textWidget(
                                  stringText: 'يرجى ملى الحقول المطلوبة',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              messageText: Container(),
                              padding: EdgeInsets.all(15),
                              snackStyle: SnackStyle.FLOATING,
                              duration: Duration(seconds: 4),
                              dismissDirection: SnackDismissDirection.VERTICAL
                              ,
                                          // dismissDirection: DismissDirection.vertical,


                              margin: EdgeInsets.all(15),
                              borderRadius: 20,
                            );
                            setState(() {});
                          },
                        ),
                        validatorGovernorate: FormBuilderValidators.required(
                          context,
                          errorText: dropdownErrorText,
                        ),
                        selectedItemGovernorate:
                            selectedGovernorate1 ?? widget.getRelatedGov1Model,
                        stringText3: 'المدينة',
                        onFindCity: (String? filter) {
                          return getData(filter,
                              '$citiesUrl/${selectedGovernorate1?.id ?? widget.getRelatedGov1Model?.id}');
                        },
                        onChangedCity: (GetDataModel? model) {
                          selectedCity1 = model;
                          selectedDestrict1 = null;
                          widget.getRelatedDestrict1Model = null;

                          setState(() {});
                        },
                        clearButtonCity: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            selectedCity1 = null;
                            selectedDestrict1 = null;
                            widget.getRelatedCity1Model = null;
                            widget.getRelatedDestrict1Model = null;

                            Get.snackbar(
                              '',
                              '',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              titleText: Center(
                                child: textWidget(
                                  stringText: 'يرجى ملى الحقول المطلوبة',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              messageText: Container(),
                              padding: EdgeInsets.all(15),
                              snackStyle: SnackStyle.FLOATING,
                              duration: Duration(seconds: 4),
                              dismissDirection: SnackDismissDirection.VERTICAL,
                                          // dismissDirection: DismissDirection.vertical,

                              margin: EdgeInsets.all(15),
                              borderRadius: 20,
                            );
                            setState(() {});
                          },
                        ),
                        validatorCity: FormBuilderValidators.required(
                          context,
                          errorText: dropdownErrorText,
                        ),
                        selectedItemCity:
                            selectedCity1 ?? widget.getRelatedCity1Model,
                        stringText4: 'المنطقة',
                        onFindDestrict: (String? filter) {
                          return getData(
                            filter,
                            '$destrictsUrl/${selectedCity1?.id ?? widget.getRelatedCity1Model?.id}',
                          );
                        },
                        onChangedDestrict: (GetDataModel? model) {
                          selectedDestrict1 = model;
                          setState(() {});
                        },
                        clearButtonDestrict: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            selectedDestrict1 = null;
                            widget.getRelatedDestrict1Model = null;

                            setState(() {});
                          },
                        ),
                        selectedItemDestrict: selectedDestrict1 ??
                            widget.getRelatedDestrict1Model,
                      ),

                      /// chronic diseases and handicaps ///
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: textWidget(
                            stringText: 'الحالة الصحية', fontSize: 17),
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
                                    for (var i in model) {
                                      multiSelectedChronicDiseasesId.add(i.id);
                                      multiSelectedChronicDiseasesModel?.add(i);
                                    }
                                    setState(() {});
                                  },
                                  selectedItems:
                                      // ignore: prefer_is_empty
                                      multiSelectedChronicDiseasesModel
                                                  ?.length ==
                                              0
                                          ? widget
                                              .getRelatedChronicDiseasesList!
                                          : multiSelectedChronicDiseasesModel!,
                                  onFind: (String? filter) {
                                    return getData(
                                      filter,
                                      chronicDiseasesUrl,
                                    );
                                  },
                                ),
                                MultiSelectDropDownFormField(
                                  onChange: (model) {
                                    for (var i in model) {
                                      multiSelectedHandicapsId.add(i.id);
                                      multiSelectedHandicapsModel?.add(i);
                                    }
                                    setState(() {});
                                  },
                                  selectedItems:
                                      // ignore: prefer_is_empty
                                      multiSelectedHandicapsModel?.length == 0
                                          ? widget.getRelatedHandicapsList!
                                          : multiSelectedHandicapsModel!,
                                  onFind: (String? filter) =>
                                      getData(filter, handicapsUrl),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// submit button ///
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: ProgressButton.icon(
                          iconedButtons: {
                            ButtonState.idle: IconedButton(
                              text: "حفظ التغييرات",
                              icon: Icon(Icons.save, color: Colors.white),
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
                          maxWidth: 110.0,
                          progressIndicator: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            color: Colors.white,
                            strokeWidth: 2.0,
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
                            if (formKey.currentState!.saveAndValidate()) {
                              stateTextWithIcon = ButtonState.loading;
                              setState(() {});
                              Future.wait([
                                infoEdit(),
                                nationalitiesEdit(),
                                chronicDiseasesEdit(),
                                handicapsEdit(),
                                address1Edit(),
                                relationEdit(),
                              ]).then(
                                (_) {
                                  debugPrint('success1 = $success1');
                                  debugPrint('success2 = $success2');
                                  debugPrint('success3 = $success3');
                                  debugPrint('success4 = $success4');
                                  debugPrint(
                                    'success5EditAddress1 = $success5EditAddress1',
                                  );

                                  debugPrint(
                                    'successRelation = $successRelation',
                                  );

                                  switch (stateTextWithIcon) {
                                    case ButtonState.idle:
                                      break;
                                    case ButtonState.loading:
                                      if (success1 == true &&
                                          success2 == true &&
                                          success3 == true &&
                                          success4 == true &&
                                          success5EditAddress1 == true &&
                                          successRelation == true) {
                                        stateTextWithIcon = ButtonState.success;
                                        Get.back();
                                        Get.back();
                                        Get.offAndToNamed(
                                          Routes.FAMILY_INFORMATION,
                                        );
                                      } else {
                                        stateTextWithIcon = ButtonState.fail;
                                      }
                                      setState(() {});
                                      break;
                                    case ButtonState.success:
                                      stateTextWithIcon = ButtonState.idle;
                                      setState(() {});

                                      break;
                                    case ButtonState.fail:
                                      stateTextWithIcon = ButtonState.idle;
                                      setState(() {});

                                      break;
                                  }
                                },
                              );
                            } else {
                              Get.snackbar(
                                '',
                                '',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                titleText: Center(
                                  child: textWidget(
                                    stringText: 'يرجى ملى الحقول المطلوبة',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                messageText: Container(),
                                padding: EdgeInsets.all(15),
                                snackStyle: SnackStyle.FLOATING,
                                duration: Duration(seconds: 3),
                                dismissDirection:
                                    SnackDismissDirection.VERTICAL,
            // dismissDirection: DismissDirection.vertical,

                                margin: EdgeInsets.all(15),
                                borderRadius: 20,
                              );
                            }
                          },
                          state: stateTextWithIcon,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
