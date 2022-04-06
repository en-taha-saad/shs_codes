// ignore_for_file: prefer_void_to_null

import 'available_schedules.dart';
import 'role.dart';
import 'service_fees.dart';
import 'staff_info.dart';

class Staffs {
  Staffs({
    required this.id,
    required this.staffId,
    required this.roleId,
    required this.institutionId,
    this.createdAt,
    this.updatedAt,
    required this.serviceFees,
    required this.role,
    required this.staffInfo,
    required this.availableSchedules,
  });
  int? id;
  int? staffId;
  int? roleId;
  int? institutionId;
  Null createdAt;
  Null updatedAt;
  List<ServiceFees>? serviceFees;
  Role? role;
  StaffInfo? staffInfo;
  List<StaffAvailableSchedules>? availableSchedules;

  Staffs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    roleId = json['role_id'];
    institutionId = json['institution_id'];
    createdAt = null;
    updatedAt = null;

    serviceFees = List.from(json['service_fees'])
        .map((e) => ServiceFees.fromJson(e))
        .toList();
    role = Role.fromJson(json['role']);
    staffInfo = StaffInfo.fromJson(json['staff_info']);
    availableSchedules = List.from(json['available_schedules'])
        .map((e) => StaffAvailableSchedules.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['staff_id'] = staffId;
    _data['role_id'] = roleId;
    _data['institution_id'] = institutionId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['service_fees'] = serviceFees?.map((e) => e.toJson()).toList();
    _data['role'] = role?.toJson();
    _data['staff_info'] = staffInfo?.toJson();
    _data['available_schedules'] =
        availableSchedules?.map((e) => e.toJson()).toList();
    return _data;
  }
}
