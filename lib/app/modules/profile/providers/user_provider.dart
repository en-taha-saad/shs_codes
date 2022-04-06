// ignore_for_file: prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/modules/doctor_dashboard/controllers/doctor_dashboard_controller.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/personal_account_sign_up_view.dart';
import 'package:shs108private/main.dart';

import '../user_model.dart';



int? getParentId;
int? lengthPfAddresses;
String? getSurName;
String? getEnFirstName;
String? getEnSecondName;
String? getEnSurName;
String? getSex;
String? getOriginalSex;
String? selectedGender;
DateTime? getDateOfBirth;
String? getHandicaps;
String? getChronicDiseases;
String? getNationalities1;
GetDataModel? getNationalities1Model;
GetDataModel? getNationalities2Model;
int? address1Id;
GetDataModel? getCountry1Model;
GetDataModel? getGov1Model;
GetDataModel? getCity1Model;
GetDataModel? getRegion1Model;
int? address2Id;
GetDataModel? getCountry2Model;
GetDataModel? getGov2Model;
GetDataModel? getCity2Model;
GetDataModel? getRegion2Model;

List<GetDataModel>? getChronicDiseasesModel;
List<GetDataModel>? getHandicapsModel;
String? getNationalities2;
String? getPhone1;
String? getPhone2;
String? getEmail1;
String? getEmail2;
String? getCountry1;
String? getGov1;
String? getCity1;
String? getDestrict1;
String? getCountry2;
String? getGov2;
String? getCity2;
String? getDestrict2;
String? getBarcodeString;
String? getChildImage;
int? familyMembers;

// ignore: prefer_typing_uninitialized_variables
Future<ParentProfile> fetchParentProfile() async {
  var headers = {
    // 'Authorization': 'Bearer 112|AFY5SIOfhYGdhwUvSRkGWARs1pJR0q1xJcxkTIH3',
    'Authorization': 'Bearer $savedToken',
    'Accept': 'application/json'
  };

  var request = http.Request(
    'GET',
    Uri.parse('$url/profile'),
  );

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    List data = jsonDecode(await response.stream.bytesToString());
    debugPrint('data = $data');
    var dataMap = ParentProfile.fromJson(data[0]);
    debugPrint('dataMap.image = ${dataMap.image}');
    if (dataMap.image != null) {
      if (dataMap.image!.imageUrl != null) {
        getImage = dataMap.image!.imageUrl;
      }
    }
    personalIdDrawer = dataMap.personalId!;
    getParentId = dataMap.id;
    getFirstName = dataMap.firstName;
    getSecondName = dataMap.secondName;
    getSurName = dataMap.surName;
    getEnFirstName = dataMap.enFirstName;
    getEnSecondName = dataMap.enSecondName;
    getEnSurName = dataMap.enSurName;
    getOriginalSex = dataMap.sex;
    if (dataMap.sex == 'male') {
      getSex = 'ذكر';
    } else if (dataMap.sex == 'female') {
      getSex = 'انثى';
    } else {
      getSex = '';
    }

    getDateOfBirth = dataMap.dateOfBirth;
    if (dataMap.handicaps!.length >= 1) {
      getHandicaps = dataMap.handicaps!.map((v) => v.name).toList().join("\n");
    }
    if (dataMap.chronicDiseases!.length >= 1) {
      getChronicDiseases =
          dataMap.chronicDiseases!.map((v) => v.name).toList().join("\n");
    }
    getNationalities1 = dataMap.nationalities![0].name;
    getNationalities1Model = GetDataModel(
      name: (dataMap.nationalities?[0].name)!,
      id: dataMap.nationalities?[0].id,
    );
    if (dataMap.nationalities!.length > 1) {
      getNationalities2Model = GetDataModel(
        name: (dataMap.nationalities?[1].name)!,
        id: dataMap.nationalities?[1].id,
      );
      getNationalities2 = dataMap.nationalities![1].name;
    }
    if (dataMap.chronicDiseases?.length != 0) {
      getChronicDiseasesModel = dataMap.chronicDiseases?.map((e) {
        return GetDataModel(
          name: e.name!,
          id: e.id,
        );
      }).toList();
    }
    if (dataMap.handicaps?.length != 0) {
      getHandicapsModel = dataMap.handicaps?.map((e) {
        return GetDataModel(
          name: e.name!,
          id: e.id,
        );
      }).toList();
    }

    getPhone1 = dataMap.user!.phones![0].phone;
    if (dataMap.user!.phones!.length > 1) {
      getPhone2 = dataMap.user!.phones![1].phone;
    }

    if (dataMap.user!.emails!.length != 0) {
      getEmail1 = dataMap.user!.emails![0].email;
      if (dataMap.user!.emails!.length > 1) {
        getEmail2 = dataMap.user!.emails![1].email;
      }
    }

    address1Id = dataMap.addresses![0].id;
    lengthPfAddresses = dataMap.addresses!.length;
    getCountry1Model = GetDataModel(
      name: (dataMap.addresses![0].country?.name)!,
      id: (dataMap.addresses![0].country?.id)!,
    );

    getGov1Model = GetDataModel(
      name: (dataMap.addresses![0].governorate?.name)!,
      id: (dataMap.addresses![0].governorate?.id)!,
    );
    getCity1Model = GetDataModel(
      name: (dataMap.addresses![0].city?.name)!,
      id: (dataMap.addresses![0].city?.id)!,
    );

    if (dataMap.addresses![0].region != null) {
      getRegion1Model = GetDataModel(
        name: (dataMap.addresses![0].region?.name)!,
        id: (dataMap.addresses![0].region?.id)!,
      );
    }

    if (dataMap.addresses!.length > 1) {
      address2Id = dataMap.addresses![1].id;
      if (dataMap.addresses![1].country != null) {
        getCountry2Model = GetDataModel(
          name: (dataMap.addresses![1].country?.name)!,
          id: (dataMap.addresses![1].country?.id)!,
        );
      }

      if (dataMap.addresses![1].governorate != null) {
        getGov2Model = GetDataModel(
          name: (dataMap.addresses![1].governorate?.name)!,
          id: (dataMap.addresses![1].governorate?.id)!,
        );
      }

      if (dataMap.addresses![1].city != null) {
        getCity2Model = GetDataModel(
          name: (dataMap.addresses![1].city?.name)!,
          id: (dataMap.addresses![1].city?.id)!,
        );
      }

      if (dataMap.addresses![1].region != null) {
        getRegion2Model = GetDataModel(
          name: (dataMap.addresses![1].region?.name)!,
          id: (dataMap.addresses![1].region?.id)!,
        );
      }
    }

    if (dataMap.addresses?.length != 0) {
      getCountry1 = dataMap.addresses![0].country!.name;
      getGov1 = dataMap.addresses![0].governorate!.name;
      getCity1 = dataMap.addresses![0].city!.name;
      if (dataMap.addresses![0].region != null) {
        getDestrict1 = dataMap.addresses![0].region!.name;
      }
    }

    if (dataMap.addresses!.length > 1) {
      if (dataMap.addresses![1].country != null) {
        getCountry2 = dataMap.addresses![1].country!.name;
      }
      if (dataMap.addresses![1].governorate != null) {
        getGov2 = dataMap.addresses![1].governorate!.name;
      }
      if (dataMap.addresses![1].city != null) {
        getCity2 = dataMap.addresses![1].city!.name;
      }
      if (dataMap.addresses![1].region != null) {
        getDestrict1 = dataMap.addresses![1].region!.name;
      }
    }
    return dataMap;
  } else {
    var data = jsonDecode(await response.stream.bytesToString());
    return data;
  }
}

