// import 'package:shs108private/app/global/models/getdatamode.dart';
//
// class Owners {
//   String? name;
//   Owners({this.name});
//   Owners.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     return data;
//   }
// }
//
// class Staff {
//   int? staffId;
//   int? roleId;
//   List<AvailableSchedules>? availableSchedules;
//
//   Staff({this.staffId, this.roleId, this.availableSchedules});
//
//   Staff.fromJson(Map<String, dynamic> json) {
//     staffId = json['staff_id'];
//     roleId = json['role_id'];
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
//     data['staff_id'] = staffId;
//     data['role_id'] = roleId;
//     if (availableSchedules != null) {
//       data['available_schedules'] =
//           availableSchedules!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class AvailableSchedules {
//   String? startDate;
//   String? endDate;
//   int? isRecurring;
//   String? recurringWeekDay;
//   String? slotTime;
//
//   AvailableSchedules(
//       {this.startDate,
//         this.endDate,
//         this.isRecurring,
//         this.recurringWeekDay,
//         this.slotTime});
//
//   AvailableSchedules.fromJson(Map<String, dynamic> json) {
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     isRecurring = json['is_recurring'];
//     recurringWeekDay = json['recurring_week_day'];
//     slotTime = json['slot_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['is_recurring'] = isRecurring;
//     data['recurring_week_day'] = recurringWeekDay;
//     data['slot_time'] = slotTime;
//     return data;
//   }
// }
//
// class Specialist {
//   GetDataModel? institutionSpecialist;
//   String? other;
//   bool? selectedOther;
//
//   Specialist({
//     this.other,
//     this.institutionSpecialist,
//     this.selectedOther,
//   });
//   Specialist.fromJson(Map<String, dynamic> json) {
//     selectedOther = json["selectedOther"];
//     other = json["other"];
//     institutionSpecialist =
//         GetDataModel.fromJson(json["institutionSpecialist"]);
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["selectedOther"] = selectedOther;
//     data["other"] = other;
//     data["institutionSpecialist"] = institutionSpecialist?.toJson();
//     return data;
//   }
// }
//
class CheckBoxState {
  bool? value;
  final String? title;
  int? id;

  CheckBoxState({
    this.value = false,
    this.title,
    this.id,
  });
}

class Clinics {
  Institution? institution;
  List<Phones>? phones;
  List<int>? owners;
  List<MedicalSpecialties>? medicalSpecialties;
  List<InstitutionTreatments>? institutionTreatments;
  Address? address;
  List<AvailableSchedules>? availableSchedules;
  List<Staffs>? staffs;
  ReservationSetting? reservationSetting;
  // List<ServiceFees>? serviceFees;
  Setting? setting;

  Clinics(
      {this.institution,
        this.phones,
        this.owners,
        this.medicalSpecialties,
        this.institutionTreatments,
        this.address,
        this.availableSchedules,
        this.staffs,
        this.reservationSetting,
        // this.serviceFees,
        this.setting});

