// ignore_for_file: prefer_is_empty

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
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/drop_down_patient.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/text_field_patient.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/modules/profile/user_model.dart' as profile;
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class EditPersonalInformationView extends StatefulWidget {
  @override
  _EditPersonalInformationView createState() => _EditPersonalInformationView();
}

class _EditPersonalInformationView extends State<EditPersonalInformationView> {
  var formKey = GlobalKey<FormBuilderState>();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;
  Future<profile.ParentProfile>? fetchParentProfileVar;
  // var token = "112|AFY5SIOfhYGdhwUvSRkGWARs1pJR0q1xJcxkTIH3";
  bool? success1;
  bool? success2;
  bool? success3;
  bool? success4;
  bool? success5EditAddress1;
  bool? success6EditAddress2;
  bool? success7AddAddress2;
  DateTime? date;
  String? genderSex;
  String? gender;
  String maleGender = 'ذكر';
  String femmaleGender = 'انثى';
  String? text = '';
  String? firstArName;
  String? firstEnName;
  String? secondArName;
  String? secondEnName;
  String? thirdArName;
  String? thirdEnName;
  GetDataModel? selectedNationality1;
  GetDataModel? selectedNationality2;
  List<GetDataModel>? multiSelectedChronicDiseasesModel = [];
  List<GetDataModel>? multiSelectedHandicapsModel = [];
  List<int?>? multiSelectedHandicapsId = [];
  List<int?>? multiSelectedChronicDiseasesId = [];

  GetDataModel? selectedCountry1;
  GetDataModel? selectedGovernorate1;
  GetDataModel? selectedCity1;
  GetDataModel? selectedDestrict1;
  GetDataModel? selectedCountry2;
  GetDataModel? selectedGovernorate2;
  GetDataModel? selectedCity2;
  GetDataModel? selectedDestrict2;

  sendNationalities() {
    if (selectedNationality2 != null) {
      debugPrint('@@@@1111');
      return [
        selectedNationality1?.id ?? getNationalities1Model?.id,
        selectedNationality2?.id,
      ];
    }
    if (selectedNationality2 == null && getNationalities2Model != null) {
      debugPrint('@@@@22222');
      return [
        selectedNationality1?.id ?? getNationalities1Model?.id,
        getNationalities2Model?.id,
      ];
    }
    if (selectedNationality2 == null && getNationalities2Model == null) {
      debugPrint('@@@@3333');
      return [selectedNationality1?.id ?? getNationalities1Model?.id];
    }
  }

