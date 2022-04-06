// ignore_for_file: prefer_void_to_null

class AvailableTimesExceptions {
  AvailableTimesExceptions({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.availableScheduleId,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String startDate;
  late final String endDate;
  late final String reason;
  late final int availableScheduleId;
  late final Null createdAt;
  late final Null updatedAt;

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
