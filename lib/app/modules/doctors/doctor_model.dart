class Doctor {
  int? id;
  String? registrationNo;
  List<Emails>? emails;
  String? professionalId;
  List<DoctorTitle>? doctorTitle;
  List<Phones>? phones;
  List<Treatments>? treatments;
  List<DoctorDescription>? doctorDescription;
  Setting? setting;
  List<DoctorCertificates>? doctorCertificates;
  List<TrainingPrograms>? trainingPrograms;
  List<Memberships>? memberships;
  List<MedicalSpecialties>? medicalSpecialties;
  List<Clinics>? clinics;
  List<Hospitals>? hospitals;
  Patient? patient;
  List<OtherImages>? otherImages;
  List<ProfileImage>? profileImage;
  List<CoverImage>? coverImage;
  List<AvailableSchedules>? availableSchedules;

  Doctor({
    this.id,
    this.registrationNo,
    this.emails,
    this.professionalId,
    this.doctorTitle,
    this.phones,
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
    this.availableSchedules,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationNo = json['registration_no'];
    if (json['emails'] != null) {
      emails = <Emails>[];
      json['emails'].forEach((v) {
        emails!.add(Emails.fromJson(v));
      });
    }
    professionalId = json['professional_id'];
    if (json['doctor_title'] != null) {
      doctorTitle = <DoctorTitle>[];
      json['doctor_title'].forEach((v) {
        doctorTitle!.add(DoctorTitle.fromJson(v));
      });
    }
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments!.add(Treatments.fromJson(v));
      });
    }
    if (json['doctor_description'] != null) {
      doctorDescription = <DoctorDescription>[];
      json['doctor_description'].forEach((v) {
        doctorDescription!.add(DoctorDescription.fromJson(v));
      });
    }
    setting =
        json['setting'] != null ? Setting?.fromJson(json['setting']) : null;
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
    if (json['medical_specialties'] != null) {
      medicalSpecialties = <MedicalSpecialties>[];
      json['medical_specialties'].forEach((v) {
        medicalSpecialties!.add(MedicalSpecialties.fromJson(v));
      });
    }
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
    if (json['hospitals'] != null) {
      hospitals = <Hospitals>[];
      json['hospitals'].forEach((v) {
        hospitals!.add(Hospitals.fromJson(v));
      });
    }
    patient =
        json['patient'] != null ? Patient?.fromJson(json['patient']) : null;
    if (json['other_images'] != null) {
      otherImages = <OtherImages>[];
      json['other_images'].forEach((v) {
        otherImages!.add(OtherImages.fromJson(v));
      });
    }
    if (json['profile_image'] != null) {
      profileImage = <ProfileImage>[];
      json['profile_image'].forEach((v) {
        profileImage!.add(ProfileImage.fromJson(v));
      });
    }
    if (json['cover_image'] != null) {
      coverImage = <CoverImage>[];
      json['cover_image'].forEach((v) {
        coverImage!.add(CoverImage.fromJson(v));
      });
    }

    if (json['available_schedules'] != null) {
      availableSchedules = <AvailableSchedules>[];
      json['available_schedules'].forEach((v) {
        availableSchedules!.add(AvailableSchedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['registration_no'] = registrationNo;
    if (emails != null) {
      data['emails'] = emails!.map((v) => v.toJson()).toList();
    }
    data['professional_id'] = professionalId;
    if (doctorTitle != null) {
      data['doctor_title'] = doctorTitle!.map((v) => v.toJson()).toList();
    }
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    if (treatments != null) {
      data['treatments'] = treatments!.map((v) => v.toJson()).toList();
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
    if (medicalSpecialties != null) {
      data['medical_specialties'] =
          medicalSpecialties!.map((v) => v.toJson()).toList();
    }
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    if (hospitals != null) {
      data['hospitals'] = hospitals!.map((v) => v.toJson()).toList();
    }
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (otherImages != null) {
      data['other_images'] = otherImages!.map((v) => v.toJson()).toList();
    }
    if (profileImage != null) {
      data['profile_image'] = profileImage!.map((v) => v.toJson()).toList();
    }
    if (availableSchedules != null) {
      data['available_schedules'] =
          availableSchedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorTitle {
  int? id;
  String? name;
  ExtraInfoDoctor? extraInfo;

  DoctorTitle({this.id, this.name, this.extraInfo});

  DoctorTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoDoctor?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo!.toJson();
    }
    return data;
  }
}

class ExtraInfoDoctor {
  int? doctorId;
  int? doctorTitleId;
  String? other;

  ExtraInfoDoctor({this.doctorId, this.doctorTitleId, this.other});

  ExtraInfoDoctor.fromJson(Map<String, dynamic> json) {
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
  dynamic createdAt;
  dynamic updatedAt;

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
  String? descriptions;
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
  University? university;
  Certificate? certificate;

  DoctorCertificates(
      {this.id,
      this.certificateId,
      this.otherCertificate,
      this.universityId,
      this.otherUniversity,
      this.graduationYear,
      this.doctorId,
      this.university,
      this.certificate});

  DoctorCertificates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certificateId = json['certificate_id'];
    otherCertificate = json['other_certificate'];
    universityId = json['university_id'];
    otherUniversity = json['other_university'];
    graduationYear = json['graduation_year'];
    doctorId = json['doctor_id'];
    university = json['university'] != null
        ? University?.fromJson(json['university'])
        : null;
    certificate = json['certificate'] != null
        ? Certificate?.fromJson(json['certificate'])
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
    if (university != null) {
      data['university'] = university!.toJson();
    }
    if (certificate != null) {
      data['certificate'] = certificate!.toJson();
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
      data['country'] = country!.toJson();
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

class ExtraInfoMemberShip {
  int? doctorId;
  int? membershipId;
  dynamic other;

  ExtraInfoMemberShip({this.doctorId, this.membershipId, this.other});

  ExtraInfoMemberShip.fromJson(Map<String, dynamic> json) {
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

class ExtraInfoMedicalSpec {
  int? doctorId;
  int? medicalSpecialtyId;
  String? other;

  ExtraInfoMedicalSpec({this.doctorId, this.medicalSpecialtyId, this.other});

  ExtraInfoMedicalSpec.fromJson(Map<String, dynamic> json) {
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

class Clinics {
  int? id;
  String? name;
  String? about;
  DoctorClinicInfo? doctorClinicInfo;
  List<Locations>? locations;

  Clinics(
      {this.id, this.name, this.about, this.doctorClinicInfo, this.locations});

  Clinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    doctorClinicInfo = json['doctor_clinic_info'] != null
        ? DoctorClinicInfo?.fromJson(json['doctor_clinic_info'])
        : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['about'] = about;
    if (doctorClinicInfo != null) {
      data['doctor_clinic_info'] = doctorClinicInfo!.toJson();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorClinicInfo {
  int? doctorId;
  int? clinicId;
  int? affiliationId;
  dynamic other;
  int? showInMainPage;
  int? confirm;
  String? affiliationName;

  DoctorClinicInfo(
      {this.doctorId,
      this.clinicId,
      this.affiliationId,
      this.other,
      this.showInMainPage,
      this.confirm,
      this.affiliationName});

  DoctorClinicInfo.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
    affiliationId = json['affiliation_id'];
    other = json['other'];
    showInMainPage = json['show_in_main_page'];
    confirm = json['confirm'];
    affiliationName = json['affiliation_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['clinic_id'] = clinicId;
    data['affiliation_id'] = affiliationId;
    data['other'] = other;
    data['show_in_main_page'] = showInMainPage;
    data['confirm'] = confirm;
    data['affiliation_name'] = affiliationName;
    return data;
  }
}

class Locations {
  int? id;
  double? latitude;
  double? longitude;
  String? name;
  int? locationableId;
  String? locationableType;
  int? addressId;

  Locations(
      {this.id,
      this.latitude,
      this.longitude,
      this.name,
      this.locationableId,
      this.locationableType,
      this.addressId});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    locationableId = json['locationable_id'];
    locationableType = json['locationable_type'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['locationable_id'] = locationableId;
    data['locationable_type'] = locationableType;
    data['address_id'] = addressId;
    return data;
  }
}

class Hospitals {
  int? id;
  String? name;
  String? about;
  dynamic createdAt;
  dynamic updatedAt;
  DoctorHospitalInfo? doctorHospitalInfo;
  List<Locations>? locations;

  Hospitals(
      {this.id,
      this.name,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.doctorHospitalInfo,
      this.locations});

  Hospitals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctorHospitalInfo = json['doctor_hospital_info'] != null
        ? DoctorHospitalInfo?.fromJson(json['doctor_hospital_info'])
        : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (doctorHospitalInfo != null) {
      data['doctor_hospital_info'] = doctorHospitalInfo!.toJson();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorHospitalInfo {
  int? doctorId;
  int? hospitalId;
  int? affiliationId;
  dynamic otherAffiliation;
  dynamic hospitalDepartmentId;
  dynamic otherHospitalDepartment;
  int? showInMainPage;
  int? confirm;
  String? affiliationName;

  DoctorHospitalInfo(
      {this.doctorId,
      this.hospitalId,
      this.affiliationId,
      this.otherAffiliation,
      this.hospitalDepartmentId,
      this.otherHospitalDepartment,
      this.showInMainPage,
      this.confirm,
      this.affiliationName});

  DoctorHospitalInfo.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    hospitalId = json['hospital_id'];
    affiliationId = json['affiliation_id'];
    otherAffiliation = json['other_affiliation'];
    hospitalDepartmentId = json['hospital_department_id'];
    otherHospitalDepartment = json['other_hospital_department'];
    showInMainPage = json['show_in_main_page'];
    confirm = json['confirm'];
    affiliationName = json['affiliation_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['hospital_id'] = hospitalId;
    data['affiliation_id'] = affiliationId;
    data['other_affiliation'] = otherAffiliation;
    data['hospital_department_id'] = hospitalDepartmentId;
    data['other_hospital_department'] = otherHospitalDepartment;
    data['show_in_main_page'] = showInMainPage;
    data['confirm'] = confirm;
    data['affiliation_name'] = affiliationName;
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
  User? user;
  PatientImage? patientImage;
  Patient({
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
    this.patientImage,
  });

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
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    patientImage =
        json['image'] != null ? PatientImage?.fromJson(json['image']) : null;
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
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (patientImage != null) {
      data['image'] = patientImage!.toJson();
    }

    return data;
  }
}

class PatientImage {
  PatientImage({
    this.imageUrl,
    this.imageableId,
  });
  String? imageUrl;
  int? imageableId;

  PatientImage.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl;
    _data['imageable_id'] = imageableId;
    return _data;
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

class Phones {
  int? id;
  String? phone;
  dynamic phoneVerifiedAt;
  int? userId;
  int? primary;
  dynamic createdAt;
  dynamic updatedAt;

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
  dynamic createdAt;
  dynamic updatedAt;

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

class OtherImages {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  dynamic createdAt;
  dynamic updatedAt;
  List<ImageDescriptions>? imageDescriptions;

  OtherImages(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.createdAt,
      this.updatedAt,
      this.imageDescriptions});

  OtherImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['image_descriptions'] != null) {
      imageDescriptions = <ImageDescriptions>[];
      json['image_descriptions'].forEach((v) {
        imageDescriptions!.add(ImageDescriptions.fromJson(v));
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (imageDescriptions != null) {
      data['image_descriptions'] =
          imageDescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageDescriptions {
  int? id;
  String? languageCode;
  String? description;
  int? imageId;
  dynamic createdAt;
  dynamic updatedAt;

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
  dynamic createdAt;
  dynamic updatedAt;
  List<ImageDescriptions>? imageDescriptions;

  ProfileImage({
    this.id,
    this.imageUrl,
    this.isCover,
    this.imageableId,
    this.imageableType,
    this.isProfile,
    this.createdAt,
    this.updatedAt,
    this.imageDescriptions,
  });

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
      imageDescriptions = <ImageDescriptions>[];
      json['image_descriptions'].forEach((v) {
        imageDescriptions!.add(ImageDescriptions.fromJson(v));
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
          imageDescriptions!.map((v) => v.toJson()).toList();
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
  dynamic createdAt;
  dynamic updatedAt;
  List<ImageDescriptions>? imageDescriptions;

  CoverImage({
    this.id,
    this.imageUrl,
    this.imageableId,
    this.imageableType,
    this.isProfile,
    this.isCover,
    this.createdAt,
    this.updatedAt,
    this.imageDescriptions,
  });

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
      imageDescriptions = <ImageDescriptions>[];
      json['image_descriptions'].forEach((v) {
        imageDescriptions!.add(ImageDescriptions.fromJson(v));
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
          imageDescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableSchedules {
  int? id;
  String? startDate;
  String? endDate;
  int? isRecurring;
  String? recurringWeekDay;
  String? slotTime;
  int? availableScheduleableId;
  String? availableScheduleableType;
  int? addressId;
  dynamic createdAt;
  dynamic updatedAt;
  List<AvailableTimesExceptions>? availableTimesExceptions;

  AvailableSchedules(
      {this.id,
      this.startDate,
      this.endDate,
      this.isRecurring,
      this.recurringWeekDay,
      this.slotTime,
      this.availableScheduleableId,
      this.availableScheduleableType,
      this.addressId,
      this.createdAt,
      this.updatedAt,
      this.availableTimesExceptions});

  AvailableSchedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isRecurring = json['is_recurring'];
    recurringWeekDay = json['recurring_week_day'];
    slotTime = json['slot_time'];
    availableScheduleableId = json['available_scheduleable_id'];
    availableScheduleableType = json['available_scheduleable_type'];
    addressId = json['address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['available_times_exceptions'] != null) {
      availableTimesExceptions = <AvailableTimesExceptions>[];
      json['available_times_exceptions'].forEach((v) {
        availableTimesExceptions!.add(AvailableTimesExceptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_recurring'] = isRecurring;
    data['recurring_week_day'] = recurringWeekDay;
    data['slot_time'] = slotTime;
    data['available_scheduleable_id'] = availableScheduleableId;
    data['available_scheduleable_type'] = availableScheduleableType;
    data['address_id'] = addressId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (availableTimesExceptions != null) {
      data['available_times_exceptions'] =
          availableTimesExceptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableTimesExceptions {
  int? id;
  String? startDate;
  String? endDate;
  String? reason;
  int? availableScheduleId;
  dynamic createdAt;
  dynamic updatedAt;

  AvailableTimesExceptions(
      {this.id,
      this.startDate,
      this.endDate,
      this.reason,
      this.availableScheduleId,
      this.createdAt,
      this.updatedAt});

  AvailableTimesExceptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    availableScheduleId = json['available_schedule_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['reason'] = reason;
    data['available_schedule_id'] = availableScheduleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MedicalSpecialties {
  int? id;
  String? name;
  ExtraInfoMedicalSpec? extraInfo;

  MedicalSpecialties({this.id, this.name, this.extraInfo});

  MedicalSpecialties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoMedicalSpec?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo!.toJson();
    }
    return data;
  }
}

class Memberships {
  int? id;
  String? name;
  ExtraInfoMemberShip? extraInfo;

  Memberships({this.id, this.name, this.extraInfo});

  Memberships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraInfo = json['extra_info'] != null
        ? ExtraInfoMemberShip?.fromJson(json['extra_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (extraInfo != null) {
      data['extra_info'] = extraInfo!.toJson();
    }
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