Future<BarCode> getBarcode() async {
  var headers = {
    'Authorization': 'Bearer $savedToken',
    'Accept': 'application/json'
  };
  var request = http.Request(
    'GET',
    Uri.parse('$url/qrcode'),
  );
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print('response.statusCode = ${response.statusCode}');
    var data = jsonDecode(await response.stream.bytesToString());
    debugPrint('barcode data = $data');
    var dataMap = BarCode.fromJson(data);
    getBarcodeString = dataMap.data;
    return dataMap;
  } else {
    var data = jsonDecode(await response.stream.bytesToString());
    print('data = $data');
    throw 'data not fetched';
  }
}

Future<List<ChildProfileRelateds>?> fetchChildProfile() async {
  var headers = {
    'Authorization': 'Bearer $savedToken',
    'Accept': 'application/json'
  };
  var request = http.Request(
    'GET',
    Uri.parse('$url/patient_family'),
  );
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  if (savedToken != null) {
    if (response.statusCode == 200) {
      debugPrint('@0');
      List data = jsonDecode(await response.stream.bytesToString());
      debugPrint('@1');
      debugPrint('@@@data = $data');

      debugPrint('@2');
      var dataMap = ChildProfile.fromJson(data[0]);

      debugPrint('@2');
      debugPrint('dataMap.relateds!.length = ${dataMap.relateds?.length}');
      debugPrint('dataMap = ${dataMap.toJson()}');

      familyMembers = dataMap.relateds!.length;
      debugPrint('@3');

      debugPrint('familyMembers = $familyMembers');
      return dataMap.relateds;
    } else {
      var data = jsonDecode(await response.stream.bytesToString());
      debugPrint('data = $data');
    }
  } else {
    throw 'token not found';
  }
}
