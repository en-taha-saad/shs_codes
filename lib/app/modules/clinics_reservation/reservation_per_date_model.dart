class ReservationPerDate {
  int? id;
  int? statusId;
  String? reservationDate;
  String? reservationTime;
  ReservationStatus? reservationStatus;

  ReservationPerDate(
      {this.id,
      this.statusId,
      this.reservationDate,
      this.reservationTime,
      this.reservationStatus});

  ReservationPerDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    reservationDate = json['reservation_date'];
    reservationTime = json['reservation_time'];
    reservationStatus = json['reservation_status'] != null
        ? ReservationStatus?.fromJson(json['reservation_status'])
        : null;
  }

  static List<ReservationPerDate> fromJsonList(List list) =>
      list.map((item) => ReservationPerDate.fromJson(item)).toList();

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status_id'] = statusId;
    data['reservation_date'] = reservationDate;
    data['reservation_time'] = reservationTime;
    if (reservationStatus != null) {
      data['reservation_status'] = reservationStatus!.toJson();
    }
    return data;
  }
}

class ReservationStatus {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  ReservationStatus({this.id, this.name, this.createdAt, this.updatedAt});

  ReservationStatus.fromJson(Map<String, dynamic> json) {
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
