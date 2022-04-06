import 'reserve_by_phone_duration.dart';
import 'reserve_on_attendance_duration.dart';
import 'reserve_online_duration.dart';

class ReservationSetting {
  ReservationSetting({
    this.id,
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
    this.reserveByPhoneDuration,
  });
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
  Null createdAt;
  Null updatedAt;
  ReserveOnAttendanceDuration? reserveOnAttendanceDuration;
  ReserveOnlineDuration? reserveOnlineDuration;
  ReserveByPhoneDuration? reserveByPhoneDuration;

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
    createdAt = null;
    updatedAt = null;
    if (json['reserve_on_attendance_duration'] != null) {
      reserveOnAttendanceDuration = ReserveOnAttendanceDuration.fromJson(
          json['reserve_on_attendance_duration']);
    }
    if (json['reserve_online_duration'] != null) {
      reserveOnlineDuration =
          ReserveOnlineDuration.fromJson(json['reserve_online_duration']);
    }
    if (json['reserve_by_phone_duration'] != null) {
      reserveByPhoneDuration =
          ReserveByPhoneDuration.fromJson(json['reserve_by_phone_duration']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reservation_settingable_id'] = reservationSettingableId;
    _data['reservation_settingable_type'] = reservationSettingableType;
    _data['register_on_attendance'] = registerOnAttendance;
    _data['reserve_on_attendance'] = reserveOnAttendance;
    _data['reserve_online'] = reserveOnline;
    _data['reserve_by_phone'] = reserveByPhone;
    _data['reserve_on_attendance_duration_id'] = reserveOnAttendanceDurationId;
    _data['reserve_online_duration_id'] = reserveOnlineDurationId;
    _data['reserve_by_phone_duration_id'] = reserveByPhoneDurationId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['reserve_on_attendance_duration'] =
        reserveOnAttendanceDuration?.toJson();
    _data['reserve_online_duration'] = reserveOnlineDuration?.toJson();
    _data['reserve_by_phone_duration'] = reserveByPhoneDuration?.toJson();
    return _data;
  }
}
