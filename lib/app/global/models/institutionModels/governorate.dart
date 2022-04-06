// ignore_for_file: prefer_void_to_null

class Governorate {
  Governorate({
    required this.id,
    required this.name,
    required this.countryId,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int countryId;
  late final Null createdAt;
  late final Null updatedAt;

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country_id'] = countryId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
