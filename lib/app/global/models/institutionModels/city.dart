// ignore_for_file: prefer_void_to_null

class City {
  City({
    required this.id,
    required this.name,
    required this.governorateId,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int governorateId;
  late final Null createdAt;
  late final Null updatedAt;

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