  Clinics.fromJson(Map<String, dynamic> json) {
    institution = json['institution'] != null
        ? Institution?.fromJson(json['institution'])
        : null;
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones?.add(Phones.fromJson(v));
      });
    }
    owners = json['owners'].cast<int>();
    if (json['medical_specialties'] != null) {
      medicalSpecialties = <MedicalSpecialties>[];
      json['medical_specialties'].forEach((v) {
        medicalSpecialties?.add(MedicalSpecialties.fromJson(v));
      });
    }
    if (json['institution_treatments'] != null) {
      institutionTreatments = <InstitutionTreatments>[];
      json['institution_treatments'].forEach((v) {
        institutionTreatments?.add(InstitutionTreatments.fromJson(v));
      });
    }
    address = json['address'] != null ? Address?.fromJson(json['address']) :
    null;
    if (json['available_schedules'] != null) {
      availableSchedules = <AvailableSchedules>[];
      json['available_schedules'].forEach((v) {
        availableSchedules?.add(AvailableSchedules.fromJson(v));
      });
    }
    if (json['staffs'] != null) {
      staffs = <Staffs>[];
      json['staffs'].forEach((v) {
        staffs?.add(Staffs.fromJson(v));
      });
    }
    reservationSetting = json['reservation_setting'] != null
        ? ReservationSetting?.fromJson(json['reservation_setting'])
        : null;
    // if (json['service_fees'] != null) {
    //   serviceFees = <ServiceFees>[];
    //   json['service_fees'].forEach((v) {
    //     serviceFees?.add(ServiceFees.fromJson(v));
    //   });
    // }
    setting = json['setting'] != null ? Setting?.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (institution != null) {
      data['institution'] = institution?.toJson();
    }
    if (phones != null) {
      data['phones'] = phones?.map((v) => v.toJson()).toList();
    }
    data['owners'] = owners;
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties?.map((v) => v.toJson()).toList();
    }
    if (institutionTreatments != null) {
      data['institution_treatments'] =
          institutionTreatments?.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address?.toJson();
    }
    if (availableSchedules != null) {
      data['available_schedules'] =
          availableSchedules?.map((v) => v.toJson()).toList();
    }
    if (staffs != null) {
      data['staffs'] = staffs?.map((v) => v.toJson()).toList();
    }
    if (reservationSetting != null) {
      data['reservation_setting'] = reservationSetting?.toJson();
    }
    // if (serviceFees != null) {
    //   data['service_fees'] = serviceFees?.map((v) => v.toJson()).toList();
    // }
    if (setting != null) {
      data['setting'] = setting?.toJson();
    }
    return data;
  }
}

class Institution {
  String? medicalCategory;
  String? name;
  String? registrationNo;

  Institution({this.medicalCategory, this.name, this.registrationNo});

  Institution.fromJson(Map<String, dynamic> json) {
    medicalCategory = json['medical_category'];
    name = json['name'];
    registrationNo = json['registration_no'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['medical_category'] = medicalCategory;
    data['name'] = name;
    data['registration_no'] = registrationNo;
    return data;
  }
}

class Phones {
  String? phone;

  Phones({this.phone});

  Phones.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}

class MedicalSpecialties {
  String? other;
  int? id;

  MedicalSpecialties({this.other, this.id});

  MedicalSpecialties.fromJson(Map<String, dynamic> json) {
    other = json['other'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['other'] = other;
    data['id'] = id;
    return data;
  }
}

class InstitutionTreatments {
  String? name;

  InstitutionTreatments({this.name});

