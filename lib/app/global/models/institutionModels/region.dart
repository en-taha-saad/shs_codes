class Region {
  Region({
    required this.id,
    required this.name,
    required this.cityId,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int cityId;
  late final Null createdAt;
  late final Null updatedAt;

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city_id'] = cityId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
