import 'emails.dart';
import 'phones.dart';

class User {
  User({
    required this.userableId,
    required this.userableType,
    required this.id,
    required this.phones,
    required this.emails,
  });
  int? userableId;
  String? userableType;
  int? id;
  List<IssuerPhones>? phones;
  List<Emails>? emails;

  User.fromJson(Map<String, dynamic> json) {
    userableId = json['userable_id'];
    userableType = json['userable_type'];
    id = json['id'];
    phones = List.from(json['phones']).map((e) => IssuerPhones.fromJson(e)).toList();

    emails = List.from(json['emails']).map((e) => Emails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userable_id'] = userableId;
    _data['userable_type'] = userableType;
    _data['id'] = id;
    _data['phones'] = phones?.map((e) => e.toJson()).toList();
    _data['emails'] = emails?.map((e) => e.toJson()).toList();
    return _data;
  }
}
