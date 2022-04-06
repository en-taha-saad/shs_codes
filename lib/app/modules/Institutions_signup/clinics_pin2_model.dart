import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/modules/Institutions_signup/models/saved_data_in_mobile_model.dart';

class ClinicsPin2 {
  Clinics? clinics;
  ExtraData? extraData;

  ClinicsPin2({this.clinics, this.extraData});

  ClinicsPin2.fromJson(Map<String, dynamic> json) {
    clinics = json['clinics'] != null ? Clinics?.fromJson(json['clinics']) : null;
    extraData =
        json['extraData'] != null ? ExtraData?.fromJson(json['extraData']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (clinics != null) {
      data['clinics'] = clinics?.toJson();
    }
    if (extraData != null) {
      data['extraData'] = extraData?.toJson();
    }
    return data;
  }
}

class ExtraData {
  GetDataModel? categoryItemsMap;
  List<GetDataModel>? selectedMedicalSpecialist;
  List<GetDataModel>? selectedDays;
  List<GetDataModel>? selectedExceptionDays;
  GetDataModel? selectedCity;
  GetDataModel? selectedDistrict;
  GetDataModel? selectedRegion;
  GetDataModel? selectedEReservation;
  GetDataModel? selectedPhoneReservation;
  GetDataModel? selectedOnPresenceReservation;
  List<GetDataModel>? currencyMap;
  Map<String,List<GetDataModel>>? selectedStaffServices;
  List<String>? listOfOwnerNames;
  List<String>? staffNames;
  String? imageAvatar;
  List<int>? isNotDoctor;

  ExtraData(
      {this.categoryItemsMap,
      this.selectedMedicalSpecialist,
      this.selectedDays,
      this.selectedExceptionDays,
      this.selectedCity,
      this.selectedDistrict,
      this.selectedRegion,
      this.selectedEReservation,
      this.selectedPhoneReservation,
      this.selectedOnPresenceReservation,
      this.currencyMap,
      this.selectedStaffServices,
      this.listOfOwnerNames,
      this.staffNames,
      this.isNotDoctor,
      this.imageAvatar});

  ExtraData.fromJson(Map<String, dynamic> json) {
    categoryItemsMap = json['categoryItemsMap'] != null
        ? GetDataModel?.fromJson(json['categoryItemsMap'])
        : null;
    if (json['selectedMedicalSpecialist'] != null) {
      selectedMedicalSpecialist = <GetDataModel>[];
      json['selectedMedicalSpecialist'].forEach((v) {
        selectedMedicalSpecialist?.add(GetDataModel.fromJson(v));
      });
    }
    if (json['selectedDays'] != null) {
      selectedDays = <GetDataModel>[];
      json['selectedDays'].forEach((v) {
        selectedDays?.add(GetDataModel.fromJson(v));
      });
    }
    if (json['selectedExceptionDays'] != null) {
      selectedExceptionDays = <GetDataModel>[];
      json['selectedExceptionDays'].forEach((v) {
        selectedExceptionDays?.add(GetDataModel.fromJson(v));
      });
    }
    selectedCity = json['selectedCity'] != null
        ? GetDataModel?.fromJson(json['selectedCity'])
        : null;
    selectedDistrict = json['selectedDistrict'] != null
        ? GetDataModel?.fromJson(json['selectedDistrict'])
        : null;
    selectedRegion = json['selectedRegion'] != null
        ? GetDataModel?.fromJson(json['selectedRegion'])
        : null;
    selectedEReservation = json['selectedEReservation'] != null
        ? GetDataModel?.fromJson(json['selectedEReservation'])
        : null;
    selectedPhoneReservation = json['selectedPhoneReservation'] != null
        ? GetDataModel?.fromJson(json['selectedPhoneReservation'])
        : null;
    selectedOnPresenceReservation =
        json['selectedOnPresenceReservation'] != null
            ? GetDataModel?.fromJson(json['selectedOnPresenceReservation'])
            : null;
    if (json['currencyMap'] != null) {
      currencyMap = <GetDataModel>[];
      json['currencyMap'].forEach((v) {
        currencyMap?.add(GetDataModel.fromJson(v));
      });
    }
    if (json['selectedStaffServices'] != null) {
      selectedStaffServices = <String,List<GetDataModel>>{};
      json['selectedStaffServices'].forEach((k,v) {
        print("v = type===${v.runtimeType}");
        // selectedStaffServices?.add(GetDataModel.fromJsonList(v));
        selectedStaffServices?.addAll({k:GetDataModel.fromJsonList(v)});
      });
    }
    listOfOwnerNames = json['listOfOwnerNames'].cast<String>();
    staffNames = json['staffNames'].cast<String>();
    if (json['isNotDoctor'] != null) {
      isNotDoctor = json['isNotDoctor'].cast<int>();
    }
    imageAvatar = json['imageAvatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (categoryItemsMap != null) {
      data['categoryItemsMap'] = categoryItemsMap?.toJson();
    }
    if (selectedMedicalSpecialist != null) {
      data['selectedMedicalSpecialist'] = selectedMedicalSpecialist?.map((v) => v.toJson()).toList();
    }
    if (selectedDays != null) {
      data['selectedDays'] = selectedDays?.map((v) => v.toJson()).toList();
    }
    if (selectedExceptionDays != null) {
      data['selectedExceptionDays'] =
          selectedExceptionDays?.map((v) => v.toJson()).toList();
    }
    if (selectedCity != null) {
      data['selectedCity'] = selectedCity?.toJson();
    }
    if (selectedDistrict != null) {
      data['selectedDistrict'] = selectedDistrict?.toJson();
    }
    if (selectedRegion != null) {
      data['selectedRegion'] = selectedRegion?.toJson();
    }
    if (selectedEReservation != null) {
      data['selectedEReservation'] = selectedEReservation?.toJson();
    }
    if (selectedPhoneReservation != null) {
      data['selectedPhoneReservation'] = selectedPhoneReservation?.toJson();
    }
    if (selectedOnPresenceReservation != null) {
      data['selectedOnPresenceReservation'] =
          selectedOnPresenceReservation?.toJson();
    }
    if (currencyMap != null) {
      data['currencyMap'] = currencyMap?.map((v) => v.toJson()).toList();
    }
    if (selectedStaffServices != null) {
      Map<String,List<Map<String, dynamic>>> map ={};
      selectedStaffServices?.forEach((key, value) {
        map[key] = [];
        value.forEach((element) {
          map[key]?.add(element.toJson()!);
        });
      });
      data['selectedStaffServices'] =map;
      print("pin*****${map.toString()}");
    }
    data['listOfOwnerNames'] = listOfOwnerNames;
    data['staffNames'] = staffNames;
    if(isNotDoctor!=null) {
      data['isNotDoctor'] = isNotDoctor!.cast<int>();
    }
    if(imageAvatar!=null){
      data['imageAvatar'] = imageAvatar;
    }
    return data;
  }
}
