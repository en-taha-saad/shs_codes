class ReserveOnlineDuration {
  ReserveOnlineDuration({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  Null createdAt;
  Null updatedAt;

  ReserveOnlineDuration.fromJson(Map<String, dynamic> json) {
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
