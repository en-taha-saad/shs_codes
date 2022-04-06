// ignore_for_file: prefer_void_to_null

import 'available_times_exceptions.dart';

class InstitutionAvailableSchedules {
  InstitutionAvailableSchedules({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.isRecurring,
    required this.recurringWeekDay,
    required this.slotTime,
    required this.availableScheduleableId,
    required this.availableScheduleableType,
    required this.addressId,
    this.createdAt,
    this.updatedAt,
    required this.availableTimesExceptions,
  });
  int? id;
  String? startDate;
  String? endDate;
  int? isRecurring;
  String? recurringWeekDay;
  String? slotTime;
  int? availableScheduleableId;
  String? availableScheduleableType;
  int? addressId;
  Null createdAt;
  Null updatedAt;
  List<AvailableTimesExceptions>? availableTimesExceptions;

  InstitutionAvailableSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isRecurring = json['is_recurring'];
    recurringWeekDay = json['recurring_week_day'];
    slotTime = json['slot_time'];
    availableScheduleableId = json['available_scheduleable_id'];
    availableScheduleableType = json['available_scheduleable_type'];
    addressId = json['address_id'];
    createdAt = null;
    updatedAt = null;
    availableTimesExceptions = List.from(json['available_times_exceptions'])
        .map((e) => AvailableTimesExceptions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['is_recurring'] = isRecurring;
    _data['recurring_week_day'] = recurringWeekDay;
    _data['slot_time'] = slotTime;
    _data['available_scheduleable_id'] = availableScheduleableId;
    _data['available_scheduleable_type'] = availableScheduleableType;
    _data['address_id'] = addressId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['available_times_exceptions'] =
        availableTimesExceptions?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class StaffAvailableSchedules {
  StaffAvailableSchedules({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.isRecurring,
    required this.recurringWeekDay,
    required this.slotTime,
    required this.availableScheduleableId,
    required this.availableScheduleableType,
    required this.addressId,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? startDate;
  String? endDate;
  int? isRecurring;
  String? recurringWeekDay;
  String? slotTime;
  int? availableScheduleableId;
  String? availableScheduleableType;
  int? addressId;
  Null createdAt;
  Null updatedAt;

  StaffAvailableSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isRecurring = json['is_recurring'];
    recurringWeekDay = json['recurring_week_day'];
    slotTime = json['slot_time'];
    availableScheduleableId = json['available_scheduleable_id'];
    availableScheduleableType = json['available_scheduleable_type'];
    addressId = json['address_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['is_recurring'] = isRecurring;
    _data['recurring_week_day'] = recurringWeekDay;
    _data['slot_time'] = slotTime;
    _data['available_scheduleable_id'] = availableScheduleableId;
    _data['available_scheduleable_type'] = availableScheduleableType;
    _data['address_id'] = addressId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
