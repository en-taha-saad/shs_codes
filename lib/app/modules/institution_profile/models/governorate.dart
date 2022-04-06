class Governorate {
  Governorate({
    this.id,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  int? countryId;
  Null createdAt;
  Null updatedAt;

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
