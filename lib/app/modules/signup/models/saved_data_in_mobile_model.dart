import 'package:shs108private/app/global/models/getdatamode.dart';

class SavedDataModel {
  Doctor? doctor;
  List<GetDataModel?>? medicalSpecialties;
  List<GetDataModel?>? doctorTitles;
  List<DoctorCertificates>? doctorCertificates;
  List<Memberships>? memberships;
  List<Treatments>? treatments;
  List<DoctorDescription>? doctorDescription;
  List<TrainingPrograms>? trainingPrograms;
  Setting? setting;
  List<Phones>? phones;
  List<Emails>? emails;
  List<Images>? images;
  String? imageAvatar;
  String? imageCover;

  SavedDataModel({
    this.imageAvatar,
    this.imageCover,
    this.images,
    this.doctor,
    this.medicalSpecialties,
    this.doctorTitles,
    this.doctorCertificates,
    this.memberships,
    this.treatments,
    this.doctorDescription,
    this.trainingPrograms,
    this.setting,
    this.phones,
    this.emails,
  });

  SavedDataModel.fromJson(Map<String, dynamic>? json) {
    doctor = json?['doctor'] != null ? Doctor.fromJson(json?['doctor']) : null;

    if (json?['doctor_titles'] != null) {
      doctorTitles = <GetDataModel>[];
      json?['doctor_titles'].forEach((v) {
        doctorTitles?.add(GetDataModel.fromJson(v));
      });
    }
    if (json?['medical_specialties'] != null) {
      medicalSpecialties = <GetDataModel>[];
      json?['medical_specialties'].forEach((v) {
        medicalSpecialties?.add(GetDataModel.fromJson(v));
      });
    }
    if (json?['doctor_certificates'] != null) {
      doctorCertificates = <DoctorCertificates>[];
      json?['doctor_certificates'].forEach((v) {
        doctorCertificates?.add(DoctorCertificates.fromJson(v));
      });
    }

    if (json?['memberships'] != null) {
      memberships = <Memberships>[];
      json?['memberships'].forEach((v) {
        memberships?.add(Memberships.fromJson(v));
      });
    }
    if (json?['images'] != null) {
      images = <Images>[];
      json?['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }

    if (json?['treatments'] != null) {
      treatments = <Treatments>[];
      json?['treatments'].forEach((v) {
        treatments?.add(Treatments.fromJson(v));
      });
    }

    if (json?['doctor_description'] != null) {
      doctorDescription = <DoctorDescription>[];
      json?['doctor_description'].forEach((v) {
        doctorDescription?.add(DoctorDescription.fromJson(v));
      });
    }
    if (json?['training_programs'] != null) {
      trainingPrograms = <TrainingPrograms>[];
      json?['training_programs'].forEach((v) {
        trainingPrograms?.add(TrainingPrograms.fromJson(v));
      });
    }
    if (json?['phones'] != null) {
      phones = <Phones>[];
      json?['phones'].forEach((v) {
        if (v["phone"] != null) {
          phones?.add(Phones.fromJson(v));
        }
      });
    }

    if (json?['emails'] != null) {
      emails = <Emails>[];
      json?['emails'].forEach((v) {
        if (v["email"] != null) {
          if (v["email"] != '') {
            emails?.add(Emails.fromJson(v));
          }
        }
      });
    }
    imageAvatar = json?['image_avatar'];
    imageCover = json?['image_cover'];

    setting =
        json?['setting'] != null ? Setting.fromJson(json?['setting']) : null;
  }
  // ignore: unused_element
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor?.toJson();
    }

    if (doctorTitles != null) {
      data['doctor_titles'] = doctorTitles?.map((v) => v?.toJson()).toList();
    }
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties?.map((v) => v?.toJson()).toList();
    }

    if (doctorCertificates != null) {
      data['doctor_certificates'] =
          doctorCertificates?.map((v) => v.toJson()).toList();
    }
    if (memberships != null) {
      data['memberships'] = memberships?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images?.map((v) => v.toJson()).toList();
    }

    if (treatments != null) {
      data['treatments'] = treatments?.map((v) => v.toJson()).toList();
    }

    if (doctorDescription != null) {
      data['doctor_description'] =
          doctorDescription?.map((v) => v.toJson()).toList();
    }
    if (trainingPrograms != null) {
      data['training_programs'] =
          trainingPrograms?.map((v) => v.toJson()).toList();
    }
    // ignore: prefer_is_empty
    if (phones != null && phones?.length != 0) {
      data['phones'] = phones?.map((v) => v.toJson()).toList();
    } else {
      data['phones'] = [];
    }
    // ignore: prefer_is_empty
    if (emails != null && emails?.length != 0) {
      data['emails'] = emails?.map((v) => v.toJson()).toList();
    } else {
      data['emails'] = [];
    }

