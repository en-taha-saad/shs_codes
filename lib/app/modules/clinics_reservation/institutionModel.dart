// import 'package:shs108private/app/modules/doctor_profile/doctor_model.dart';
//
// class Institutions {
//   int? id;
//   String? medicalCategory;
//   String? name;
//   String? registrationNo;
//   int? issuerId;
//   List<MedicalSpecialties>? medicalSpecialties;
//   List<InstitutionTreatments>? institutionTreatments;
//   List<Owners>? owners;
//   List<Phones>? phones;
//   Address? address;
//   List<AvailableSchedules>? availableSchedules;
//   List<Staffs>? staffs;
//   ReservationSetting? reservationSetting;
//   List<ServiceFees>? serviceFees;
//   Setting? setting;
//   Issuer? issuer;
//   List<OtherImages>? otherImages;
//   List<ProfileImage>? profileImage;
//
//   Institutions(
//       {this.id,
//         this.medicalCategory,
//         this.name,
//         this.registrationNo,
//         this.issuerId,
//         this.medicalSpecialties,
//         this.institutionTreatments,
//         this.owners,
//         this.phones,
//         this.address,
//         this.availableSchedules,
//         this.staffs,
//         this.reservationSetting,
//         this.serviceFees,
//         this.setting,
//         this.issuer,
//         this.otherImages,
//         this.profileImage});
//
//   Institutions.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     medicalCategory = json['medical_category'];
//     name = json['name'];
//     registrationNo = json['registration_no'];
//     issuerId = json['issuer_id'];
//     if (json['medical_specialties'] != null) {
//       medicalSpecialties = <MedicalSpecialties>[];
//       json['medical_specialties'].forEach((v) {
//         medicalSpecialties!.add(MedicalSpecialties.fromJson(v));
//       });
//     }
//     if (json['institution_treatments'] != null) {
//       institutionTreatments = <InstitutionTreatments>[];
//       json['institution_treatments'].forEach((v) {
//         institutionTreatments!.add(InstitutionTreatments.fromJson(v));
//       });
//     }
//     if (json['owners'] != null) {
//       owners = <Owners>[];
//       json['owners'].forEach((v) {
//         owners!.add(Owners.fromJson(v));
//       });
//     }
//     if (json['phones'] != null) {
//       phones = <Phones>[];
//       json['phones'].forEach((v) {
//         phones!.add(Phones.fromJson(v));
//       });
//     }
//     address = json['address'] != null ? Address?.fromJson(json['address']) : null;
//     if (json['available_schedules'] != null) {
//       availableSchedules = <AvailableSchedules>[];
//       json['available_schedules'].forEach((v) {
//         availableSchedules!.add(AvailableSchedules.fromJson(v));
//       });
//     }
//     if (json['staffs'] != null) {
//       staffs = <Staffs>[];
//       json['staffs'].forEach((v) {
//         staffs!.add(Staffs.fromJson(v));
//       });
//     }
//     reservationSetting = json['reservation_setting'] != null
//         ? ReservationSetting?.fromJson(json['reservation_setting'])
//         : null;
//     if (json['service_fees'] != null) {
//       serviceFees = <ServiceFees>[];
//       json['service_fees'].forEach((v) {
//         serviceFees!.add(ServiceFees.fromJson(v));
//       });
//     }
//     setting = json['setting'] != null ? Setting?.fromJson(json['setting']) : null;
//     issuer = json['issuer'] != null ? Issuer?.fromJson(json['issuer']) : null;
//     if (json['other_images'] != null) {
//       otherImages = <OtherImages>[];
//       json['other_images'].forEach((v) {
//         otherImages!.add(OtherImages.fromJson(v));
//       });
//     }
//     if (json['profile_image'] != null) {
//       profileImage = <ProfileImage>[];
//       json['profile_image'].forEach((v) {
//         profileImage!.add(ProfileImage.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['medical_category'] = medicalCategory;
//     data['name'] = name;
//     data['registration_no'] = registrationNo;
//     data['issuer_id'] = issuerId;
//     if (medicalSpecialties != null) {
//       data['medical_specialties'] =
//           medicalSpecialties!.map((v) => v.toJson()).toList();
//     }
//     if (institutionTreatments != null) {
//       data['institution_treatments'] =
//           institutionTreatments!.map((v) => v.toJson()).toList();
//     }
//     if (owners != null) {
//       data['owners'] = owners!.map((v) => v.toJson()).toList();
//     }
//     if (phones != null) {
//       data['phones'] = phones!.map((v) => v.toJson()).toList();
//     }
//     if (address != null) {
//       data['address'] = address!.toJson();
//     }
//     if (availableSchedules != null) {
//       data['available_schedules'] =
//           availableSchedules!.map((v) => v.toJson()).toList();
//     }
//     if (staffs != null) {
//       data['staffs'] = staffs!.map((v) => v.toJson()).toList();
//     }
//     if (reservationSetting != null) {
//       data['reservation_setting'] = reservationSetting!.toJson();
//     }
//     if (serviceFees != null) {
//       data['service_fees'] = serviceFees!.map((v) => v.toJson()).toList();
//     }
//     if (setting != null) {
//       data['setting'] = setting!.toJson();
//     }
//     if (issuer != null) {
//       data['issuer'] = issuer!.toJson();
//     }
//     if (otherImages != null) {
//       data['other_images'] = otherImages!.map((v) => v.toJson()).toList();
//     }
//     if (profileImage != null) {
//       data['profile_image'] = profileImage!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MedicalSpecialties {
//   int? id;
//   String? name;
//   String? shsCode;
//   String? enName;
//   ExtraInfo? extraInfo;
//
//   MedicalSpecialties(
//       {this.id, this.name, this.shsCode, this.enName, this.extraInfo});
//
//   MedicalSpecialties.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     shsCode = json['shs_code'];
//     enName = json['en_name'];
//     extraInfo =
//     json['extra_info'] != null ? ExtraInfo?.fromJson(json['extra_info']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['shs_code'] = shsCode;
//     data['en_name'] = enName;
//     if (extraInfo != null) {
//       data['extra_info'] = extraInfo!.toJson();
//     }
//     return data;
//   }
// }
//
// class ExtraInfo {
//   int? institutionId;
//   int? medicalSpecialtyId;
//   String? other;
//
//   ExtraInfo({this.institutionId, this.medicalSpecialtyId, this.other});
//
//   ExtraInfo.fromJson(Map<String, dynamic> json) {
//     institutionId = json['institution_id'];
//     medicalSpecialtyId = json['medical_specialty_id'];
//     other = json['other'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['institution_id'] = institutionId;
//     data['medical_specialty_id'] = medicalSpecialtyId;
//     data['other'] = other;
//     return data;
//   }
// }
//
// class InstitutionTreatments {
//   int? id;
//   String? name;
//   int? institutionId;
//   String? createdAt;
//   String? updatedAt;
//
//   InstitutionTreatments(
//       {this.id, this.name, this.institutionId, this.createdAt, this.updatedAt});
//
//   InstitutionTreatments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     institutionId = json['institution_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['institution_id'] = institutionId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Owners {
//   int? id;
//   String? firstName;
//   String? secondName;
//   String? sureName;
//   String? enFirstName;
//   String? enSecondName;
//   String? enSureName;
//   String? personalId;
//   String? dateOfBirth;
//   String? sex;
//   int? independent;
//   int? patientableId;
//   String? patientableType;
//   int? active;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;
//
//   Owners(
//       {this.id,
//         this.firstName,
//         this.secondName,
//         this.sureName,
//         this.enFirstName,
//         this.enSecondName,
//         this.enSureName,
//         this.personalId,
//         this.dateOfBirth,
//         this.sex,
//         this.independent,
//         this.patientableId,
//         this.patientableType,
//         this.active,
//         this.createdAt,
//         this.updatedAt,
//         this.pivot});
//
//   Owners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     secondName = json['second_name'];
//     sureName = json['sure_name'];
//     enFirstName = json['en_first_name'];
//     enSecondName = json['en_second_name'];
//     enSureName = json['en_sure_name'];
//     personalId = json['personal_id'];
//     dateOfBirth = json['date_of_birth'];
//     sex = json['sex'];
//     independent = json['independent'];
//     patientableId = json['patientable_id'];
//     patientableType = json['patientable_type'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? Pivot?.fromJson(json['pivot']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['first_name'] = firstName;
//     data['second_name'] = secondName;
//     data['sure_name'] = sureName;
//     data['en_first_name'] = enFirstName;
//     data['en_second_name'] = enSecondName;
//     data['en_sure_name'] = enSureName;
//     data['personal_id'] = personalId;
//     data['date_of_birth'] = dateOfBirth;
//     data['sex'] = sex;
//     data['independent'] = independent;
//     data['patientable_id'] = patientableId;
//     data['patientable_type'] = patientableType;
//     data['active'] = active;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (pivot != null) {
//       data['pivot'] = pivot!.toJson();
//     }
//     return data;
//   }
// }
//
// class Pivot {
//   int? institutionId;
//   int? ownerId;
//
//   Pivot({this.institutionId, this.ownerId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     institutionId = json['institution_id'];
//     ownerId = json['owner_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['institution_id'] = institutionId;
//     data['owner_id'] = ownerId;
//     return data;
//   }
// }
//
// class Phones {
//   int? id;
//   String? phone;
//   int? institutionId;
//   String? createdAt;
//   String? updatedAt;
//
//   Phones(
//       {this.id,
//         this.phone,
//         this.institutionId,
//         this.createdAt,
//         this.updatedAt});
//
//   Phones.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     phone = json['phone'];
//     institutionId = json['institution_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['phone'] = phone;
//     data['institution_id'] = institutionId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Address {
//   int? id;
//   int? addressableId;
//   String? addressableType;
//   String? nearBy;
//   int? regionId;
//   int? cityId;
//   int? governorateId;
//   int? countryId;
//   String? createdAt;
//   String? updatedAt;
//   Country? country;
//   Governorate? governorate;
//   City? city;
//   Region? region;
//   Location? location;
//
//   Address(
//       {this.id,
//         this.addressableId,
//         this.addressableType,
//         this.nearBy,
//         this.regionId,
//         this.cityId,
//         this.governorateId,
//         this.countryId,
//         this.createdAt,
//         this.updatedAt,
//         this.country,
//         this.governorate,
//         this.city,
//         this.region,
//         this.location});
//
//   Address.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     addressableId = json['addressable_id'];
//     addressableType = json['addressable_type'];
//     nearBy = json['near_by'];
//     regionId = json['region_id'];
//     cityId = json['city_id'];
//     governorateId = json['governorate_id'];
//     countryId = json['country_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     country = json['country'] != null ? Country?.fromJson(json['country']) : null;
//     governorate = json['governorate'] != null
//         ? Governorate?.fromJson(json['governorate'])
//         : null;
//     city = json['city'] != null ? City?.fromJson(json['city']) : null;
//     region = json['region'] != null ? Region?.fromJson(json['region']) : null;
//     location =
//     json['location'] != null ? Location?.fromJson(json['location']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['addressable_id'] = addressableId;
//     data['addressable_type'] = addressableType;
//     data['near_by'] = nearBy;
//     data['region_id'] = regionId;
//     data['city_id'] = cityId;
//     data['governorate_id'] = governorateId;
//     data['country_id'] = countryId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (country != null) {
//       data['country'] = country!.toJson();
//     }
//     if (governorate != null) {
//       data['governorate'] = governorate!.toJson();
//     }
//     if (city != null) {
//       data['city'] = city!.toJson();
//     }
//     if (region != null) {
//       data['region'] = region!.toJson();
//     }
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     return data;
//   }
// }
//
// class Country {
//   int? id;
//   String? name;
//   String? code;
//   String? codeAlpha3;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   Country(
//       {this.id,
//         this.name,
//         this.code,
//         this.codeAlpha3,
//         this.createdAt,
//         this.updatedAt});
//
//   Country.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     code = json['code'];
//     codeAlpha3 = json['code_alpha_3'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['code'] = code;
//     data['code_alpha_3'] = codeAlpha3;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Governorate {
//   int? id;
//   String? name;
//   int? countryId;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   Governorate(
//       {this.id, this.name, this.countryId, this.createdAt, this.updatedAt});
//
//   Governorate.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     countryId = json['country_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['country_id'] = countryId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class City {
//   int? id;
//   String? name;
//   int? governorateId;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   City(
//       {this.id, this.name, this.governorateId, this.createdAt, this.updatedAt});
//
//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     governorateId = json['governorate_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['governorate_id'] = governorateId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Region {
//   int? id;
//   String? name;
//   int? cityId;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   Region({this.id, this.name, this.cityId, this.createdAt, this.updatedAt});
//
//   Region.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     cityId = json['city_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['city_id'] = cityId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Location {
//   int? id;
//   double? latitude;
//   double? longitude;
//   String? name;
//   int? locationableId;
//   String? locationableType;
//   int? addressId;
//
//   Location(
//       {this.id,
//         this.latitude,
//         this.longitude,
//         this.name,
//         this.locationableId,
//         this.locationableType,
//         this.addressId});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     latitude = json['latitude']/1.0;
//     longitude = json['longitude']/1.0;
//     name = json['name'];
//     locationableId = json['locationable_id'];
//     locationableType = json['locationable_type'];
//     addressId = json['address_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['name'] = name;
//     data['locationable_id'] = locationableId;
//     data['locationable_type'] = locationableType;
//     data['address_id'] = addressId;
//     return data;
//   }
// }
//
// class AvailableSchedules {
//   int? id;
//   String? startDate;
//   String? endDate;
//   int? isRecurring;
//   String? recurringWeekDay;
//   String? slotTime;
//   int? availableScheduleableId;
//   String? availableScheduleableType;
//   dynamic addressId;
//   String? createdAt;
//   String? updatedAt;
//   List<AvailableTimesExceptions>? availableTimesExceptions;
//
//   AvailableSchedules(
//       {this.id,
//         this.startDate,
//         this.endDate,
//         this.isRecurring,
//         this.recurringWeekDay,
//         this.slotTime,
//         this.availableScheduleableId,
//         this.availableScheduleableType,
//         this.addressId,
//         this.createdAt,
//         this.updatedAt,
//         this.availableTimesExceptions});
//
//   AvailableSchedules.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     isRecurring = json['is_recurring'];
//     recurringWeekDay = json['recurring_week_day'];
//     slotTime = json['slot_time'];
//     availableScheduleableId = json['available_scheduleable_id'];
//     availableScheduleableType = json['available_scheduleable_type'];
//     addressId = json['address_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['available_times_exceptions'] != null) {
//       availableTimesExceptions = <AvailableTimesExceptions>[];
//       json['available_times_exceptions'].forEach((v) {
//         availableTimesExceptions!.add(AvailableTimesExceptions.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['is_recurring'] = isRecurring;
//     data['recurring_week_day'] = recurringWeekDay;
//     data['slot_time'] = slotTime;
//     data['available_scheduleable_id'] = availableScheduleableId;
//     data['available_scheduleable_type'] = availableScheduleableType;
//     data['address_id'] = addressId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (availableTimesExceptions != null) {
//       data['available_times_exceptions'] =
//           availableTimesExceptions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Staffs {
//   int? id;
//   int? staffId;
//   int? roleId;
//   int? institutionId;
//   String? createdAt;
//   String? updatedAt;
//   List<ServiceFees>? serviceFees;
//   Role? role;
//   StaffInfo? staffInfo;
//   List<AvailableSchedules>? availableSchedules;
//
//   Staffs(
//       {this.id,
//         this.staffId,
//         this.roleId,
//         this.institutionId,
//         this.createdAt,
//         this.updatedAt,
//         this.serviceFees,
//         this.role,
//         this.staffInfo,
//         this.availableSchedules});
//
//   Staffs.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     staffId = json['staff_id'];
//     roleId = json['role_id'];
//     institutionId = json['institution_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['service_fees'] != null) {
//       serviceFees = <ServiceFees>[];
//       json['service_fees'].forEach((v) {
//         serviceFees!.add(ServiceFees.fromJson(v));
//       });
//     }
//     role = json['role'] != null ? Role?.fromJson(json['role']) : null;
//     staffInfo =
//     json['staff_info'] != null ? StaffInfo?.fromJson(json['staff_info']) : null;
//     if (json['available_schedules'] != null) {
//       availableSchedules = <AvailableSchedules>[];
//       json['available_schedules'].forEach((v) {
//         availableSchedules!.add(AvailableSchedules.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['staff_id'] = staffId;
//     data['role_id'] = roleId;
//     data['institution_id'] = institutionId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (serviceFees != null) {
//       data['service_fees'] = serviceFees!.map((v) => v.toJson()).toList();
//     }
//     if (role != null) {
//       data['role'] = role!.toJson();
//     }
//     if (staffInfo != null) {
//       data['staff_info'] = staffInfo!.toJson();
//     }
//     if (availableSchedules != null) {
//       data['available_schedules'] =
//           availableSchedules!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ServiceFees {
//   int? id;
//   int? serviceFeeableId;
//   String? serviceFeeableType;
//   int? serviceId;
//   String? other;
//   int? price;
//   String? currency;
//   String? createdAt;
//   String? updatedAt;
//
//   ServiceFees(
//       {this.id,
//         this.serviceFeeableId,
//         this.serviceFeeableType,
//         this.serviceId,
//         this.other,
//         this.price,
//         this.currency,
//         this.createdAt,
//         this.updatedAt});
//
//   ServiceFees.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     serviceFeeableId = json['service_feeable_id'];
//     serviceFeeableType = json['service_feeable_type'];
//     serviceId = json['service_id'];
//     other = json['other'];
//     price = json['price'];
//     currency = json['currency'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['service_feeable_id'] = serviceFeeableId;
//     data['service_feeable_type'] = serviceFeeableType;
//     data['service_id'] = serviceId;
//     data['other'] = other;
//     data['price'] = price;
//     data['currency'] = currency;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Role {
//   int? id;
//   String? name;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   Role({this.id, this.name, this.createdAt, this.updatedAt});
//
//   Role.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class StaffInfo {
//   int? id;
//   String? patientableType;
//   InsImage? image;
//
//   StaffInfo({this.id, this.patientableType, this.image});
//
//   StaffInfo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     patientableType = json['patientable_type'];
//     image = json['image'] != null ? InsImage?.fromJson(json['image']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['patientable_type'] = patientableType;
//     if (image != null) {
//       data['image'] = image!.toJson();
//     }
//     return data;
//   }
// }
//
// class InsImage {
//   int? id;
//   String? imageUrl;
//   int? imageableId;
//   String? imageableType;
//   int? isProfile;
//   int? isCover;
//   String? createdAt;
//   String? updatedAt;
//
//   InsImage(
//       {this.id,
//         this.imageUrl,
//         this.imageableId,
//         this.imageableType,
//         this.isProfile,
//         this.isCover,
//         this.createdAt,
//         this.updatedAt});
//
//   InsImage.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     imageUrl = json['image_url'];
//     imageableId = json['imageable_id'];
//     imageableType = json['imageable_type'];
//     isProfile = json['is_profile'];
//     isCover = json['is_cover'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['image_url'] = imageUrl;
//     data['imageable_id'] = imageableId;
//     data['imageable_type'] = imageableType;
//     data['is_profile'] = isProfile;
//     data['is_cover'] = isCover;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class ReservationSetting {
//   int? id;
//   int? reservationSettingableId;
//   String? reservationSettingableType;
//   int? registerOnAttendance;
//   int? reserveOnAttendance;
//   int? reserveOnline;
//   int? reserveByPhone;
//   dynamic reserveOnAttendanceDurationId;
//   int? reserveOnlineDurationId;
//   int? reserveByPhoneDurationId;
//   String? createdAt;
//   String? updatedAt;
//   dynamic reserveOnAttendanceDuration;
//   dynamic reserveOnlineDuration;
//   dynamic reserveByPhoneDuration;
//
//   ReservationSetting(
//       {this.id,
//         this.reservationSettingableId,
//         this.reservationSettingableType,
//         this.registerOnAttendance,
//         this.reserveOnAttendance,
//         this.reserveOnline,
//         this.reserveByPhone,
//         this.reserveOnAttendanceDurationId,
//         this.reserveOnlineDurationId,
//         this.reserveByPhoneDurationId,
//         this.createdAt,
//         this.updatedAt,
//         this.reserveOnAttendanceDuration,
//         this.reserveOnlineDuration,
//         this.reserveByPhoneDuration});
//
//   ReservationSetting.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     reservationSettingableId = json['reservation_settingable_id'];
//     reservationSettingableType = json['reservation_settingable_type'];
//     registerOnAttendance = json['register_on_attendance'];
//     reserveOnAttendance = json['reserve_on_attendance'];
//     reserveOnline = json['reserve_online'];
//     reserveByPhone = json['reserve_by_phone'];
//     reserveOnAttendanceDurationId = json['reserve_on_attendance_duration_id'];
//     reserveOnlineDurationId = json['reserve_online_duration_id'];
//     reserveByPhoneDurationId = json['reserve_by_phone_duration_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     reserveOnAttendanceDuration = json['reserve_on_attendance_duration'];
//     reserveOnlineDuration = json['reserve_online_duration'];
//     reserveByPhoneDuration = json['reserve_by_phone_duration'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['reservation_settingable_id'] = reservationSettingableId;
//     data['reservation_settingable_type'] = reservationSettingableType;
//     data['register_on_attendance'] = registerOnAttendance;
//     data['reserve_on_attendance'] = reserveOnAttendance;
//     data['reserve_online'] = reserveOnline;
//     data['reserve_by_phone'] = reserveByPhone;
//     data['reserve_on_attendance_duration_id'] = reserveOnAttendanceDurationId;
//     data['reserve_online_duration_id'] = reserveOnlineDurationId;
//     data['reserve_by_phone_duration_id'] = reserveByPhoneDurationId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['reserve_on_attendance_duration'] = reserveOnAttendanceDuration;
//     if (reserveOnlineDuration != null) {
//       data['reserve_online_duration'] = reserveOnlineDuration.toJson();
//     }
//     if (reserveByPhoneDuration != null) {
//       data['reserve_by_phone_duration'] = reserveByPhoneDuration.toJson();
//     }
//     return data;
//   }
// }
//
// // class ServiceFees {
// //   int? id;
// //   int? serviceFeeableId;
// //   String? serviceFeeableType;
// //   int? serviceId;
// //   String? other;
// //   int? price;
// //   String? currency;
// //   String? createdAt;
// //   String? updatedAt;
// //   Class? service;
// //
// //   ServiceFees(
// //       {this.id,
// //       this.serviceFeeableId,
// //       this.serviceFeeableType,
// //       this.serviceId,
// //       this.other,
// //       this.price,
// //       this.currency,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.service});
// //
// //   ServiceFees.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     serviceFeeableId = json['service_feeable_id'];
// //     serviceFeeableType = json['service_feeable_type'];
// //     serviceId = json['service_id'];
// //     other = json['other'];
// //     price = json['price'];
// //     currency = json['currency'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     service = json['service'] != null ? Class?.fromJson(json['service']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['service_feeable_id'] = serviceFeeableId;
// //     data['service_feeable_type'] = serviceFeeableType;
// //     data['service_id'] = serviceId;
// //     data['other'] = other;
// //     data['price'] = price;
// //     data['currency'] = currency;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     if (service != null) {
// //       data['service'] = service.toJson();
// //     }
// //     return data;
// //   }
// // }
//
// class Setting {
//   int? id;
//   int? settingableId;
//   String? settingableType;
//   int? showEmail;
//   int? showPhone;
//   int? showMessages;
//   int? showRecommendations;
//   int? showRatings;
//
//   Setting(
//       {this.id,
//         this.settingableId,
//         this.settingableType,
//         this.showEmail,
//         this.showPhone,
//         this.showMessages,
//         this.showRecommendations,
//         this.showRatings});
//
//   Setting.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     settingableId = json['settingable_id'];
//     settingableType = json['settingable_type'];
//     showEmail = json['show_email'];
//     showPhone = json['show_phone'];
//     showMessages = json['show_messages'];
//     showRecommendations = json['show_recommendations'];
//     showRatings = json['show_ratings'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['settingable_id'] = settingableId;
//     data['settingable_type'] = settingableType;
//     data['show_email'] = showEmail;
//     data['show_phone'] = showPhone;
//     data['show_messages'] = showMessages;
//     data['show_recommendations'] = showRecommendations;
//     data['show_ratings'] = showRatings;
//     return data;
//   }
// }
//
// class Issuer {
//   int? id;
//   String? firstName;
//   String? secondName;
//   String? sureName;
//   String? personalId;
//   String? enFirstName;
//   String? enSecondName;
//   String? enSureName;
//   String? sex;
//   String? dateOfBirth;
//   int? patientableId;
//   String? patientableType;
//   User? user;
//
//   Issuer(
//       {this.id,
//         this.firstName,
//         this.secondName,
//         this.sureName,
//         this.personalId,
//         this.enFirstName,
//         this.enSecondName,
//         this.enSureName,
//         this.sex,
//         this.dateOfBirth,
//         this.patientableId,
//         this.patientableType,
//         this.user});
//
//   Issuer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     secondName = json['second_name'];
//     sureName = json['sure_name'];
//     personalId = json['personal_id'];
//     enFirstName = json['en_first_name'];
//     enSecondName = json['en_second_name'];
//     enSureName = json['en_sure_name'];
//     sex = json['sex'];
//     dateOfBirth = json['date_of_birth'];
//     patientableId = json['patientable_id'];
//     patientableType = json['patientable_type'];
//     user = json['user'] != null ? User?.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['first_name'] = firstName;
//     data['second_name'] = secondName;
//     data['sure_name'] = sureName;
//     data['personal_id'] = personalId;
//     data['en_first_name'] = enFirstName;
//     data['en_second_name'] = enSecondName;
//     data['en_sure_name'] = enSureName;
//     data['sex'] = sex;
//     data['date_of_birth'] = dateOfBirth;
//     data['patientable_id'] = patientableId;
//     data['patientable_type'] = patientableType;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }
//
// class User {
//   int? userableId;
//   String? userableType;
//   int? id;
//   List<Phones>? phones;
//   List<Emails>? emails;
//
//   User({this.userableId, this.userableType, this.id, this.phones, this.emails});
//
//   User.fromJson(Map<String, dynamic> json) {
//     userableId = json['userable_id'];
//     userableType = json['userable_type'];
//     id = json['id'];
//     if (json['phones'] != null) {
//       phones = <Phones>[];
//       json['phones'].forEach((v) {
//         phones!.add(Phones.fromJson(v));
//       });
//     }
//     if (json['emails'] != null) {
//       emails = <Emails>[];
//       json['emails'].forEach((v) {
//         emails!.add(Emails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['userable_id'] = userableId;
//     data['userable_type'] = userableType;
//     data['id'] = id;
//     if (phones != null) {
//       data['phones'] = phones!.map((v) => v.toJson()).toList();
//     }
//     if (emails != null) {
//       data['emails'] = emails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
// //
// // class Phones {
// //   int? id;
// //   String? phone;
// //   dynamic phoneVerifiedAt;
// //   int? userId;
// //   int? primary;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Phones(
// //       {this.id,
// //       this.phone,
// //       this.phoneVerifiedAt,
// //       this.userId,
// //       this.primary,
// //       this.createdAt,
// //       this.updatedAt});
// //
// //   Phones.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     phone = json['phone'];
// //     phoneVerifiedAt = json['phone_verified_at'];
// //     userId = json['user_id'];
// //     primary = json['primary'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final data = <String, dynamic>{};
// //     data['id'] = id;
// //     data['phone'] = phone;
// //     data['phone_verified_at'] = phoneVerifiedAt;
// //     data['user_id'] = userId;
// //     data['primary'] = primary;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     return data;
// //   }
// // }
