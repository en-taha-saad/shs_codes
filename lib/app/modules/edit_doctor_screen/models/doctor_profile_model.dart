class DoctorProfile {
  int? id;
  String? registrationNo;
  List<EmailsDoctor>? emails;
  List<PhonesDoctor>? phones;
  String? professionalId;
  List<DoctorTitle>? doctorTitle;
  List<Treatments>? treatments;
  List<DoctorDescription>? doctorDescription;
  Setting? setting;
  List<DoctorCertificates>? doctorCertificates;
  List<TrainingPrograms>? trainingPrograms;
  List<DropDownType>? memberships;
  List<MedicalSpecialties>? medicalSpecialties;
  List? clinics;
  List? hospitals;
  Patient? patient;
  List<OtherImages>? otherImages;
  List<ProfileImage>? profileImage;
  List<CoverImage>? coverImage;
  List? availableSchedules;

  DoctorProfile(
      {this.id,
      this.registrationNo,
      this.emails,
      this.phones,
      this.professionalId,
      this.doctorTitle,
      this.treatments,
      this.doctorDescription,
      this.setting,
      this.doctorCertificates,
      this.trainingPrograms,
      this.memberships,
      this.medicalSpecialties,
      this.clinics,
      this.hospitals,
      this.patient,
      this.otherImages,
      this.profileImage,
      this.coverImage,
      this.availableSchedules});

  DoctorProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationNo = json['registration_no'];
    if (json['emails'] != null) {
      emails = <EmailsDoctor>[];
      json['emails'].forEach((v) {
        emails?.add(EmailsDoctor.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <PhonesDoctor>[];
      json['phones'].forEach((v) {
        phones?.add(PhonesDoctor.fromJson(v));
      });
    }
    professionalId = json['professional_id'];
    if (json['doctor_title'] != null) {
      doctorTitle = <DoctorTitle>[];
      json['doctor_title'].forEach((v) {
        doctorTitle?.add(DoctorTitle.fromJson(v));
      });
    }
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments?.add(Treatments.fromJson(v));
      });
    }
    if (json['doctor_description'] != null) {
      doctorDescription = <DoctorDescription>[];
      json['doctor_description'].forEach((v) {
        doctorDescription?.add(DoctorDescription.fromJson(v));
      });
    }
    setting =
        json['setting'] != null ? Setting?.fromJson(json['setting']) : null;
    if (json['doctor_certificates'] != null) {
      doctorCertificates = <DoctorCertificates>[];
      json['doctor_certificates'].forEach((v) {
        doctorCertificates?.add(DoctorCertificates.fromJson(v));
      });
    }
    if (json['training_programs'] != null) {
      trainingPrograms = <TrainingPrograms>[];
      json['training_programs'].forEach((v) {
        trainingPrograms?.add(TrainingPrograms.fromJson(v));
      });
    }
    if (json['memberships'] != null) {
      memberships = <DropDownType>[];
      json['memberships'].forEach((v) {
        memberships?.add(DropDownType.fromJson(v));
      });
    }
    if (json['medical_specialties'] != null) {
      medicalSpecialties = <MedicalSpecialties>[];
      json['medical_specialties'].forEach((v) {
        medicalSpecialties?.add(MedicalSpecialties.fromJson(v));
      });
    }
    if (json['clinics'] != null) {
      // clinics = <Null>[];
      // json['clinics'].forEach((v) {
      //   clinics?.add(Null.fromJson(v));
      // });
    }
    if (json['hospitals'] != null) {
      // hospitals = <Null>[];
      // json['hospitals'].forEach((v) {
      //   hospitals?.add(Null.fromJson(v));
      // });
    }
    patient =
        json['patient'] != null ? Patient?.fromJson(json['patient']) : null;
    if (json['other_images'] != null) {
      otherImages = <OtherImages>[];
      json['other_images'].forEach((v) {
        otherImages?.add(OtherImages.fromJson(v));
      });
    }
    if (json['profile_image'] != null) {
      profileImage = <ProfileImage>[];
      json['profile_image'].forEach((v) {
        profileImage?.add(ProfileImage.fromJson(v));
      });
    }
    if (json['cover_image'] != null) {
      coverImage = <CoverImage>[];
      json['cover_image'].forEach((v) {
        coverImage?.add(CoverImage.fromJson(v));
      });
    }
    if (json['available_schedules'] != null) {
      // availableSchedules = <Null>[];
      // json['available_schedules'].forEach((v) {
      //   availableSchedules?.add(Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['registration_no'] = registrationNo;
    if (emails != null) {
      data['emails'] = emails?.map((v) => v.toJson()).toList();
    }
    if (phones != null) {
      data['phones'] = phones?.map((v) => v.toJson()).toList();
    }
    data['professional_id'] = professionalId;
    if (doctorTitle != null) {
      data['doctor_title'] = doctorTitle?.map((v) => v.toJson()).toList();
    }
    if (treatments != null) {
      data['treatments'] = treatments?.map((v) => v.toJson()).toList();
    }
    if (doctorDescription != null) {
      data['doctor_description'] =
          doctorDescription?.map((v) => v.toJson()).toList();
    }
    if (setting != null) {
      data['setting'] = setting?.toJson();
    }
    if (doctorCertificates != null) {
      data['doctor_certificates'] =
          doctorCertificates?.map((v) => v.toJson()).toList();
    }
    if (trainingPrograms != null) {
      data['training_programs'] =
          trainingPrograms?.map((v) => v.toJson()).toList();
    }
    if (memberships != null) {
      data['memberships'] = memberships?.map((v) => v.toJson()).toList();
    }
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties?.map((v) => v.toJson()).toList();
    }
    if (clinics != null) {
      // data['clinics'] = clinics?.map((v) => v?.toJson()).toList();
    }
    if (hospitals != null) {
      // data['hospitals'] = hospitals?.map((v) => v?.toJson()).toList();
    }
    if (patient != null) {
      data['patient'] = patient?.toJson();
    }
    if (otherImages != null) {
      data['other_images'] = otherImages?.map((v) => v.toJson()).toList();
    }
    if (profileImage != null) {
      data['profile_image'] = profileImage?.map((v) => v.toJson()).toList();
    }
    if (coverImage != null) {
      data['cover_image'] = coverImage?.map((v) => v.toJson()).toList();
    }
    if (availableSchedules != null) {
      // data['available_schedules'] =
      //     availableSchedules?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class EmailsDoctor {
  int? id;
  String? email;
  int? doctorId;
  String? createdAt;
  String? updatedAt;

  EmailsDoctor(
      {this.id, this.email, this.doctorId, this.createdAt, this.updatedAt});

  EmailsDoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    doctorId = json['doctor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['doctor_id'] = doctorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PhonesDoctor {
  int? id;
  String? phone;
  int? doctorId;
  String? createdAt;
  String? updatedAt;

  PhonesDoctor(
      {this.id, this.phone, this.doctorId, this.createdAt, this.updatedAt});

  PhonesDoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    doctorId = json['doctor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['doctor_id'] = doctorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DoctorTitle {
  int? id;
  String? name;
  ExtraInfoDoctorTitle? extraInfo;

  DoctorTitle({this.id, this.name, this.extraInfo});

  DoctorTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoDoctorTitle?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo?.toJson();
    }
    return data;
  }
}

class ExtraInfoDoctorTitle {
  int? doctorId;
  int? doctorTitleId;
  String? other;

  ExtraInfoDoctorTitle({this.doctorId, this.doctorTitleId, this.other});

  ExtraInfoDoctorTitle.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorTitleId = json['doctor_title_id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['doctor_title_id'] = doctorTitleId;
    data['other'] = other;
    return data;
  }
}

class Treatments {
  int? id;
  String? name;
  int? doctorId;
  String? createdAt;
  String? updatedAt;

  Treatments(
      {this.id, this.name, this.doctorId, this.createdAt, this.updatedAt});

  Treatments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    doctorId = json['doctor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['doctor_id'] = doctorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DoctorDescription {
  int? id;
  String? languageCode;
  String? experiences;
  dynamic descriptions;
  int? doctorId;

  DoctorDescription(
      {this.id,
      this.languageCode,
      this.experiences,
      this.descriptions,
      this.doctorId});

  DoctorDescription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    experiences = json['experiences'];
    descriptions = json['descriptions'];
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['language_code'] = languageCode;
    data['experiences'] = experiences;
    data['descriptions'] = descriptions;
    data['doctor_id'] = doctorId;
    return data;
  }
}

class Setting {
  int? id;
  int? settingableId;
  String? settingableType;
  int? showEmail;
  int? showPhone;
  int? showMessages;
  int? showRecommendations;
  int? showRatings;

  Setting(
      {this.id,
      this.settingableId,
      this.settingableType,
      this.showEmail,
      this.showPhone,
      this.showMessages,
      this.showRecommendations,
      this.showRatings});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    settingableId = json['settingable_id'];
    settingableType = json['settingable_type'];
    showEmail = json['show_email'];
    showPhone = json['show_phone'];
    showMessages = json['show_messages'];
    showRecommendations = json['show_recommendations'];
    showRatings = json['show_ratings'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['settingable_id'] = settingableId;
    data['settingable_type'] = settingableType;
    data['show_email'] = showEmail;
    data['show_phone'] = showPhone;
    data['show_messages'] = showMessages;
    data['show_recommendations'] = showRecommendations;
    data['show_ratings'] = showRatings;
    return data;
  }
}

class DoctorCertificates {
  int? id;
  int? certificateId;
  String? otherCertificate;
  int? universityId;
  String? otherUniversity;
  int? graduationYear;
  int? doctorId;
  DropDownType? university;
  DropDownType? certificate;

  DoctorCertificates({
    this.id,
    this.certificateId,
    this.otherCertificate,
    this.universityId,
    this.otherUniversity,
    this.graduationYear,
    this.doctorId,
    this.university,
    this.certificate,
  });

  DoctorCertificates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certificateId = json['certificate_id'];
    otherCertificate = json['other_certificate'];
    universityId = json['university_id'];
    otherUniversity = json['other_university'];
    graduationYear = json['graduation_year'];
    doctorId = json['doctor_id'];
    university = json['university'] != null
        ? DropDownType?.fromJson(json['university'])
        : null;
    certificate = json['certificate'] != null
        ? DropDownType?.fromJson(json['certificate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['certificate_id'] = certificateId;
    data['other_certificate'] = otherCertificate;
    data['university_id'] = universityId;
    data['other_university'] = otherUniversity;
    data['graduation_year'] = graduationYear;
    data['doctor_id'] = doctorId;
    // if (university != null) {
    //   data['university'] = university?.toJson();
    // }
    // if (certificate != null) {
    //   data['certificate'] = certificate?.toJson();
    // }
    return data;
  }
}

class DropDownType {
  int? id;
  String? name;
  ExtraInfoMembership? extraInfo;

  DropDownType({
    this.id,
    this.name,
    this.extraInfo,
  });
  DropDownType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoMembership?.fromJson(json['extra_info'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id == 1) {
      data['other'] = id;
    } else {
      data['id'] = id;
    }
    return data;
  }
}

class University {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  University({this.id, this.name, this.createdAt, this.updatedAt});

  University.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Certificate {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  Certificate({this.id, this.name, this.createdAt, this.updatedAt});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TrainingPrograms {
  int? id;
  String? name;
  String? from;
  String? date;
  int? countryId;
  int? doctorId;
  String? duration;
  Country? country;

  TrainingPrograms(
      {this.id,
      this.name,
      this.from,
      this.date,
      this.countryId,
      this.doctorId,
      this.duration,
      this.country});

  TrainingPrograms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    from = json['from'];
    date = json['date'];
    countryId = json['country_id'];
    doctorId = json['doctor_id'];
    duration = json['duration'];
    country =
        json['country'] != null ? Country?.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['from'] = from;
    data['date'] = date;
    data['country_id'] = countryId;
    data['doctor_id'] = doctorId;
    data['duration'] = duration;
    if (country != null) {
      data['country'] = country?.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? code;
  String? codeAlpha3;
  dynamic createdAt;
  dynamic updatedAt;

  Country(
      {this.id,
      this.name,
      this.code,
      this.codeAlpha3,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    codeAlpha3 = json['code_alpha_3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['code_alpha_3'] = codeAlpha3;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Memberships {
  int? id;
  String? name;
  ExtraInfoMembership? extraInfo;

  Memberships({this.id, this.name, this.extraInfo});

  Memberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoMembership?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo?.toJson();
    }
    return data;
  }
}

class ExtraInfoMembership {
  int? doctorId;
  int? membershipId;
  String? other;

  ExtraInfoMembership({this.doctorId, this.membershipId, this.other});

  ExtraInfoMembership.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    membershipId = json['membership_id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['membership_id'] = membershipId;
    data['other'] = other;
    return data;
  }
}

class MedicalSpecialties {
  int? id;
  String? name;
  ExtraInfoMedicalSpecialties? extraInfo;

  MedicalSpecialties({this.id, this.name, this.extraInfo});

  MedicalSpecialties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoMedicalSpecialties?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo?.toJson();
    }
    return data;
  }
}

class ExtraInfoMedicalSpecialties {
  int? doctorId;
  int? medicalSpecialtyId;
  String? other;

  ExtraInfoMedicalSpecialties(
      {this.doctorId, this.medicalSpecialtyId, this.other});

  ExtraInfoMedicalSpecialties.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    medicalSpecialtyId = json['medical_specialty_id'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['medical_specialty_id'] = medicalSpecialtyId;
    data['other'] = other;
    return data;
  }
}

class Patient {
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
  int? patientableId;
  String? patientableType;
  Image? image;
  User? user;

  Patient(
      {this.id,
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
      this.image,
      this.user});

  Patient.fromJson(Map<String, dynamic> json) {
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
    patientableId = json['patientable_id'];
    patientableType = json['patientable_type'];
    image = json['image'] != null ? Image?.fromJson(json['image']) : null;
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['sure_name'] = sureName;
    data['personal_id'] = personalId;
    data['en_first_name'] = enFirstName;
    data['en_second_name'] = enSecondName;
    data['en_sure_name'] = enSureName;
    data['sex'] = sex;
    data['date_of_birth'] = dateOfBirth;
    data['patientable_id'] = patientableId;
    data['patientable_type'] = patientableType;
    if (image != null) {
      data['image'] = image?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
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

class User {
  int? userableId;
  String? userableType;
  int? id;
  List<PhonesUser>? phones;
  List<EmailsUser>? emails;

  User({this.userableId, this.userableType, this.id, this.phones, this.emails});

  User.fromJson(Map<String, dynamic> json) {
    userableId = json['userable_id'];
    userableType = json['userable_type'];
    id = json['id'];
    if (json['phones'] != null) {
      phones = <PhonesUser>[];
      json['phones'].forEach((v) {
        phones?.add(PhonesUser.fromJson(v));
      });
    }
    if (json['emails'] != null) {
      emails = <EmailsUser>[];
      json['emails'].forEach((v) {
        emails?.add(EmailsUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userable_id'] = userableId;
    data['userable_type'] = userableType;
    data['id'] = id;
    if (phones != null) {
      data['phones'] = phones?.map((v) => v.toJson()).toList();
    }
    if (emails != null) {
      data['emails'] = emails?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhonesUser {
  int? id;
  String? phone;
  dynamic phoneVerifiedAt;
  int? userId;
  int? primary;
  String? createdAt;
  String? updatedAt;

  PhonesUser(
      {this.id,
      this.phone,
      this.phoneVerifiedAt,
      this.userId,
      this.primary,
      this.createdAt,
      this.updatedAt});

  PhonesUser.fromJson(Map<String, dynamic> json) {
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

class EmailsUser {
  int? id;
  String? email;
  dynamic emailVerifiedAt;
  int? userId;
  int? primary;
  String? createdAt;
  String? updatedAt;

  EmailsUser(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.userId,
      this.primary,
      this.createdAt,
      this.updatedAt});

  EmailsUser.fromJson(Map<String, dynamic> json) {
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

class OtherImages {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  int? isCover;
  String? createdAt;
  String? updatedAt;
  List<ImageDescriptions>? imageDescriptions;

  OtherImages(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.isCover,
      this.createdAt,
      this.updatedAt,
      this.imageDescriptions});

  OtherImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    isCover = json['is_cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['image_descriptions'] != null) {
      imageDescriptions = <ImageDescriptions>[];
      json['image_descriptions'].forEach((v) {
        imageDescriptions?.add(ImageDescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['imageable_id'] = imageableId;
    data['imageable_type'] = imageableType;
    data['is_profile'] = isProfile;
    data['is_cover'] = isCover;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (imageDescriptions != null) {
      data['image_descriptions'] =
          imageDescriptions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageDescriptions {
  int? id;
  String? languageCode;
  String? description;
  int? imageId;
  String? createdAt;
  String? updatedAt;

  ImageDescriptions(
      {this.id,
      this.languageCode,
      this.description,
      this.imageId,
      this.createdAt,
      this.updatedAt});

  ImageDescriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    description = json['description'];
    imageId = json['image_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['language_code'] = languageCode;
    data['description'] = description;
    data['image_id'] = imageId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProfileImage {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  int? isCover;
  String? createdAt;
  String? updatedAt;
  List? imageDescriptions;

  ProfileImage(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.isCover,
      this.createdAt,
      this.updatedAt,
      this.imageDescriptions});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    isCover = json['is_cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['image_descriptions'] != null) {
      // imageDescriptions = <Null>[];
      // json['image_descriptions'].forEach((v) {
      //   imageDescriptions?.add(Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['imageable_id'] = imageableId;
    data['imageable_type'] = imageableType;
    data['is_profile'] = isProfile;
    data['is_cover'] = isCover;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (imageDescriptions != null) {
      // data['image_descriptions'] =
      //     imageDescriptions?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class CoverImage {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  int? isCover;
  String? createdAt;
  String? updatedAt;
  List? imageDescriptions;

  CoverImage(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.isCover,
      this.createdAt,
      this.updatedAt,
      this.imageDescriptions});

  CoverImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    isCover = json['is_cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['image_descriptions'] != null) {
      // imageDescriptions = <Null>[];
      // json['image_descriptions'].forEach((v) {
      //   imageDescriptions?.add(Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['imageable_id'] = imageableId;
    data['imageable_type'] = imageableType;
    data['is_profile'] = isProfile;
    data['is_cover'] = isCover;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (imageDescriptions != null) {
      // data['image_descriptions'] =
      //     imageDescriptions?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}