    if (setting != null) {
      data['setting'] = setting?.toJson();
    }
    data['image_avatar'] = imageAvatar;
    data['image_cover'] = imageCover;

    return data;
  }

  Map<String, dynamic>? toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor?.toJsonPost();
    }

    if (doctorTitles != null) {
      data['doctor_titles'] =
          doctorTitles?.map((v) => v?.toJsonPost()).toList();
    }
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties?.map((v) => v?.toJsonPost()).toList();
    }

    if (doctorCertificates != null) {
      data['doctor_certificates'] =
          doctorCertificates?.map((v) => v.toJsonPost()).toList();
    }
    if (memberships != null) {
      data['memberships'] = memberships?.map((v) => v.toJsonPost()).toList();
    }

    if (treatments != null) {
      data['treatments'] = treatments?.map((v) => v.toJsonPost()).toList();
    }

    if (doctorDescription != null) {
      data['doctor_description'] =
          doctorDescription?.map((v) => v.toJsonPost()).toList();
    }
    if (trainingPrograms != null) {
      data['training_programs'] =
          trainingPrograms?.map((v) => v.toJsonPost()).toList();
    }

    // ignore: prefer_is_empty
    if (phones != null && phones?.length != 0) {
      data['phones'] = phones?.map((v) {
        return v.toJsonPost();
      }).toList();
    } else {
      data['phones'] = [];
    }

    // ignore: prefer_is_empty
    if (emails != null && emails?.length != 0) {
      data['emails'] = emails?.map((v) {
        return v.toJsonPost();
      }).toList();
    } else {
      data['emails'] = [];
    }

    if (images != null) {
      data['images'] = images?.map((v) => v.toJson()).toList();
    }

    if (setting != null) {
      data['setting'] = setting?.toJson();
    }

    return data;
  }
}

class DoctorCertificates {
  GetDataModel? universityInforms;
  GetDataModel? certificateInforms;
  String? graduationYear;
  bool? selectedOtherUniversity;
  bool? selectedOtherCertificate;

  DoctorCertificates({
    this.selectedOtherUniversity,
    this.selectedOtherCertificate,
    this.universityInforms,
    this.certificateInforms,
    this.graduationYear,
  });
  DoctorCertificates.fromJson(Map<String, dynamic>? json) {
    selectedOtherUniversity = json?["selectedOtherUniversity"];
    selectedOtherCertificate = json?["selectedOtherCertificate"];
    universityInforms = GetDataModel.fromJson(json?["universityInforms"]);
    certificateInforms = GetDataModel.fromJson(json?["certificateInforms"]);
    graduationYear = json?["graduationYear"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["selectedOtherUniversity"] = selectedOtherUniversity;
    data["selectedOtherCertificate"] = selectedOtherCertificate;
    data["universityInforms"] = universityInforms?.toJson();
    data["certificateInforms"] = certificateInforms?.toJson();
    data["graduationYear"] = graduationYear;
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    if (universityInforms?.other != null && certificateInforms?.other != null) {
      return {
        "other_certificate": "${certificateInforms?.other}",
        "other_university": "${universityInforms?.other}",
        "graduation_year": graduationYear
      };
    } else if (universityInforms?.other == null &&
        certificateInforms?.other != null) {
      return {
        "other_certificate": "${certificateInforms?.other}",
        "university_id": universityInforms?.id,
        "graduation_year": graduationYear
      };
    } else if (universityInforms?.other != null &&
        certificateInforms?.other == null) {
      return {
        "certificate_id": certificateInforms?.id,
        "other_university": "${universityInforms?.other}",
        "graduation_year": graduationYear
      };
    } else {
      return {
        "certificate_id": certificateInforms?.id,
        "university_id": universityInforms?.id,
        "graduation_year": graduationYear,
      };
    }
  }
}

class Memberships {
  GetDataModel? organizationsMemberships;
  bool? selectedOther;

  Memberships({
    this.organizationsMemberships,
    this.selectedOther,
  });
  Memberships.fromJson(Map<String, dynamic> json) {
    selectedOther = json["selectedOther"];
    organizationsMemberships =
        GetDataModel.fromJson(json["organizationsMemberships"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["selectedOther"] = selectedOther;
    data["organizationsMemberships"] = organizationsMemberships?.toJson();
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    if (organizationsMemberships?.other != null) {
      return {
        "other": "${organizationsMemberships?.other}",
      };
    } else {
      return {
        "id": organizationsMemberships?.id,
      };
    }
  }
}

class Treatments {
  String? name;
  Treatments({this.name});
  Treatments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    return {"name": "$name"};
  }
}

class Doctor {
  String? registrationNo;
  String? username;

