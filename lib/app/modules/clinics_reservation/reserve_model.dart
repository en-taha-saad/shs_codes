import 'package:shs108private/app/global/models/institutionModels/reserve_by_phone_duration.dart';
import 'package:shs108private/app/global/models/institutionModels/reserve_on_attendance_duration.dart';
import 'package:shs108private/app/global/models/institutionModels/reserve_online_duration.dart';
import 'package:shs108private/app/global/models/institutionModels/role.dart';

class Reserve {
  List<StaffsInfo>? staffsInfo;
  ReservationSetting? reservationSetting;

  Reserve({this.staffsInfo, this.reservationSetting});

  Reserve.fromJson(Map<String, dynamic> json) {
    if (json['staff_info'] != null) {
      staffsInfo = <StaffsInfo>[];
      json['staff_info'].forEach((v) {
        staffsInfo!.add(StaffsInfo.fromJson(v));
      });
    }
    reservationSetting = json['reservation_setting'] != null
        ? ReservationSetting?.fromJson(json['reservation_setting'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (staffsInfo != null) {
      data['staff_info'] = staffsInfo!.map((v) => v.toJson()).toList();
    }
    if (reservationSetting != null) {
      data['reservation_setting'] = reservationSetting!.toJson();
    }
    return data;
  }
}

class StaffsInfo {
  int? id;
  int? staffId;
  int? roleId;
  int? institutionId;
  dynamic createdAt;
  dynamic updatedAt;
  List<ServiceFees>? serviceFees;
  StaffInfo? staffInfo;
  Role? role;
  List<AvailableSchedules>? availableSchedules;

  StaffsInfo(
      {this.id,
      this.staffId,
      this.roleId,
      this.institutionId,
      this.createdAt,
      this.updatedAt,
      this.serviceFees,
      this.staffInfo,
      this.role,
      this.availableSchedules});

  StaffsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    roleId = json['role_id'];
    institutionId = json['institution_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['service_fees'] != null) {
      serviceFees = <ServiceFees>[];
      json['service_fees'].forEach((v) {
        serviceFees!.add(ServiceFees.fromJson(v));
      });
    }
    staffInfo =
        json['staff_info'] != null ? StaffInfo?.fromJson(json['staff_info'])
            : null;
    role = json['role'] != null ? Role?.fromJson(json['role']) : null;
    if (json['available_schedules'] != null) {
      availableSchedules = <AvailableSchedules>[];
      json['available_schedules'].forEach((v) {
        availableSchedules!.add(AvailableSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['staff_id'] = staffId;
    data['role_id'] = roleId;
    data['institution_id'] = institutionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (serviceFees != null) {
      data['service_fees'] = serviceFees!.map((v) => v.toJson()).toList();
    }
    if (staffInfo != null) {
      data['staff_info'] = staffInfo!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (availableSchedules != null) {
      data['available_schedules'] =
          availableSchedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceFees {
  int? id;
  int? serviceFeeableId;
  String? serviceFeeableType;
  int? serviceId;
  String? other;
  int? price;
  String? currency;
  dynamic createdAt;
  dynamic updatedAt;
  Service? service;

  ServiceFees(
      {this.id,
      this.serviceFeeableId,
      this.serviceFeeableType,
      this.serviceId,
      this.other,
      this.price,
      this.currency,
      this.createdAt,
      this.updatedAt,
      this.service});

  ServiceFees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceFeeableId = json['service_feeable_id'];
    serviceFeeableType = json['service_feeable_type'];
    serviceId = json['service_id'];
    other = json['other'];
    price = json['price'];
    currency = json['currency'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service = json['service'] != null ? Service?.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['service_feeable_id'] = serviceFeeableId;
    data['service_feeable_type'] = serviceFeeableType;
    data['service_id'] = serviceId;
    data['other'] = other;
    data['price'] = price;
    data['currency'] = currency;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  Service({this.id, this.name, this.createdAt, this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class StaffInfo {
  int? id;
  String? firstName;
  String? secondName;
  String? sureName;
  String? enFirstName;
  String? enSecondName;
  String? enSureName;
  String? personalId;
  String? dateOfBirth;
  String? sex;
  int? independent;
  int? patientableId;
  String? patientableType;
  int? active;
  dynamic createdAt;
  dynamic updatedAt;
  Image? image;

  StaffInfo(
      {this.id,
      this.firstName,
      this.secondName,
      this.sureName,
      this.enFirstName,
      this.enSecondName,
      this.enSureName,
      this.personalId,
      this.dateOfBirth,
      this.sex,
      this.independent,
      this.patientableId,
      this.patientableType,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.image});

  StaffInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    sureName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSureName = json['en_sure_name'];
    personalId = json['personal_id'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    independent = json['independent'];
    patientableId = json['patientable_id'];
    patientableType = json['patientable_type'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? Image?.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = sureName;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSureName;
    data['personal_id'] = personalId;
    data['date_of_birth'] = dateOfBirth;
    data['sex'] = sex;
    data['independent'] = independent;
    data['patientable_id'] = patientableId;
    data['patientable_type'] = patientableType;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  int? isCover;
  dynamic createdAt;
  dynamic updatedAt;

  Image(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.isCover,
      this.createdAt,
      this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    isCover = json['is_cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['imageable_id'] = imageableId;
    data['imageable_type'] = imageableType;
    data['is_profile'] = isProfile;
    data['is_cover'] = isCover;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AvailableSchedules {
  int? id;
  String? startDate;
  String? endDate;
  int? isRecurring;
  String? recurringWeekDay;
  String? slotTime;
  int? availableScheduleableId;
  String? availableScheduleableType;
  int? addressId;
  dynamic createdAt;
  dynamic updatedAt;

  AvailableSchedules(
      {this.id,
      this.startDate,
      this.endDate,
      this.isRecurring,
      this.recurringWeekDay,
      this.slotTime,
      this.availableScheduleableId,
      this.availableScheduleableType,
      this.addressId,
      this.createdAt,
      this.updatedAt});

  AvailableSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isRecurring = json['is_recurring'];
    recurringWeekDay = json['recurring_week_day'];
    slotTime = json['slot_time'];
    availableScheduleableId = json['available_scheduleable_id'];
    availableScheduleableType = json['available_scheduleable_type'];
    addressId = json['address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_recurring'] = isRecurring;
    data['recurring_week_day'] = recurringWeekDay;
    data['slot_time'] = slotTime;
    data['available_scheduleable_id'] = availableScheduleableId;
    data['available_scheduleable_type'] = availableScheduleableType;
    data['address_id'] = addressId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ReservationSetting {
  int? id;
  int? reservationSettingableId;
  String? reservationSettingableType;
  int? registerOnAttendance;
  int? reserveOnAttendance;
  int? reserveOnline;
  int? reserveByPhone;
  int? reserveOnAttendanceDurationId;
  int? reserveOnlineDurationId;
  int? reserveByPhoneDurationId;
  dynamic createdAt;
  dynamic updatedAt;
  ReserveOnAttendanceDuration? reserveOnAttendanceDuration;
  ReserveOnlineDuration? reserveOnlineDuration;
  ReserveByPhoneDuration? reserveByPhoneDuration;

  ReservationSetting(
      {this.id,
      this.reservationSettingableId,
      this.reservationSettingableType,
      this.registerOnAttendance,
      this.reserveOnAttendance,
      this.reserveOnline,
      this.reserveByPhone,
      this.reserveOnAttendanceDurationId,
      this.reserveOnlineDurationId,
      this.reserveByPhoneDurationId,
      this.createdAt,
      this.updatedAt,
      this.reserveOnAttendanceDuration,
      this.reserveOnlineDuration,
      this.reserveByPhoneDuration});

  ReservationSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationSettingableId = json['reservation_settingable_id'];
    reservationSettingableType = json['reservation_settingable_type'];
    registerOnAttendance = json['register_on_attendance'];
    reserveOnAttendance = json['reserve_on_attendance'];
    reserveOnline = json['reserve_online'];
    reserveByPhone = json['reserve_by_phone'];
    reserveOnAttendanceDurationId = json['reserve_on_attendance_duration_id'];
    reserveOnlineDurationId = json['reserve_online_duration_id'];
    reserveByPhoneDurationId = json['reserve_by_phone_duration_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reserveOnAttendanceDuration = json['reserve_on_attendance_duration'] != null
        ? ReserveOnAttendanceDuration?.fromJson
      (json['reserve_on_attendance_duration'])
        : null;
    reserveOnlineDuration = json['reserve_online_duration'] != null
        ? ReserveOnlineDuration?.fromJson(json['reserve_online_duration'])
        : null;
    reserveByPhoneDuration = json['reserve_by_phone_duration'] != null
        ? ReserveByPhoneDuration?.fromJson(json['reserve_by_phone_duration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['reservation_settingable_id'] = reservationSettingableId;
    data['reservation_settingable_type'] = reservationSettingableType;
    data['register_on_attendance'] = registerOnAttendance;
    data['reserve_on_attendance'] = reserveOnAttendance;
    data['reserve_online'] = reserveOnline;
    data['reserve_by_phone'] = reserveByPhone;
    data['reserve_on_attendance_duration_id'] = reserveOnAttendanceDurationId;
    data['reserve_online_duration_id'] = reserveOnlineDurationId;
    data['reserve_by_phone_duration_id'] = reserveByPhoneDurationId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (reserveOnAttendanceDuration != null) {
      data['reserve_on_attendance_duration'] =
          reserveOnAttendanceDuration!.toJson();
    }
    if (reserveOnlineDuration != null) {
      data['reserve_online_duration'] = reserveOnlineDuration!.toJson();
    }
    if (reserveByPhoneDuration != null) {
      data['reserve_by_phone_duration'] = reserveByPhoneDuration!.toJson();
    }
    return data;
  }
}
