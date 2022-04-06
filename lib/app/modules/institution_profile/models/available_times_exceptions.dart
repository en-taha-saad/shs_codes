// ignore_for_file: prefer_void_to_null

class AvailableTimesExceptions {
  AvailableTimesExceptions({
    this.id,
    this.startDate,
    this.endDate,
    this.reason,
    this.availableScheduleId,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? startDate;
  String? endDate;
  String? reason;
  int? availableScheduleId;
  Null createdAt;
  Null updatedAt;

  AvailableTimesExceptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    availableScheduleId = json['available_schedule_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['reason'] = reason;
    _data['available_schedule_id'] = availableScheduleId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
