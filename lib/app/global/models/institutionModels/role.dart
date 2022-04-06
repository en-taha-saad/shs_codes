// ignore_for_file: prefer_void_to_null

class Role {
  Role({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  Null createdAt;
  Null updatedAt;

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
