class InstitutionTreatments {
  InstitutionTreatments({
    required this.id,
    required this.name,
    required this.institutionId,
    this.createdAt,
    this.updatedAt,
  });
   int? id;
   String? name;
   int? institutionId;
   Null? createdAt;
   Null? updatedAt;

  InstitutionTreatments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    institutionId = json['institution_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['institution_id'] = institutionId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
