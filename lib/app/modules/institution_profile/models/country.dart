class Country {
  Country({
    this.id,
    this.name,
    this.code,
    this.codeAlpha_3,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  String? code;
  String? codeAlpha_3;
  Null createdAt;
  Null updatedAt;

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    codeAlpha_3 = json['code_alpha_3'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['code_alpha_3'] = codeAlpha_3;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
