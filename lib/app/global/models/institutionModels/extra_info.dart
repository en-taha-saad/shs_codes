class ExtraInfo {
  ExtraInfo({
    required this.institutionId,
    required this.medicalSpecialtyId,
    this.other,
  });
  late final int institutionId;
  late final int medicalSpecialtyId;
  late final String? other;

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    institutionId = json['institution_id'];
    medicalSpecialtyId = json['medical_specialty_id'];
    other = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['institution_id'] = institutionId;
    _data['medical_specialty_id'] = medicalSpecialtyId;
    _data['other'] = other;
    return _data;
  }
}
