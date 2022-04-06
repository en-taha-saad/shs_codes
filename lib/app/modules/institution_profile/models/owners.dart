import 'pivot.dart';

class Owners {
  Owners({
    this.id,
    this.firstName,
    this.secondName,
    this.sureName,
    this.enFirstName,
    this.enSecondName,
    this.enSureName,
    this.personalId,
    this.dateOfBirth,
    this.sex,
    this.independent,
    this.patientableId,
    this.patientableType,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });
  int? id;
  String? firstName;
  String? secondName;
  String? sureName;
  String? enFirstName;
  String? enSecondName;
  String? enSureName;
  String? personalId;
  String? dateOfBirth;
  String? sex;
  int? independent;
  int? patientableId;
  String? patientableType;
  int? active;
  Null? createdAt;
  Null? updatedAt;
  Pivot? pivot;

  Owners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    sureName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSureName = json['en_sure_name'];
    personalId = json['personal_id'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    independent = json['independent'];
    patientableId = json['patientable_id'];
    patientableType = json['patientable_type'];
    active = json['active'];
    createdAt = null;
    updatedAt = null;
    if (json['pivot'] != null) {
      pivot = Pivot.fromJson(json['pivot']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['second_name'] = secondName;
    _data['sure_name'] = sureName;
    _data['en_first_name'] = enFirstName;
    _data['en_second_name'] = enSecondName;
    _data['en_sure_name'] = enSureName;
    _data['personal_id'] = personalId;
    _data['date_of_birth'] = dateOfBirth;
    _data['sex'] = sex;
    _data['independent'] = independent;
    _data['patientable_id'] = patientableId;
    _data['patientable_type'] = patientableType;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pivot'] = pivot?.toJson();
    return _data;
  }
}
