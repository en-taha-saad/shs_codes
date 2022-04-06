class Pivot {
  Pivot({
    this.institutionId,
    this.ownerId,
  });
  int? institutionId;
  int? ownerId;

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
