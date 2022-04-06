import 'package:shs108private/app/global/models/getdatamode.dart';

class SavedDataModel {
  Doctor? doctor;
  GetDataModel? medicalSpecialties;
  GetDataModel? doctorTitles;
  List<DoctorCertificates>? doctorCertificates;
  List<Memberships>? memberships;
  // List<Phones> phones;
  // List<Emails> emails;
  // List<DoctorDescription> doctorDescription;
  // Setting setting;
  // List<TrainingPrograms> trainingPrograms;
  // List<Treatments> treatments;

  SavedDataModel({
    this.doctor,
    this.medicalSpecialties,
    this.doctorTitles,
    this.doctorCertificates,
    this.memberships,
    // this.phones,
    // this.emails,
    // this.doctorDescription,
    // this.setting,
    // this.trainingPrograms,
    // this.treatments,
  });

  // static SavedDataModel? fromMap(Map<String, dynamic>? map) {
  //   if (map == null) {
  //     return null;
  //   }
  //   return SavedDataModel(
  //     doctor: Doctor.fromJson(jsonEncode(map['doctor'])),
  //   );
  // }
  // static SavedDataModel? fromJson(String source) =>
  //     fromMap(json.decode(source));

  SavedDataModel.fromJson(Map<String, dynamic>? json) {
    // print("Doctor.fromJson(json?['doctor']) ${Doctor.fromJson(json?['doctor']) }");
    // doctor = json?['doctor'] != null ? Doctor.fromJson(json?['doctor']) : null;

    doctorTitles = json?['doctor_titles'] != null
        ? GetDataModel.fromJson(json?['doctor_titles'])
        : null;
    medicalSpecialties = json?['medical_specialties'] != null
        ? GetDataModel.fromJson(json?['medical_specialties'])
        : null;

    // if (json?['doctor_certificates'] != null) {
    //   doctorCertificates = <DoctorCertificates>[];
    //   json?['doctor_certificates'].forEach((v) {
    //     doctorCertificates?.add(DoctorCertificates.fromJson(v));
    //   });
    // }
    // if (json?['memberships'] != null) {
    //   memberships = <Memberships>[];
    //   json?['memberships'].forEach((v) {
    //     memberships?.add(Memberships.fromJson(v));
    //   });
    //
    //   // if (json['phones'] != null) {
    //   //   phones =  List<Phones>();
    //   //   json['phones'].forEach((v) {
    //   //     phones.add( Phones.fromJson(v));
    //   //   });
    //   // }
    //   // if (json['emails'] != null) {
    //   //   emails =  List<Emails>();
    //   //   json['emails'].forEach((v) {
    //   //     emails.add( Emails.fromJson(v));
    //   //   });
    //   // }
    //   // if (json['doctor_description'] != null) {
    //   //   doctorDescription =  List<DoctorDescription>();
    //   //   json['doctor_description'].forEach((v) {
    //   //     doctorDescription.add( DoctorDescription.fromJson(v));
    //   //   });
    //   // }
    //   // setting =
    //   //     json['setting'] != null ?  Setting.fromJson(json['setting']) : null;
    //   // if (json['training_programs'] != null) {
    //   //   trainingPrograms =  List<TrainingPrograms>();
    //   //   json['training_programs'].forEach((v) {
    //   //     trainingPrograms.add( TrainingPrograms.fromJson(v));
    //   //   });
    //   // }
    //   // }
    //   // if (json['treatments'] != null) {
    //   //   treatments =  List<Treatments>();
    //   //   json['treatments'].forEach((v) {
    //   //     treatments.add( Treatments.fromJson(v));
    //   //   });
    //   // }
    // }
  }
  // ignore: unused_element
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor?.toJson();
    }
    if (doctorTitles != null) {
      data['doctor_titles'] = doctorTitles?.toJson();
    }
    if (medicalSpecialties != null) {
      data['medical_specialties'] = medicalSpecialties?.toJson();
    }

    if (doctorCertificates != null) {
      data['doctor_certificates'] =
          doctorCertificates?.map((v) => v.toJson()).toList();
    }
    if (memberships != null) {
      data['memberships'] = memberships?.map((v) => v.toJson()).toList();
    }

    // if (phones != null) {
    //   data['phones'] = this.phones.map((v) => v.toJson()).toList();
    // }
    // if (emails != null) {
    //   data['emails'] = this.emails.map((v) => v.toJson()).toList();
    // }
    // if (doctorDescription != null) {
    //   data['doctor_description'] =
    //       this.doctorDescription.map((v) => v.toJson()).toList();
    // }
    // if (this.setting != null) {
    //   data['setting'] = this.setting.toJson();
    // }
    // if (this.trainingPrograms != null) {
    //   data['training_programs'] =
    //       this.trainingPrograms.map((v) => v.toJson()).toList();
    // }
    // if (this.treatments != null) {
    //   data['treatments'] = this.treatments.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Memberships {
  GetDataModel? organizationsMemberships;
  String? other;
  bool? selectedOther;

  Memberships({
    this.other,
    this.organizationsMemberships,
    this.selectedOther,
  });
  Memberships.fromJson(Map<String, dynamic> json) {
    selectedOther = json["selectedOther"];
    other = json["other"];
    organizationsMemberships =
        GetDataModel.fromJson(json["organizationsMemberships"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["selectedOther"] = selectedOther;
    data["other"] = other;
    data["organizationsMemberships"] = organizationsMemberships?.toJson();
    return data;
  }
}

class DoctorCertificates {
  GetDataModel? universityInforms;
  GetDataModel? certificateInforms;
  String? graduationYear;
  String? otherUniversity;
  String? otherCertificate;
  bool? selectedOtherUniversity;
  bool? selectedOtherCertificate;

  DoctorCertificates({
    this.selectedOtherUniversity,
    this.selectedOtherCertificate,
    this.otherUniversity,
    this.otherCertificate,
    this.universityInforms,
    this.certificateInforms,
    this.graduationYear,
  });
  DoctorCertificates.fromJson(Map<String, dynamic> json) {
    selectedOtherUniversity = json["selectedOtherUniversity"];
    selectedOtherCertificate = json["selectedOtherCertificate"];
    otherUniversity = json["otherUniversity"];
    otherCertificate = json["otherCertificate"];
    universityInforms = GetDataModel.fromJson(json["universityInforms"]);
    certificateInforms = GetDataModel.fromJson(json["certificateInforms"]);
    graduationYear = json["graduationYear"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["selectedOtherUniversity"] = selectedOtherUniversity;
    data["selectedOtherCertificate"] = selectedOtherCertificate;
    data["otherUniversity"] = otherUniversity;
    data["otherCertificate"] = otherCertificate;
    data["universityInforms"] = universityInforms?.toJson();
    data["certificateInforms"] = certificateInforms?.toJson();
    data["graduationYear"] = graduationYear;
    return data;
  }
}

// class MedicalSpecialties {
//   String? other;
//   int? id;
//   MedicalSpecialties({this.other, this.id});
//   MedicalSpecialties.fromJson(Map<String, dynamic> json) {
//     other = json['other'];
//     id = json['id'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['other'] = other;
//     data['id'] = id;
//     return data;
//   }
// }

class Doctor {
  String? registrationNo;
  String? username;

  Doctor({this.registrationNo, this.username});
  // static Doctor? fromMap(Map<String, dynamic>? map) {
  //   if (map == null) {
  //     return null;
  //   }
  //   return Doctor(
  //     registrationNo: map['registrationNo'],
  //     username: map['username'],
  //   );
  // }
  // static Doctor? fromJson(String source) => fromMap(json.decode(source));

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
}

// class DoctorTitles {
//   String? other;
//   int? id;
//   DoctorTitles({this.other, this.id});
//   DoctorTitles.fromJson(Map<String, dynamic> json) {
//     other = json['other'];
//     id = json['id'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['other'] = other;
//     data['id'] = id;
//     return data;
//   }
// }


// class Phones {
//   String phone;
//   Phones({this.phone});
//   Phones.fromJson(Map<String, dynamic> json) {
//     phone = json['phone'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['phone'] = this.phone;
//     return data;
//   }
// }

// class Emails {
//   String email;
//   Emails({this.email});
//   Emails.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['email'] = this.email;
//     return data;
//   }
// }

// class DoctorDescription {
//   String languageCode;
//   String experiences;
//   String descriptions;
//   DoctorDescription({this.languageCode, this.experiences, this.descriptions});
//   DoctorDescription.fromJson(Map<String, dynamic> json) {
//     languageCode = json['language_code'];
//     experiences = json['experiences'];
//     descriptions = json['descriptions'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['language_code'] = this.languageCode;
//     data['experiences'] = this.experiences;
//     data['descriptions'] = this.descriptions;
//     return data;
//   }
// }

// class Setting {
//   int showEmail;
//   int showPhone;
//   int showMessages;
//   int showRecommendations;
//   int showRatings;
//   Setting(
//       {this.showEmail,
//       this.showPhone,
//       this.showMessages,
//       this.showRecommendations,
//       this.showRatings});
//   Setting.fromJson(Map<String, dynamic> json) {
//     showEmail = json['show_email'];
//     showPhone = json['show_phone'];
//     showMessages = json['show_messages'];
//     showRecommendations = json['show_recommendations'];
//     showRatings = json['show_ratings'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['show_email'] = this.showEmail;
//     data['show_phone'] = this.showPhone;
//     data['show_messages'] = this.showMessages;
//     data['show_recommendations'] = this.showRecommendations;
//     data['show_ratings'] = this.showRatings;
//     return data;
//   }
// }

// class TrainingPrograms {
//   String name;
//   String from;
//   String date;
//   int countryId;
//   String duration;
//   TrainingPrograms(
//       {this.name, this.from, this.date, this.countryId, this.duration});
//   TrainingPrograms.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     from = json['from'];
//     date = json['date'];
//     countryId = json['country_id'];
//     duration = json['duration'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['name'] = this.name;
//     data['from'] = this.from;
//     data['date'] = this.date;
//     data['country_id'] = this.countryId;
//     data['duration'] = this.duration;
//     return data;
//   }
// }

// class Treatments {
//   String name;
//   Treatments({this.name});
//   Treatments.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }
