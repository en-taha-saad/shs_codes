// ignore_for_file: prefer_void_to_null

class Emails {
  Emails({
    required this.id,
    required this.email,
    this.emailVerifiedAt,
    required this.userId,
    required this.primary,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? email;
  Null emailVerifiedAt;
  int? userId;
  int? primary;
  Null createdAt;
  Null updatedAt;

  Emails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];

    emailVerifiedAt = null;
    userId = json['user_id'];
    primary = json['primary'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['user_id'] = userId;
    _data['primary'] = primary;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