  InstitutionTreatments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Address {
  String? nearBy;
  int? regionId;
  int? cityId;
  int? governorateId;
  int? countryId;
  Location? location;

  Address(
      {this.nearBy,
        this.regionId,
        this.cityId,
        this.governorateId,
        this.countryId,
        this.location});

  Address.fromJson(Map<String, dynamic> json) {
    nearBy = json['near_by'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    governorateId = json['governorate_id'];
    countryId = json['country_id'];
    location =
    json['location'] != null ? Location?.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['near_by'] = nearBy;
    data['region_id'] = regionId;
    data['city_id'] = cityId;
    data['governorate_id'] = governorateId;
    data['country_id'] = countryId;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class AvailableSchedules {
  String? startDate;
  String? endDate;
  int? isRecurring;
  String? recurringWeekDay;
  String? slotTime;


  AvailableSchedules(
      {this.startDate,
        this.endDate,
        this.isRecurring,
        this.recurringWeekDay,
        this.slotTime});

  AvailableSchedules.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    isRecurring = json['is_recurring'];
    recurringWeekDay = json['recurring_week_day'];
    slotTime = json['slot_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_recurring'] = isRecurring;
    data['recurring_week_day'] = recurringWeekDay;
    data['slot_time'] = slotTime;
    return data;
  }
}

class Staffs {
  int? staffId;
  int? roleId;
  List<ServiceFees>? serviceFees;
  List<AvailableSchedules>? availableSchedules;

  Staffs(
      {this.staffId, this.roleId, this.serviceFees, this.availableSchedules});

  Staffs.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    roleId = json['role_id'];
    if (json['service_fees'] != null) {
      serviceFees = <ServiceFees>[];
      json['service_fees'].forEach((v) {
        serviceFees?.add(ServiceFees.fromJson(v));
      });
    }
    if (json['available_schedules'] != null) {
      availableSchedules = <AvailableSchedules>[];
      json['available_schedules'].forEach((v) {
        availableSchedules?.add(AvailableSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['staff_id'] = staffId;
    data['role_id'] = roleId;
    if (serviceFees != null) {
      data['service_fees'] = serviceFees?.map((v) => v.toJson()).toList();
    }
    if (availableSchedules != null) {
      data['available_schedules'] =
          availableSchedules?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceFees {
  String? other;
  int? price;
  String? currency;
  int? serviceId;

  ServiceFees({this.other, this.price = 0 , this.currency, this.serviceId});

  ServiceFees.fromJson(Map<String, dynamic> json) {
    other = json['other'];
    price = json['price'];
    currency = json['currency'];
    serviceId = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['other'] = other;
    data['price'] = price;
    data['currency'] = currency;
    data['service_id'] = serviceId;
    return data;
  }
}

class ReservationSetting {
  int? registerOnAttendance;
  int? reserveOnAttendance;
  int? reserveOnline;
  int? reserveByPhone;
  int? reserveOnAttendanceDurationId;
  int? reserveOnlineDurationId;
  int? reserveByPhoneDurationId;

  ReservationSetting(
      {this.registerOnAttendance,
        this.reserveOnAttendance,
        this.reserveOnline,
        this.reserveByPhone,
        this.reserveOnAttendanceDurationId,
        this.reserveOnlineDurationId,
        this.reserveByPhoneDurationId});

  ReservationSetting.fromJson(Map<String, dynamic> json) {
    registerOnAttendance = json['register_on_attendance'];
    reserveOnAttendance = json['reserve_on_attendance'];
    reserveOnline = json['reserve_online'];
    reserveByPhone = json['reserve_by_phone'];
    reserveOnAttendanceDurationId = json['reserve_on_attendance_duration_id'];
    reserveOnlineDurationId = json['reserve_online_duration_id'];
    reserveByPhoneDurationId = json['reserve_by_phone_duration_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['register_on_attendance'] = registerOnAttendance;
    data['reserve_on_attendance'] = reserveOnAttendance;
    data['reserve_online'] = reserveOnline;
    data['reserve_by_phone'] = reserveByPhone;
    if(reserveOnAttendanceDurationId!=null) {
      data['reserve_on_attendance_duration_id'] = reserveOnAttendanceDurationId;
    }
    if(reserveOnlineDurationId!=null) {
      data['reserve_online_duration_id'] = reserveOnlineDurationId;
    }
    if(reserveByPhoneDurationId!=null) {
      data['reserve_by_phone_duration_id'] = reserveByPhoneDurationId;
    }
    return data;
  }
}

class Setting {
  // int? showEmail;
  int? showPhone;
  int? showMessages;
  int? showRecommendations;
  // int? showRatings;

  Setting(
      {
        // this.showEmail,
        this.showPhone,
        this.showMessages,
        this.showRecommendations,
        // this.showRatings
      });

  Setting.fromJson(Map<String, dynamic> json) {
    // showEmail = json['show_email'];
    showPhone = json['show_phone'];
    showMessages = json['show_messages'];
    showRecommendations = json['show_recommendations'];
    // showRatings = json['show_ratings'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['show_email'] = showEmail;
    data['show_phone'] = showPhone;
    data['show_messages'] = showMessages;
    data['show_recommendations'] = showRecommendations;
    // data['show_ratings'] = showRatings;
    return data;
  }
}
