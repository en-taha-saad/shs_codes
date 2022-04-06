class ExtraInfo {
  ExtraInfo({
    this.institutionId,
    this.medicalSpecialtyId,
    this.other,
  });
  int? institutionId;
  int? medicalSpecialtyId;
  String? other;

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    institutionId = json['institution_id'];
    medicalSpecialtyId = json['medical_specialty_id'];
    if (json['other'] != null) {
      other = json['other'];
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['institution_id'] = institutionId;
    _data['medical_specialty_id'] = medicalSpecialtyId;
    _data['other'] = other;
    return _data;
  }
}
