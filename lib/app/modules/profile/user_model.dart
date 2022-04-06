import 'package:shs108private/app/global/models/getdatamode.dart';

class ParentProfile {
  int? id;
  String? firstName;
  String? personalId;
  String? secondName;
  String? surName;
  String? enFirstName;
  String? enSecondName;
  String? enSurName;
  String? sex;
  DateTime? dateOfBirth;
  List<Addresses>? addresses;
  List<UserRelateds>? relateds;
  List<Handicaps>? handicaps;
  List<ChronicDiseases>? chronicDiseases;
  List<Nationalities>? nationalities;
  User? user;
  Image? image;

  ParentProfile(
      {this.id,
      this.personalId,
      this.firstName,
      this.secondName,
      this.surName,
      this.enFirstName,
      this.enSecondName,
      this.enSurName,
      this.sex,
      this.dateOfBirth,
      this.addresses,
      this.relateds,
      this.handicaps,
      this.chronicDiseases,
      this.nationalities,
      this.user,
      this.image});

  ParentProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    personalId = json['personal_id'];
    surName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSurName = json['en_sure_name'];
    sex = json['sex'];
    if (json['date_of_birth'] != null) {
      var dateList = json['date_of_birth'].toString().split('-');
      dateOfBirth = DateTime(
        int.parse(dateList[0]),
        int.parse(dateList[1]),
        int.parse(dateList[2]),
      );
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    if (json['relateds'] != null) {
      relateds = <UserRelateds>[];
      json['relateds'].forEach((v) {
        relateds!.add(UserRelateds.fromJson(v));
      });
    }
    if (json['handicaps'] != null) {
      handicaps = <Handicaps>[];
      json['handicaps'].forEach((v) {
        handicaps!.add(Handicaps.fromJson(v));
      });
    }
    if (json['chronic_diseases'] != null) {
      chronicDiseases = <ChronicDiseases>[];
      json['chronic_diseases'].forEach((v) {
        chronicDiseases!.add(ChronicDiseases.fromJson(v));
      });
    }
    if (json['nationalities'] != null) {
      nationalities = <Nationalities>[];
      json['nationalities'].forEach((v) {
        nationalities!.add(Nationalities.fromJson(v));
      });
    }
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    image = json['image'] != null ? Image?.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = surName;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSurName;
    data['sex'] = sex;
    data['date_of_birth'] = dateOfBirth;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    if (relateds != null) {
      data['relateds'] = relateds!.map((v) => v.toJson()).toList();
    }
    if (handicaps != null) {
      data['handicaps'] = handicaps!.map((v) => v.toJson()).toList();
    }
    if (chronicDiseases != null) {
      data['chronic_diseases'] =
          chronicDiseases!.map((v) => v.toJson()).toList();
    }
    if (nationalities != null) {
      data['nationalities'] = nationalities!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['image'] = image;
    return data;
  }
}

class ChildProfile {
  int? id;
  String? firstName;
  String? secondName;
  String? surName;
  String? enFirstName;
  String? enSecondName;
  String? enSurName;
  String? sex;
  String? dateOfBirth;
  List<ChildProfileRelateds>? relateds;
  Image? image;

  ChildProfile({
    this.id,
    this.firstName,
    this.secondName,
    this.surName,
    this.enFirstName,
    this.enSecondName,
    this.enSurName,
    this.sex,
    this.dateOfBirth,
    this.relateds,
    this.image,
  });

  ChildProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    surName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSurName = json['en_sure_name'];
    sex = json['sex'];
    dateOfBirth = json['date_of_birth'];
    if (json['relateds'] != null) {
      relateds = <ChildProfileRelateds>[];
      json['relateds'].forEach((v) {
        relateds!.add(ChildProfileRelateds.fromJson(v));
      });
    }
    image?.imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = surName;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSurName;
    data['sex'] = sex;
    data['date_of_birth'] = dateOfBirth;
    if (relateds != null) {
      data['relateds'] = relateds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FimaliyMemberImage {
  int? imageableId;
  int? id;
  String? imageUrl;

  FimaliyMemberImage({this.imageableId, this.imageUrl, this.id});

  FimaliyMemberImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageableId = json['imageable_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['imageable_id'] = imageableId;
    data['image_url'] = imageUrl;
    return data;
  }
}

class ChildProfileRelateds {
  int? id;
  String? firstName;
  String? secondName;
  String? surName;
  String? enFirstName;
  String? enSecondName;
  String? enSurName;
  String? personalId;
  String? dateOfBirth;
  String? sex;
  int? independent;
  int? active;
  String? createdAt;
  String? updatedAt;
  String? relation;
  List<Addresses>? addresses;
  List<GetDataModel>? handicaps;
  List<GetDataModel>? chronicDiseases;
  List<GetDataModel>? nationalities;
  User? user;
  FimaliyMemberImage? image;

  ChildProfileRelateds({
    this.id,
    this.firstName,
    this.secondName,
    this.surName,
    this.enFirstName,
    this.enSecondName,
    this.enSurName,
    this.personalId,
    this.dateOfBirth,
    this.sex,
    this.independent,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.relation,
    this.addresses,
    this.handicaps,
    this.chronicDiseases,
    this.nationalities,
    this.user,
    this.image,
  });

  ChildProfileRelateds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    surName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSurName = json['en_sure_name'];
    personalId = json['personal_id'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    independent = json['independent'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    relation = json["relation_info"]["relation"];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    if (json['handicaps'] != null) {
      handicaps = <GetDataModel>[];
      json['handicaps'].forEach((v) {
        handicaps!.add(GetDataModel.fromJson(v));
      });
    }
    if (json['chronic_diseases'] != null) {
      chronicDiseases = <GetDataModel>[];
      json['chronic_diseases'].forEach((v) {
        chronicDiseases!.add(GetDataModel.fromJson(v));
      });
    }
    if (json['nationalities'] != null) {
      nationalities = <GetDataModel>[];
      json['nationalities'].forEach((v) {
        nationalities!.add(GetDataModel.fromJson(v));
      });
    }
    user = json['user'];
    if (json['image'] != null) {
      image = FimaliyMemberImage.fromJson(json['image']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = surName;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSurName;
    data['personal_id'] = personalId;
    data['date_of_birth'] = dateOfBirth;
    data['sex'] = sex;
    data['independent'] = independent;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // if (pivot != null) {
    //   data['pivot'] = pivot!.toJson();
    // }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    if (handicaps != null) {
      data['handicaps'] = handicaps!.map((v) => v.toJson()).toList();
    }
    if (chronicDiseases != null) {
      data['chronic_diseases'] =
          chronicDiseases!.map((v) => v.toJson()).toList();
    }
    if (nationalities != null) {
      data['nationalities'] = nationalities!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    data['image'] = image;
    return data;
  }
}

class PivotChildProfile {
  int? patientId;
  int? relatedId;
  int? confirmed;
  String? relation;

  PivotChildProfile(
      {this.patientId, this.relatedId, this.confirmed, this.relation});

  PivotChildProfile.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    relatedId = json['related_id'];
    confirmed = json['confirmed'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['related_id'] = relatedId;
    data['confirmed'] = confirmed;
    data['relation'] = relation;
    return data;
  }
}

class Handicaps {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  PivotHandicaps? pivot;

  Handicaps({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  Handicaps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot =
        json['pivot'] != null ? PivotHandicaps?.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class ChronicDiseases {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  PivotChronicDiseases? pivot;

  ChronicDiseases(
      {this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  ChronicDiseases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null
        ? PivotChronicDiseases?.fromJson(json['pivot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class PivotHandicaps {
  int? patientId;
  int? handicapId;

  PivotHandicaps({this.patientId, this.handicapId});

  PivotHandicaps.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    handicapId = json['handicap_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['handicap_id'] = handicapId;
    return data;
  }
}

class PivotChronicDiseases {
  int? patientId;
  int? chronicDiseaseId;

  PivotChronicDiseases({this.patientId, this.chronicDiseaseId});

  PivotChronicDiseases.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    chronicDiseaseId = json['chronic_disease_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['chronic_disease_id'] = chronicDiseaseId;
    return data;
  }
}

class Nationalities {
  int? id;
  String? name;
  int? countryId;
  dynamic createdAt;
  dynamic updatedAt;
  PivotNationalities? pivot;

  Nationalities(
      {this.id,
      this.name,
      this.countryId,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Nationalities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null
        ? PivotNationalities?.fromJson(json['pivot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class PivotNationalities {
  int? patientId;
  int? nationalityId;

  PivotNationalities({this.patientId, this.nationalityId});

  PivotNationalities.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    nationalityId = json['nationality_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['nationality_id'] = nationalityId;
    return data;
  }
}

class Addresses {
  int? id;
  int? addressableId;
  String? addressableType;
  int? regionId;
  int? cityId;
  int? governorateId;
  int? countryId;
  String? createdAt;
  String? updatedAt;
  GetDataModel? country;
  GetDataModel? governorate;
  GetDataModel? city;
  GetDataModel? region;

  Addresses(
      {this.id,
      this.addressableId,
      this.regionId,
      this.addressableType,
      this.cityId,
      this.governorateId,
      this.countryId,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.governorate,
      this.city});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressableId = json['addressable_id'];
    addressableType = json['addressable_type'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    governorateId = json['governorate_id'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'] != null
        ? GetDataModel?.fromJson(json['country'])
        : null;
    governorate = json['governorate'] != null
        ? GetDataModel?.fromJson(json['governorate'])
        : null;
    city = json['city'] != null ? GetDataModel?.fromJson(json['city']) : null;
    region =
        json['region'] != null ? GetDataModel?.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['addressable_id'] = addressableId;
    data['addressable_type'] = addressableType;
    data['region_id'] = regionId;
    data['city_id'] = cityId;
    data['governorate_id'] = governorateId;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (governorate != null) {
      data['governorate'] = governorate!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (region != null) {
      data['region'] = region!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Governorate {
  int? id;
  String? name;

  Governorate({this.id, this.name});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Region {
  int? id;
  String? name;

  Region({this.id, this.name});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class UserRelateds {
  int? id;
  String? firstName;
  String? secondName;
  String? surName;
  dynamic enFirstName;
  dynamic enSecondName;
  dynamic enSurName;
  String? personalId;
  String? dateOfBirth;
  String? sex;
  int? independent;
  int? active;
  String? createdAt;
  String? updatedAt;
  UserPivot? pivot;

  UserRelateds(
      {this.id,
      this.firstName,
      this.secondName,
      this.surName,
      this.enFirstName,
      this.enSecondName,
      this.enSurName,
      this.personalId,
      this.dateOfBirth,
      this.sex,
      this.independent,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  UserRelateds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    surName = json['sure_name'];
    enFirstName = json['en_first_name'];
    enSecondName = json['en_second_name'];
    enSurName = json['en_sure_name'];
    personalId = json['personal_id'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    independent = json['independent'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? UserPivot?.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = surName;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSurName;
    data['personal_id'] = personalId;
    data['date_of_birth'] = dateOfBirth;
    data['sex'] = sex;
    data['independent'] = independent;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class UserPivot {
  int? patientId;
  int? relatedId;
  int? confirmed;
  String? relation;

  UserPivot({this.patientId, this.relatedId, this.confirmed, this.relation});

  UserPivot.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    relatedId = json['related_id'];
    confirmed = json['confirmed'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['related_id'] = relatedId;
    data['confirmed'] = confirmed;
    data['relation'] = relation;
    return data;
  }
}

class User {
  int? userableId;
  String? userableType;
  int? id;
  List<Phones>? phones;
  List<Emails>? emails;

  User({this.userableId, this.userableType, this.id, this.phones, this.emails});

  User.fromJson(Map<String, dynamic> json) {
    userableId = json['userable_id'];
    userableType = json['userable_type'];
    id = json['id'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
    if (json['emails'] != null) {
      emails = <Emails>[];
      json['emails'].forEach((v) {
        emails!.add(Emails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userable_id'] = userableId;
    data['userable_type'] = userableType;
    data['id'] = id;
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    if (emails != null) {
      data['emails'] = emails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  int? imageableId;
  String? imageUrl;

  Image({this.imageableId, this.imageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    imageableId = json['imageable_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageable_id'] = imageableId;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Phones {
  int? id;
  String? phone;
  dynamic phoneVerifiedAt;
  int? userId;
  int? primary;
  String? createdAt;
  String? updatedAt;

  Phones(
      {this.id,
      this.phone,
      this.phoneVerifiedAt,
      this.userId,
      this.primary,
      this.createdAt,
      this.updatedAt});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    userId = json['user_id'];
    primary = json['primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['user_id'] = userId;
    data['primary'] = primary;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Emails {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  int? userId;
  int? primary;
  String? createdAt;
  String? updatedAt;

  Emails(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.userId,
      this.primary,
      this.createdAt,
      this.updatedAt});

  Emails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userId = json['user_id'];
    primary = json['primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['user_id'] = userId;
    data['primary'] = primary;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class BarCode {
  String? success;
  String? data;

  BarCode({this.success, this.data});

  BarCode.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = data;
    return data;
  }
}
