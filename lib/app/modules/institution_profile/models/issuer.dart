import 'user.dart';

class Issuer {
  Issuer({
    this.id,
    this.firstName,
    this.secondName,
    this.sureName,
    this.personalId,
    this.enFirstName,
    this.enSecondName,
    this.enSureName,
    this.sex,
    this.dateOfBirth,
    this.patientableId,
    this.patientableType,
    this.user,
  });
  int? id;
  String? firstName;
  String? secondName;
  String? sureName;
  String? personalId;
  String? enFirstName;
  String? enSecondName;
  String? enSureName;
  String? sex;
  String? dateOfBirth;
  Null patientableId;
  Null patientableType;
  User? user;

  Issuer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    sureName = json['sure_name'];
    personalId = json['personal_id'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSureName = json['en_sure_name'];
    sex = json['sex'];
    dateOfBirth = json['date_of_birth'];
    patientableId = null;
    patientableType = null;
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['second_name'] = secondName;
    _data['sure_name'] = sureName;
    _data['personal_id'] = personalId;
    _data['en_first_name'] = enFirstName;
    _data['en_second_name'] = enSecondName;
    _data['en_sure_name'] = enSureName;
    _data['sex'] = sex;
    _data['date_of_birth'] = dateOfBirth;
    // _data['patientable_id'] = patientableId;
    // _data['patientable_type'] = patientableType;
    _data['user'] = user?.toJson();
    return _data;
  }
}
