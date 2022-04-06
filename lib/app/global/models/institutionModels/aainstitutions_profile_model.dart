import 'address.dart';
import 'available_schedules.dart';
import 'institution_treatments.dart';
import 'issuer.dart';
import 'medical_specialties.dart';
import 'owners.dart';
import 'phones.dart';
import 'profile_image.dart';
import 'reservation_setting.dart';
import 'service_fees.dart';
import 'setting.dart';
import 'staffs.dart';

class InstitutionsProfile {
  InstitutionsProfile({
    required this.id,
    required this.medicalCategory,
    required this.name,
    required this.registrationNo,
    required this.issuerId,
    required this.medicalSpecialties,
    required this.institutionTreatments,
    required this.owners,
    required this.phones,
    required this.address,
    required this.availableSchedules,
    required this.staffs,
    required this.reservationSetting,
    required this.serviceFees,
    required this.setting,
    required this.issuer,
    required this.otherImages,
    required this.profileImage,
  });
  int? id;
  String? medicalCategory;
  String? name;
  String? registrationNo;
  int? issuerId;
  List<MedicalSpecialties>? medicalSpecialties;
  List<InstitutionTreatments>? institutionTreatments;
  List<Owners>? owners;
  List<InstitutionPhones>? phones;
  Address? address;
  List<InstitutionAvailableSchedules>? availableSchedules;
  List<Staffs>? staffs;
  ReservationSetting? reservationSetting;
  List<ServiceFees>? serviceFees;
  Setting? setting;
  Issuer? issuer;
  List<dynamic>? otherImages;
  List<ProfileImage>? profileImage;

  InstitutionsProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalCategory = json['medical_category'];
    name = json['name'];
    registrationNo = json['registration_no'];
    issuerId = json['issuer_id'];
    medicalSpecialties = List.from(json['medical_specialties'])
        .map((e) => MedicalSpecialties.fromJson(e))
        .toList();
    institutionTreatments = List.from(json['institution_treatments'])
        .map((e) => InstitutionTreatments.fromJson(e))
        .toList();
    owners = List.from(json['owners']).map((e) => Owners.fromJson(e)).toList();
    phones = List.from(json['phones'])
        .map((e) => InstitutionPhones.fromJson(e))
        .toList();
    address = Address.fromJson(json['address']);
    reservationSetting =
        ReservationSetting.fromJson(json['reservation_setting']);
    serviceFees = List.from(json['service_fees'])
        .map((e) => ServiceFees.fromJson(e))
        .toList();
    setting = Setting.fromJson(json['setting']);
    otherImages = List.castFrom<dynamic, dynamic>(json['other_images']);
    profileImage = List.from(json['profile_image'])
        .map((e) => ProfileImage.fromJson(e))
        .toList();
    issuer = Issuer.fromJson(json['issuer']);
    staffs = List.from(json['staffs']).map((e) => Staffs.fromJson(e)).toList();
    availableSchedules = List.from(json['available_schedules'])
        .map((e) => InstitutionAvailableSchedules.fromJson(e))
        .toList();
  }

  /// toJson
  /*
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['medical_category'] = medicalCategory;
    _data['name'] = name;
    _data['registration_no'] = registrationNo;
    _data['issuer_id'] = issuerId;
    _data['medical_specialties'] =
        medicalSpecialties.map((e) => e.toJson()).toList();
    _data['institution_treatments'] =
        institutionTreatments.map((e) => e.toJson()).toList();
    _data['owners'] = owners.map((e) => e.toJson()).toList();
    _data['phones'] = phones.map((e) => e.toJson()).toList();
    _data['address'] = address.toJson();
    _data['available_schedules'] =
        availableSchedules.map((e) => e.toJson()).toList();
    _data['staffs'] = staffs.map((e) => e.toJson()).toList();
    _data['reservation_setting'] = reservationSetting.toJson();
    _data['service_fees'] = serviceFees.map((e) => e.toJson()).toList();
    _data['setting'] = setting.toJson();
    _data['issuer'] = issuer.toJson();
    _data['other_images'] = otherImages;
    _data['profile_image'] = profileImage.map((e) => e.toJson()).toList();
    return _data;
  }
*/
}