  Future nationalitiesEdit() async {
    try {
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateUurl/nationalities'),
      );
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken',
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
      debugPrint('chronicDiseasesEdit will be activiated');
      debugPrint(
          'multiSelectedChronicDiseasesModel = ${multiSelectedChronicDiseasesModel}');
      debugPrint(
          'multiSelectedChronicDiseasesId = ${multiSelectedChronicDiseasesId}');

      // debugPrint(
      //   'map = ${{
      //     '_method': 'PUT',
      //     'chronic_diseases': '$multiSelectedChronicDiseasesId',
      //   }}',
      // );
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateUurl/chronic_diseases'),
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
        print(
          'await response.stream.bytesToString() = ${await response.stream.bytesToString()}',
        );
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
      debugPrint('handicapsEdit will be activiated');
      // debugPrint(
      //   'map = ${{
      //     '_method': 'PUT',
      //     'handicaps': '$multiSelectedHandicapsId',
      //   }}',
      // );
      setState(() => text = '');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$updateUurl/handicaps'),
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
        success4 = true;
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
      if (firstArName != null ||
          firstEnName != null ||
          secondArName != null ||
          secondEnName != null ||
          thirdArName != null ||
          thirdEnName != null ||
          genderSex != null ||
          gender != null ||
          date != null) {
        print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@gender = $gender');
        debugPrint('infoEdit will be activiated');
        if (gender == 'ذكر') {
          genderSex = 'male';
        } else if (gender == 'انثى') {
          genderSex = 'female';
        }

        // debugPrint(
        //   'map = ${{
        //     "first_name": '${firstArName ?? getFirstName}',
        //     "second_name": '${secondArName ?? getSecondName}',
        //     "sure_name": '${thirdArName ?? getSurName}',
        //     "en_first_name": '${firstEnName ?? getEnFirstName}',
        //     "en_second_name": '${secondEnName ?? getEnSecondName}',
        //     "en_sure_name": '${thirdEnName ?? getEnSurName}',
        //     "sex": genderSex ?? getOriginalSex,
        //     "date_of_birth":
        //         '${date?.year ?? getDateOfBirth?.year}-${date?.month.toString().length == 1 ? '0${date?.month}' : date?.month ?? getDateOfBirth?.month}-${date?.day ?? getDateOfBirth?.day}',
        //     "independent": '1',
        //     '_method': 'PUT',
        //   }}',
        // );
        setState(() => text = '');
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('$updateUurl/info'),
        );
        request.fields.addAll({
          "first_name": '${firstArName ?? getFirstName}',
          "second_name": '${secondArName ?? getSecondName}',
          "sure_name": '${thirdArName ?? getSurName}',
          "en_first_name": '${firstEnName ?? getEnFirstName}',
          "en_second_name": '${secondEnName ?? getEnSecondName}',
          "en_sure_name": '${thirdEnName ?? getEnSurName}',
          "sex": '${genderSex ?? getOriginalSex}',
          "date_of_birth":
              '${date?.year ?? getDateOfBirth?.year}-${date?.month.toString().length == 1 ? '0${date?.month}' : date?.month ?? getDateOfBirth?.month}-${date?.day ?? getDateOfBirth?.day}',
          "independent": '1',
          '_method': 'PUT',
        });

        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $savedToken'
        };

        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          success1 = true;
        } else {
          success1 = false;
        }
      } else {
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
                '${selectedDestrict1?.id ?? getRegion1Model?.id ?? ''}',
            'city_id': '${selectedCity1?.id ?? getCity1Model?.id}',
            'governorate_id': '${selectedGovernorate1?.id ?? getGov1Model?.id}',
            'country_id': '${selectedCountry1?.id ?? getCountry1Model?.id}',
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
            'https://shs-iq.com/api/api/update_profile/address/$address1Id',
          ),
        );
        request.fields.addAll({
          'region_id': '${selectedDestrict1?.id ?? getRegion1Model?.id ?? ''}',
          'city_id': '${selectedCity1?.id ?? getCity1Model?.id}',
          'governorate_id': '${selectedGovernorate1?.id ?? getGov1Model?.id}',
          'country_id': '${selectedCountry1?.id ?? getCountry1Model?.id}',
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

  Future address2Edit() async {
    try {
      if (lengthPfAddresses! > 1) {
        debugPrint('@address1Id =$address1Id');
        debugPrint('@address2Id =$address2Id');
        debugPrint('addresses2Edit will be activiated');

        debugPrint(
          'address2 map1 = ${{
            'region_id': '${selectedDestrict2?.id}',
            'city_id': '${selectedCity2?.id}',
            'governorate_id': '${selectedGovernorate2?.id}',
            'country_id': '${selectedCountry2?.id}',
            '_method': 'PUT'
          }}',
        );

        debugPrint(
          'address2 map2 = ${{
            'region_id': '${getRegion2Model?.id}',
            'city_id': '${getCity2Model?.id}',
            'governorate_id': '${getGov2Model?.id}',
            'country_id': '${getCountry2Model?.id}',
            '_method': 'PUT'
          }}',
        );

        debugPrint(
          'address2 map3 = ${{
            'region_id':
                '${selectedDestrict2?.id ?? getRegion2Model?.id ?? ''}',
            'city_id': '${selectedCity2?.id ?? getCity2Model?.id}',
            'governorate_id': '${selectedGovernorate2?.id ?? getGov2Model?.id}',
            'country_id': '${selectedCountry2?.id ?? getCountry2Model?.id}',
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
              'https://shs-iq.com/api/api/update_profile/address/$address2Id',
            ));
        request.fields.addAll({
          'region_id': '${selectedDestrict2?.id ?? getRegion2Model?.id ?? ''}',
          'city_id': '${selectedCity2?.id ?? getCity2Model?.id ?? ''}',
          'governorate_id':
              '${selectedGovernorate2?.id ?? getGov2Model?.id ?? ''}',
          'country_id': '${selectedCountry2?.id ?? getCountry2Model?.id ?? ''}',
          '_method': 'PUT'
        });
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          success6EditAddress2 = true;
          print(await response.stream.bytesToString());
        } else {
          success6EditAddress2 = false;
          print(response.reasonPhrase);
        }
      } else {
        success6EditAddress2 = true;
      }
      setState(() {});
    } on SocketException {
      success6EditAddress2 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success6EditAddress2 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success6EditAddress2 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  Future addAddress2() async {
    try {
      if (lengthPfAddresses == 1) {
        if (selectedDestrict2 != null ||
            selectedCity2 != null ||
            selectedGovernorate2 != null ||
            selectedCountry2 != null) {
          debugPrint(
            'addAddress2 map1 = ${{
              'region_id': '${selectedDestrict2?.id}',
              'city_id': '${selectedCity2?.id}',
              'governorate_id': '${selectedGovernorate2?.id}',
              'country_id': '${selectedCountry2?.id}',
            }}',
          );
          debugPrint(
            'addAddress2 map2 = ${{
              'region_id': '${selectedDestrict2?.id ?? ''}',
              'city_id': '${selectedCity2?.id ?? ''}',
              'governorate_id': '${selectedGovernorate2?.id ?? ''}',
              'country_id': '${selectedCountry2?.id ?? ''}',
            }}',
          );
          var headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer $savedToken'
          };
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(
              '$updateUurl/address',
            ),
          );
          request.fields.addAll({
            'region_id': '${selectedDestrict2?.id ?? ''}',
            'city_id': '${selectedCity2?.id ?? ''}',
            'governorate_id': '${selectedGovernorate2?.id ?? ''}',
            'country_id': '${selectedCountry2?.id ?? ''}',
          });
          request.headers.addAll(headers);
          http.StreamedResponse response = await request.send();
          if (response.statusCode == 200) {
            success7AddAddress2 = true;
            print(await response.stream.bytesToString());
          } else {
            success7AddAddress2 = false;
            print(response.reasonPhrase);
          }
        } else {
          success7AddAddress2 = true;
        }
      } else {
        success7AddAddress2 = true;
      }
      setState(() {});
    } on SocketException {
      success7AddAddress2 = false;
      text = 'يرجى الاتصال بالانترنت';
    } on FormatException {
      success7AddAddress2 = false;
      text = 'يرجى التأكد من البيانات';
    } catch (e) {
      success7AddAddress2 = false;
      text = 'حدث خطأ ما';
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchParentProfileVar = fetchParentProfile();
    super.initState();
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
                stringText: 'تعديل الحساب الشخصي',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          body: FutureBuilder(
              future: fetchParentProfileVar,
              builder:
                  (context, AsyncSnapshot<profile.ParentProfile> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
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

                              /// name ///
                              Row(
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
                                          stringText: 'الإسم الاول',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            SizeConfig().widthSize(context, 25),
                                        height: SizeConfig()
                                            .heightSize(context, 18),
                                        child: textWidget(
                                          stringText: 'إسم الأب',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            SizeConfig().widthSize(context, 25),
                                        height:
                                            SizeConfig().heightSize(context, 7),
                                        child: textWidget(
                                          stringText: 'إسم اللقب او الجد',
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
                                                .heightSize(context, 8),
                                            onChanged: (value) {
                                              firstArName = value!;
                                              setState(() {});
                                            },
                                            initialValue: firstArName ??
                                                snapshot.data?.firstName ??
                                                '',
                                            icons: Icons.person,
                                            obscureText: false,
                                            name: 'first_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'الإسم الاول بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: 'حقل مطلوب',
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
                                            icons: Icons.person,
                                            obscureText: false,
                                            onChanged: (value) {
                                              firstEnName = value!;
                                              setState(() {});
                                            },
                                            initialValue:
                                                snapshot.data?.enFirstName ??
                                                    firstEnName ??
                                                    '',
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
                                            height: SizeConfig()
                                                .heightSize(context, 8),
                                            icons: Icons.person,
                                            obscureText: false,
                                            onChanged: (value) {
                                              secondArName = value!;
                                              setState(() {});
                                            },
                                            initialValue:
                                                snapshot.data?.secondName ??
                                                    secondArName ??
                                                    '',
                                            name: 'second_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'إسم الأب بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: 'حقل مطلوب',
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
                                            icons: Icons.person,
                                            obscureText: false,
                                            labelText: 'إسم الأب بالإنكليزي',
                                            name: 'en_second_name',
                                            onChanged: (value) {
                                              secondEnName = value!;
                                              setState(() {});
                                            },
                                            initialValue:
                                                snapshot.data?.enSecondName ??
                                                    secondEnName ??
                                                    '',
                                            keyboardType: TextInputType.name,
                                            validator:
                                                (String? englishSecondName) {
                                              if (englishSecondName!
                                                  .isNotEmpty) {
                                                RegExp regExp = RegExp(
                                                    '^[a-zA-Z][a-zA-Z ]+\$');
                                                if (!regExp.hasMatch(
                                                    englishSecondName)) {
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
                                            height: SizeConfig()
                                                .heightSize(context, 8),
                                            icons: Icons.person,
                                            onChanged: (value) {
                                              thirdArName = value!;
                                              setState(() {});
                                            },
                                            initialValue:
                                                snapshot.data?.surName ??
                                                    thirdArName ??
                                                    '',
                                            obscureText: false,
                                            name: 'third_name',
                                            keyboardType: TextInputType.name,
                                            labelText: 'الجد او اللقب بالعربي',
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(
                                                context,
                                                errorText: 'حقل مطلوب',
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
                                            icons: Icons.person,
                                            obscureText: false,
                                            onChanged: (value) {
                                              thirdEnName = value!;
                                              setState(() {});
                                            },
                                            initialValue:
                                                snapshot.data?.enSurName ??
                                                    thirdEnName ??
                                                    '',
                                            name: 'en_third_name',
                                            keyboardType: TextInputType.name,
                                            labelText:
                                                'الجد او اللقب بالإنكليزي',
                                            validator:
                                                (String? englishSurName) {
                                              if (englishSurName!.isNotEmpty) {
                                                RegExp regExp = RegExp(
                                                    '^[a-zA-Z][a-zA-Z ]+\$');
                                                if (!regExp
                                                    .hasMatch(englishSurName)) {
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

                              /// gender and date ///
                              Container(
                                margin: EdgeInsets.only(
                                  right: SizeConfig().widthSize(context, 20),
                                  bottom: 20,
                                ),
                                child: FormBuilderRadioGroup<String?>(
                                  onChanged: (String? selected) {
                                    gender = selected;
                                    setState(() {});
                                  },
                                  initialValue: gender ??
                                      (snapshot.data?.sex == 'female'
                                          ? femmaleGender
                                          : maleGender),
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
                                  //
                                  // genderList.map(
                                  //   (String? selection) {
                                  //     String? var3;
                                  // if (gender != null) {
                                  //   if (gender == 'male') {
                                  //     gender = "ذكر";
                                  //   }
                                  //   if (gender == 'female') {
                                  //     gender = "انثى";
                                  //   }
                                  // }
                                  // var3 = selection;
                                  // selection = gender;
                                  //     return FormBuilderFieldOption(
                                  //       value: selection,
                                  //       child:
                                  //           textWidget(stringText: selection),
                                  //     );
                                  //   },
                                  // ).toList(),
                                  controlAffinity: ControlAffinity.trailing,
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              contentPadding:
                                                  EdgeInsets.all(20),
                                              content: Container(
                                                height: 250,
                                                width: 270,
                                                child: CupertinoDatePicker(
                                                  onDateTimeChanged:
                                                      (DateTime value) {
                                                    date = value;
                                                    setState(() {});
                                                  },
                                                  maximumYear:
                                                      DateTime.now().year - 18,
                                                  minimumYear:
                                                      DateTime.now().year - 120,
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
                                                  initialDateTime: DateTime(
                                                    (date?.year ??
                                                        (snapshot
                                                            .data
                                                            ?.dateOfBirth
                                                            ?.year)!),
                                                    (date?.month ??
                                                        (snapshot
                                                            .data
                                                            ?.dateOfBirth
                                                            ?.month)!),
                                                    (date?.day ??
                                                        (snapshot
                                                            .data
                                                            ?.dateOfBirth
                                                            ?.day)!),
                                                  ),
                                                  dateOrder:
                                                      DatePickerDateOrder.dmy,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
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
                                                            DateTime.now()
                                                                    .year -
                                                                18,
                                                        date?.month ??
                                                            DateTime.now()
                                                                    .month -
                                                                0,
                                                        date?.day ??
                                                            DateTime.now().day -
                                                                0,
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
                                            '${date?.year ?? snapshot.data?.dateOfBirth?.year}-${date?.month ?? snapshot.data?.dateOfBirth?.month}-${date?.day ?? snapshot.data?.dateOfBirth?.day}',
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
                                          width: SizeConfig()
                                              .widthSize(context, 25),
                                          height: SizeConfig()
                                              .heightSize(context, 10),
                                          child: textWidget(
                                            stringText: 'الجنسية الاولى',
                                            fontSize: 15,
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig()
                                              .widthSize(context, 25),
                                          height: SizeConfig()
                                              .heightSize(context, 2),
                                          child: textWidget(
                                            stringText: 'الجنسية الثانية',
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        DropDownFormField(
                                          onFind: (String? filter) =>
                                              getData(filter, nationalitiesUrl),
                                          onChanged: (GetDataModel? model) {
                                            selectedNationality1 = model;
                                            debugPrint(
                                              'selectedNationality1 = ${selectedNationality1?.id}',
                                            );
                                            setState(() {});
                                          },
                                          selectedItem: selectedNationality1 ??
                                              getNationalities1Model,
                                          validator:
                                              FormBuilderValidators.required(
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
                                              getNationalities1Model = null;
                                              Get.snackbar(
                                                '',
                                                '',
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                                titleText: Center(
                                                  child: textWidget(
                                                    stringText:
                                                        'يرجى ملى الحقول المطلوبة',
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                messageText: Container(),
                                                padding: EdgeInsets.all(15),
                                                snackStyle: SnackStyle.FLOATING,
                                                duration: Duration(seconds: 4),
                                                dismissDirection:
                                                    SnackDismissDirection
                                                        .VERTICAL,
                                                            // dismissDirection: DismissDirection.vertical,

                                                margin: EdgeInsets.all(15),
                                                borderRadius: 20,
                                              );
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        DropDownFormField(
                                          onFind: (String? filter) =>
                                              getData(filter, nationalitiesUrl),
                                          selectedItem: selectedNationality2 ??
                                              getNationalities2Model,
                                          onChanged: (GetDataModel? model) {
                                            selectedNationality2 = model;
                                            debugPrint(
                                              'selectedNationality2 = ${selectedNationality2?.id}',
                                            );

                                            setState(() {});
                                          },
                                          clearButton: IconButton(
                                            icon: Icon(
                                              Icons.clear,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              selectedNationality2 = null;
                                              getNationalities2Model = null;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// addresses ///
                              Address(
                                groupName: 'العنوان الاول',
                                stringText1: 'الدولة*',
                                onFindCountry: (String? filter) {
                                  return getData(filter, countriesUrl);
                                },
                                onChangedCountry: (GetDataModel? model) {
                                  selectedCountry1 = model;
                                  selectedGovernorate1 = null;
                                  selectedCity1 = null;
                                  selectedDestrict1 = null;
                                  getGov1Model = null;
                                  getCity1Model = null;
                                  getRegion1Model = null;
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
                                    getCountry1Model = null;
                                    getGov1Model = null;
                                    getCity1Model = null;
                                    getRegion1Model = null;
                                    Get.snackbar(
                                      '',
                                      '',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      titleText: Center(
                                        child: textWidget(
                                          stringText:
                                              'يرجى ملى الحقول المطلوبة',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      messageText: Container(),
                                      padding: EdgeInsets.all(15),
                                      snackStyle: SnackStyle.FLOATING,
                                      duration: Duration(seconds: 4),
                                      dismissDirection:
                                          SnackDismissDirection.VERTICAL,
                                                      // dismissDirection: DismissDirection.vertical,

                                      margin: EdgeInsets.all(15),
                                      borderRadius: 20,
                                    );
                                    setState(() {});
                                  },
                                ),
                                validatorCountry:
                                    FormBuilderValidators.required(
                                  context,
                                  errorText: dropdownErrorText,
                                ),
                                selectedItemCountry:
                                    selectedCountry1 ?? getCountry1Model,
                                stringText2: 'المحافظة',
                                onFindGovernorate: (String? filter) {
                                  return getData(
                                    filter,
                                    '$governoratesUrl/${selectedCountry1?.id ?? getCountry1Model?.id}',
                                  );
                                },
                                onChangedGovernorate: (GetDataModel? model) {
                                  selectedGovernorate1 = model;
                                  selectedCity1 = null;
                                  selectedDestrict1 = null;
                                  getCity1Model = null;
                                  getRegion1Model = null;
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
                                    getGov1Model = null;
                                    getCity1Model = null;
                                    getRegion1Model = null;
                                    Get.snackbar(
                                      '',
                                      '',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      titleText: Center(
                                        child: textWidget(
                                          stringText:
                                              'يرجى ملى الحقول المطلوبة',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      messageText: Container(),
                                      padding: EdgeInsets.all(15),
                                      snackStyle: SnackStyle.FLOATING,
                                      duration: Duration(seconds: 4),
                                      dismissDirection:
                                          SnackDismissDirection.VERTICAL,
                                                  // dismissDirection: DismissDirection.vertical,

                                      margin: EdgeInsets.all(15),
                                      borderRadius: 20,
                                    );
                                    setState(() {});
                                  },
                                ),
                                validatorGovernorate:
                                    FormBuilderValidators.required(
                                  context,
                                  errorText: dropdownErrorText,
                                ),
                                selectedItemGovernorate:
                                    selectedGovernorate1 ?? getGov1Model,
                                stringText3: 'المدينة',
                                onChangedCity: (GetDataModel? model) {
                                  selectedCity1 = model;
                                  selectedDestrict1 = null;
                                  getRegion1Model = null;
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
                                    getCity1Model = null;
                                    getRegion1Model = null;
                                    Get.snackbar(
                                      '',
                                      '',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      titleText: Center(
                                        child: textWidget(
                                          stringText:
                                              'يرجى ملى الحقول المطلوبة',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      messageText: Container(),
                                      padding: EdgeInsets.all(15),
                                      snackStyle: SnackStyle.FLOATING,
                                      duration: Duration(seconds: 4),
                                      dismissDirection:
                                          SnackDismissDirection.VERTICAL,
                                                  // dismissDirection: DismissDirection.vertical,

                                      margin: EdgeInsets.all(15),
                                      borderRadius: 20,
                                    );
                                    setState(() {});
                                  },
                                ),
                                onFindCity: (String? filter) {
                                  return getData(filter,
                                      '$citiesUrl/${selectedGovernorate1?.id ?? getGov1Model?.id}');
                                },
                                validatorCity: FormBuilderValidators.required(
                                  context,
                                  errorText: dropdownErrorText,
                                ),
                                selectedItemCity:
                                    selectedCity1 ?? getCity1Model,
                                stringText4: 'المنطقة',
                                onFindDestrict: (String? filter) {
                                  return getData(
                                    filter,
                                    '$destrictsUrl/${selectedCity1?.id ?? getCity1Model?.id}',
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
                                    getRegion1Model = null;
                                    setState(() {});
                                  },
                                ),
                                selectedItemDestrict:
                                    selectedDestrict1 ?? getRegion1Model,
                              ),
                              Address(
                                groupName: 'العنوان الثاني',
                                stringText1: 'الدولة',
                                onFindCountry: (String? filter) {
                                  return getData(filter, countriesUrl);
                                },
                                onChangedCountry: (GetDataModel? model) {
                                  selectedCountry2 = model;
                                  selectedGovernorate2 = null;
                                  selectedCity2 = null;
                                  selectedDestrict2 = null;
                                  getGov2Model = null;
                                  getCity2Model = null;
                                  getRegion2Model = null;
                                  setState(() {});
                                },
                                clearButtonCountry: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    selectedCountry2 = null;
                                    selectedGovernorate2 = null;
                                    selectedCity2 = null;
                                    selectedDestrict2 = null;
                                    getCountry2Model = null;
                                    getGov2Model = null;
                                    getCity2Model = null;
                                    getRegion2Model = null;
                                    setState(() {});
                                  },
                                ),
                                selectedItemCountry:
                                    selectedCountry2 ?? getCountry2Model,
                                stringText2: 'المحافظة',
                                onFindGovernorate: (String? filter) {
                                  return getData(filter,
                                      '$governoratesUrl/${selectedCountry2?.id ?? getCountry2Model?.id}');
                                },
                                onChangedGovernorate: (GetDataModel? model) {
                                  selectedGovernorate2 = model;
                                  selectedCity2 = null;
                                  selectedDestrict2 = null;
                                  getCity2Model = null;
                                  getRegion2Model = null;

                                  setState(() {});
                                },
                                clearButtonGovernorate: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    selectedGovernorate2 = null;
                                    selectedCity2 = null;
                                    selectedDestrict2 = null;
                                    getGov2Model = null;
                                    getCity2Model = null;
                                    getRegion2Model = null;
                                    setState(() {});
                                  },
                                ),
                                selectedItemGovernorate:
                                    selectedGovernorate2 ?? getGov2Model,
                                stringText3: 'المدينة',
                                onChangedCity: (GetDataModel? model) {
                                  selectedCity2 = model;
                                  selectedDestrict2 = null;
                                  getRegion2Model = null;
                                  setState(() {});
                                },
                                clearButtonCity: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    selectedCity2 = null;
                                    selectedDestrict2 = null;
                                    getCity2Model = null;
                                    getRegion2Model = null;
                                    setState(() {});
                                  },
                                ),
                                onFindCity: (String? filter) {
                                  return getData(filter,
                                      '$citiesUrl/${selectedGovernorate2?.id ?? getGov2Model?.id}');
                                },
                                selectedItemCity:
                                    selectedCity2 ?? getCity2Model,
                                stringText4: 'المنطقة',
                                onFindDestrict: (String? filter) {
                                  return getData(
                                    filter,
                                    '$destrictsUrl/${selectedCity2?.id ?? getCity2Model?.id}',
                                  );
                                },
                                onChangedDestrict: (GetDataModel? model) {
                                  selectedDestrict2 = model;
                                  setState(() {});
                                },
                                clearButtonDestrict: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    selectedDestrict2 = null;
                                    getRegion2Model = null;
                                    setState(() {});
                                  },
                                ),
                                selectedItemDestrict:
                                    selectedDestrict2 ?? getRegion2Model,
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
                                          width: SizeConfig()
                                              .widthSize(context, 25),
                                          height: SizeConfig()
                                              .heightSize(context, 10),
                                          child: textWidget(
                                            stringText: 'الأمراض المزمنة',
                                            fontSize: 15,
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig()
                                              .widthSize(context, 25),
                                          height: SizeConfig()
                                              .heightSize(context, 2),
                                          child: textWidget(
                                            stringText: 'علامات فارقة',
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        MultiSelectDropDownFormField(
                                          onChange: (model) {
                                            // multiSelectedChronicDiseasesModel =
                                            //     model;
                                            // debugPrint(
                                            //   '@@@@@@@@multiSelectedChronicDiseasesModel = $multiSelectedChronicDiseasesModel',
                                            // );
                                            // debugPrint(
                                            //   '@@@@@@@@model = $model',
                                            // );
                                            // if (multiSelectedChronicDiseasesModel
                                            //         .length !=
                                            //     0) {
                                            //   multiSelectedChronicDiseasesModel
                                            //       .forEach((element) {
                                            //     multiSelectedChronicDiseasesId
                                            //         .add(element.id);
                                            //   });
                                            //   debugPrint(
                                            //     '1111@@@@@@@@@@multiSelectedChronicDiseasesId = $multiSelectedChronicDiseasesId',
                                            //   );
                                            // } else {
                                            //   multiSelectedChronicDiseasesId =
                                            //       [];
                                            //   debugPrint(
                                            //     '22222@@@@@@@@@@multiSelectedChronicDiseasesId = $multiSelectedChronicDiseasesId',
                                            //   );
                                            // }

                                            for (var i in model) {
                                              multiSelectedChronicDiseasesId
                                                  ?.add(i.id);
                                              multiSelectedChronicDiseasesModel
                                                  ?.add(i);
                                            }
                                            setState(() {});
                                          },
                                          selectedItems:
                                              (multiSelectedChronicDiseasesModel
                                                          ?.length ==
                                                      0)
                                                  ? getChronicDiseasesModel
                                                  : multiSelectedChronicDiseasesModel,
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
                                              multiSelectedHandicapsId
                                                  ?.add(i.id);
                                              multiSelectedHandicapsModel
                                                  ?.add(i);
                                            }
                                            setState(() {});
                                          },
                                          selectedItems:
                                              (multiSelectedHandicapsModel
                                                          ?.length ==
                                                      0)
                                                  ? getHandicapsModel
                                                  : multiSelectedHandicapsModel,
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
                                      icon:
                                          Icon(Icons.save, color: Colors.white),
                                      color: generalColor,
                                    ),
                                    ButtonState.loading: IconedButton(
                                      text: "إنتظار",
                                      color: generalColor,
                                    ),
                                    ButtonState.fail: IconedButton(
                                      text: "فشل",
                                      icon: Icon(Icons.cancel,
                                          color: Colors.white),
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
                                    if (formKey.currentState!
                                        .saveAndValidate()) {
                                      stateTextWithIcon = ButtonState.loading;
                                      setState(() {});
                                      Future.wait([
                                        infoEdit(),
                                        nationalitiesEdit(),
                                        chronicDiseasesEdit(),
                                        handicapsEdit(),
                                        address1Edit(),
                                        addAddress2(),
                                        address2Edit(),
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
                                            'success6EditAddress2 = $success6EditAddress2',
                                          );
                                          debugPrint(
                                            'success7AddAddress2 = $success7AddAddress2',
                                          );

                                          switch (stateTextWithIcon) {
                                            case ButtonState.idle:
                                              break;
                                            case ButtonState.loading:
                                              if (success1 == true &&
                                                  success2 == true &&
                                                  success3 == true &&
                                                  success4 == true &&
                                                  success5EditAddress1 ==
                                                      true &&
                                                  success6EditAddress2 ==
                                                      true &&
                                                  success7AddAddress2 == true) {
                                                fetchParentProfile();
                                                stateTextWithIcon =
                                                    ButtonState.success;
                                                Get.back();
                                                Get.offAndToNamed(
                                                  Routes.PROFILE,
                                                );
                                              } else {
                                                stateTextWithIcon =
                                                    ButtonState.fail;
                                              }
                                              setState(() {});
                                              break;
                                            case ButtonState.success:
                                              stateTextWithIcon =
                                                  ButtonState.idle;
                                              setState(() {});

                                              break;
                                            case ButtonState.fail:
                                              stateTextWithIcon =
                                                  ButtonState.idle;
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
                                            stringText:
                                                'يرجى ملى الحقول المطلوبة',
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
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
