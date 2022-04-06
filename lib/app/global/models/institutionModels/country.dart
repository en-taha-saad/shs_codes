// ignore_for_file: prefer_void_to_null

class Country {
  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.codeAlpha_3,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String code;
  late final String codeAlpha_3;
  late final Null createdAt;
  late final Null updatedAt;

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
