import 'extra_info.dart';

class MedicalSpecialties {
  MedicalSpecialties({
    required this.id,
    required this.name,
    required this.shsCode,
    required this.enName,
    required this.extraInfo,
  });
  int? id;
  String? name;
  String? shsCode;
  String? enName;
  ExtraInfo? extraInfo;

  MedicalSpecialties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shsCode = json['shs_code'];
    enName = json['en_name'];
    extraInfo = ExtraInfo.fromJson(json['extra_info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['shs_code'] = shsCode;
    _data['en_name'] = enName;
    _data['extra_info'] = extraInfo?.toJson();
    return _data;
  }
}
