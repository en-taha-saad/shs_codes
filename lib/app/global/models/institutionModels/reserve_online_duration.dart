class ReserveOnlineDuration {
  ReserveOnlineDuration({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String name;
  late final Null createdAt;
  late final Null updatedAt;

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
