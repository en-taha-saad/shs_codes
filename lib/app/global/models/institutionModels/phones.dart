// ignore_for_file: prefer_void_to_null

class InstitutionPhones {
  InstitutionPhones({
    required this.id,
    required this.phone,
    required this.institutionId,
    this.createdAt,
    this.updatedAt,
  });
   int? id;
   String? phone;
   int? institutionId;
   Null? createdAt;
   Null? updatedAt;

  InstitutionPhones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    institutionId = json['institution_id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['phone'] = phone;
    _data['institution_id'] = institutionId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class IssuerPhones {
  IssuerPhones({
    required this.id,
    required this.phone,
    this.phoneVerifiedAt,
    required this.userId,
    required this.primary,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? phone;
  Null phoneVerifiedAt;
  int? userId;
  int? primary;
  Null createdAt;
  Null updatedAt;

  IssuerPhones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    phoneVerifiedAt = null;
    userId = json['user_id'];
    primary = json['primary'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['phone'] = phone;
    _data['phone_verified_at'] = phoneVerifiedAt;
    _data['user_id'] = userId;
    _data['primary'] = primary;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
