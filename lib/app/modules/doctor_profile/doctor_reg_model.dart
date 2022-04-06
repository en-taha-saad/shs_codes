
class DoctorReg {
  DoctorR? doctor;
  List<DoctorTitles>? doctorTitles;
  List<DoctorDescription>? doctorDescription;
  Setting? setting;
  List<DoctorCertificates>? doctorCertificates;
  List<TrainingPrograms>? trainingPrograms;
  List<Memberships>? memberships;
  List<Treatments>? treatments;
  List<MedicalSpecialties>? medicalSpecialties;

  DoctorReg(
      {this.doctor,
      this.doctorTitles,
      this.doctorDescription,
      this.setting,
      this.doctorCertificates,
      this.trainingPrograms,
      this.memberships,
      this.treatments,
      this.medicalSpecialties});

  DoctorReg.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'] != null ? DoctorR?.fromJson(json['doctor']) : null;
    if (json['doctor_titles'] != null) {
      doctorTitles = <DoctorTitles>[];
      json['doctor_titles'].forEach((v) {
        doctorTitles!.add(DoctorTitles.fromJson(v));
      });
    }
    if (json['doctor_description'] != null) {
      doctorDescription = <DoctorDescription>[];
      json['doctor_description'].forEach((v) {
        doctorDescription!.add(DoctorDescription.fromJson(v));
      });
    }
    setting = json['setting'] != null ? Setting?.fromJson(json['setting']) :
    null;
    if (json['doctor_certificates'] != null) {
      doctorCertificates = <DoctorCertificates>[];
      json['doctor_certificates'].forEach((v) {
        doctorCertificates!.add(DoctorCertificates.fromJson(v));
      });
    }
    if (json['training_programs'] != null) {
      trainingPrograms = <TrainingPrograms>[];
      json['training_programs'].forEach((v) {
        trainingPrograms!.add(TrainingPrograms.fromJson(v));
      });
    }
    if (json['memberships'] != null) {
      memberships = <Memberships>[];
      json['memberships'].forEach((v) {
        memberships!.add(Memberships.fromJson(v));
      });
    }
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments!.add(Treatments.fromJson(v));
      });
    }
    if (json['medical_specialties'] != null) {
      medicalSpecialties = <MedicalSpecialties>[];
      json['medical_specialties'].forEach((v) {
        medicalSpecialties!.add(MedicalSpecialties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (doctorTitles != null) {
      data['doctor_titles'] = doctorTitles!.map((v) => v.toJson()).toList();
    }
    if (doctorDescription != null) {
      data['doctor_description'] =
          doctorDescription!.map((v) => v.toJson()).toList();
    }
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    if (doctorCertificates != null) {
      data['doctor_certificates'] =
          doctorCertificates!.map((v) => v.toJson()).toList();
    }
    if (trainingPrograms != null) {
      data['training_programs'] =
          trainingPrograms!.map((v) => v.toJson()).toList();
    }
    if (memberships != null) {
      data['memberships'] = memberships!.map((v) => v.toJson()).toList();
    }
    if (treatments != null) {
      data['treatments'] = treatments!.map((v) => v.toJson()).toList();
    }
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorR {
  String? registrationNo;
  String? username;

  DoctorR({this.registrationNo, this.username});

  DoctorR.fromJson(Map<String, dynamic> json) {
    registrationNo = json['registration_no'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['registration_no'] = registrationNo;
    data['username'] = username;
    return data;
  }
}

class DoctorTitles {
  int? id;
  String? other;

  DoctorTitles({this.id, this.other});

  DoctorTitles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['other'] = other;
    return data;
  }
}

class DoctorDescription {
  String? languageCode;
  String? experiences;
  String? descriptions;

  DoctorDescription({this.languageCode, this.experiences, this.descriptions});

  DoctorDescription.fromJson(Map<String, dynamic> json) {
    languageCode = json['language_code'];
    experiences = json['experiences'];
    descriptions = json['descriptions'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language_code'] = languageCode;
    data['experiences'] = experiences;
    data['descriptions'] = descriptions;
    return data;
  }
}

class Setting {
  int? showEmail;
  int? showPhone;
  int? showMessages;
  int? showRecommendations;
  int? showRatings;

  Setting(
      {this.showEmail,
      this.showPhone,
      this.showMessages,
      this.showRecommendations,
      this.showRatings});

  Setting.fromJson(Map<String, dynamic> json) {
    showEmail = json['show_email'];
    showPhone = json['show_phone'];
    showMessages = json['show_messages'];
    showRecommendations = json['show_recommendations'];
    showRatings = json['show_ratings'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['show_email'] = showEmail;
    data['show_phone'] = showPhone;
    data['show_messages'] = showMessages;
    data['show_recommendations'] = showRecommendations;
    data['show_ratings'] = showRatings;
    return data;
  }
}

class DoctorCertificates {
  int? certificateId;
  String? otherCertificate;
  int? universityId;
  String? otherUniversity;
  int? graduationYear;

  DoctorCertificates(
      {this.certificateId,
      this.otherCertificate,
      this.universityId,
      this.otherUniversity,
      this.graduationYear});

  DoctorCertificates.fromJson(Map<String, dynamic> json) {
    certificateId = json['certificate_id'];
    otherCertificate = json['other_certificate'];
    universityId = json['university_id'];
    otherUniversity = json['other_university'];
    graduationYear = json['graduation_year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['certificate_id'] = certificateId;
    data['other_certificate'] = otherCertificate;
    data['university_id'] = universityId;
    data['other_university'] = otherUniversity;
    data['graduation_year'] = graduationYear;
    return data;
  }
}

class TrainingPrograms {
  String? name;
  String? from;
  String? date;
  int? countryId;
  String? duration;

  TrainingPrograms(
      {this.name, this.from, this.date, this.countryId, this.duration});

  TrainingPrograms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    from = json['from'];
    date = json['date'];
    countryId = json['country_id'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['from'] = from;
    data['date'] = date;
    data['country_id'] = countryId;
    data['duration'] = duration;
    return data;
  }
}

class Treatments {
  String? name;

  Treatments({this.name});

  Treatments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Memberships {
  int? id;
  String? other;

  Memberships({this.id, this.other});

  Memberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['other'] = other;
    return data;
  }
}

class MedicalSpecialties {
  int? id;
  String? other;

  MedicalSpecialties({this.id, this.other});

  MedicalSpecialties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['other'] = other;
    return data;
  }
}
