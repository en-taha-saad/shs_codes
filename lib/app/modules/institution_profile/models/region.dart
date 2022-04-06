class Region {
  Region({
    this.id,
    this.name,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  int? cityId;
  Null createdAt;
  Null updatedAt;

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
