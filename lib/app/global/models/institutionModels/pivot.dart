class Pivot {
  Pivot({
    required this.institutionId,
    required this.ownerId,
  });
  late final int institutionId;
  late final int ownerId;

  Pivot.fromJson(Map<String, dynamic> json) {
    institutionId = json['institution_id'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['institution_id'] = institutionId;
    _data['owner_id'] = ownerId;
    return _data;
  }
}