  Doctor({this.registrationNo, this.username});

  Doctor.fromJson(Map<String, dynamic> json) {
    registrationNo = json['registration_no'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registration_no'] = registrationNo;
    data['username'] = username;
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registration_no'] = registrationNo;
    data['username'] = username;
    return data;
  }
}

class DoctorDescription {
  String? languageCodeAr;
  String? languageCodeEn;
  String? experiences;
  String? descriptions;
  DoctorDescription({
    this.languageCodeAr,
    this.languageCodeEn,
    this.experiences,
    this.descriptions,
  });
  DoctorDescription.fromJson(Map<String, dynamic> json) {
    if (json['language_code'] == 'ar') {
      languageCodeAr = json['language_code'];
      experiences = json['experiences'];
    }
    if (json['language_code'] == 'en') {
      languageCodeEn = json['language_code'];
      experiences = json['experiences'];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (languageCodeAr == 'ar') {
      data['language_code'] = languageCodeAr;
      data['experiences'] = experiences;
    }
    if (languageCodeEn == 'en') {
      data['language_code'] = languageCodeEn;
      data['experiences'] = experiences;
    }
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (languageCodeAr == 'ar') {
      data['language_code'] = languageCodeAr;
      data['experiences'] = experiences;
    }
    if (languageCodeEn == 'en') {
      data['language_code'] = languageCodeEn;
      data['experiences'] = experiences;
    }
    return data;
  }
}

class TrainingPrograms {
  String? name;
  String? date;
  String? organization;
  String? duration;
  CountryModel? country;
  TrainingPrograms({
    this.country,
    this.date,
    this.name,
    this.duration,
    this.organization,
  });

  TrainingPrograms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    organization = json['from'];
    date = json['date'];
    country = CountryModel.fromJson(json['country']);
    duration = json['duration'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['from'] = organization;
    data['date'] = date;
    data['country'] = country?.toJson();
    data['duration'] = duration;
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['from'] = organization;
    data['date'] = date;
    data['country_id'] = country?.id;
    data['duration'] = duration;
    return data;
  }
}

class Phones {
  String? phone;
  Phones({this.phone});
  Phones.fromJson(Map<String, dynamic> json) {
    if (json['phone'] != null) {
      if (json['phone'] != '') {
        if (json['phone'].toString().contains('+964')) {
          phone = json['phone'].toString().replaceAll('+964', '0');
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phone != null) {
      if (phone != '') {
        if (phone.toString().startsWith('0')) {
          data["phone"] = phone.toString().replaceAll('0', '+964');
        }
      }
    }
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phone != null) {
      if (phone != '') {
        if (phone.toString().startsWith('0')) {
          data['phone'] = phone.toString().replaceAll('0', '+964');
        }
      }
    }
    return data;
  }
}

class Emails {
  String? email;
  Emails({this.email});
  Emails.fromJson(Map<String, dynamic> json) {
    if (json['email'] != null) {
      if (json['email'] != '') {
        email = json['email'];
      }
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }

  Map<String, dynamic> toJsonPost() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) {
      if (email != '') {
        data['email'] = email;
      }
    }
    return data;
  }
}

class Setting {
  int? showEmail;
  int? showPhone;
  int? showMessages;
  int? showRecommendations;
  int? showRatings;
  Setting({
    this.showEmail,
    this.showPhone,
    this.showMessages,
    this.showRecommendations,
    this.showRatings,
  });
  Setting.fromJson(Map<String, dynamic> json) {
    showEmail = json['show_email'];
    showPhone = json['show_phone'];
    showMessages = json['show_messages'];
    showRecommendations = json['show_recommendations'];
    showRatings = json['show_ratings'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['show_email'] = showEmail;
    data['show_phone'] = showPhone;
    data['show_messages'] = showMessages;
    data['show_recommendations'] = showRecommendations;
    data['show_ratings'] = showRatings;
    return data;
  }
}

class Images {
  String? image;
  String? arabicDescription;
  String? englishDescription;
  Images({
    this.image,
    this.arabicDescription,
    this.englishDescription,
  });

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    arabicDescription = json['arabic_description'];
    englishDescription = json['english_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['arabic_description'] = arabicDescription;
    data['english_description'] = englishDescription;

    return data;
  }
}

// class Description {
//   String? languageCode;
//   String? description;
//   Description({this.languageCode, this.description});
//   Description.fromJson(Map<String, dynamic> json) {
//     languageCode = json['language_code'];
//     description = json['description'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['language_code'] = languageCode;
//     data['description'] = description;
//     return data;
//   }
// }

class CheckBoxState {
  bool? value;
  final String? title;
  int? id;

  CheckBoxState({
    this.value = false,
    this.title,
    this.id,
  });
}
