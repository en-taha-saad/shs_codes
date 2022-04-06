class City {
  City({
    this.id,
    this.name,
    this.governorateId,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  int? governorateId;
  Null createdAt;
  Null updatedAt;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    governorateId = json['governorate_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['governorate_id'] = governorateId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
