import 'dart:convert';

import 'package:flutter/material.dart';

class PatientUser {
  dynamic success;
  dynamic data;
  String? email;
  String? phone;

  PatientUser({
    this.success,
    this.data,
    this.phone,
    this.email,
  });
  static PatientUser? fromMap(dynamic map) {
    if (map == null) {
      return null;
    }
    if (map['data'].toString().contains('phone')) {
      debugPrint("${map['data']['phone'][0]}");
      return PatientUser(data: map['data']['phone'][0]);
    } else if (map.toString().contains('email')) {
      debugPrint("${map['data']['email'][0]}");
      return PatientUser(data: map['data']['email'][0]);
    } else {
      return PatientUser(
        success: map['success'],
        data: PatientUser.fromJson(jsonEncode(map['data'])),
      );
    }
  }

  static PatientUser? fromJson(String source) => fromMap(json.decode(source));
}

class Data {
  Patient? patient;
  User? user;
  String? token;

  Data({
    this.patient,
    this.user,
    this.token,
  });
  static Data? fromMap(dynamic map) {
    if (map == null) {
      return null;
    }
    return Data(
      patient: Patient.fromJson(jsonEncode(map['patient'])),
      user: User.fromJson(jsonEncode(map['user'])),
      token: map['token'],
    );
  }

  static Data? fromJson(String source) => fromMap(json.decode(source));
}

class Patient {
  String? firstName;
  String? secondName;
  String? sureName;
  String? personalId;
  String? dateOfBirth;
  String? sex;
  int? independent;
  String? enFirstName;
  String? enSecondName;
  String? enSureName;
  String? updatedAt;
  String? createdAt;
  int? id;

  Patient({
    this.firstName,
    this.secondName,
    this.sureName,
    this.personalId,
    this.dateOfBirth,
    this.sex,
    this.independent,
    this.enFirstName,
    this.enSecondName,
    this.enSureName,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  static Patient? fromMap(dynamic map) {
    if (map == null) {
      return null;
    }

    return Patient(
      firstName: map['first_name'],
      secondName: map['second_name'],
      sureName: map['sure_name'],
      personalId: map['personal_id'],
      dateOfBirth: map['date_of_birth'],
      sex: map['sex'],
      independent: map['independent'],
      enFirstName: map['en_first_name'],
      enSecondName: map['en_second_name'],
      enSureName: map['en_sure_name'],
      updatedAt: map['updated_at'],
      createdAt: map['created_at'],
      id: map['id'],
    );
  }

  static Patient? fromJson(String source) => fromMap(json.decode(source));
}

class User {
  int? userableId;
  String? userableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  User({
    this.userableId,
    this.userableType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  static User? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return User(
      userableId: map['userableId'],
      userableType: map['userableType'],
      updatedAt: map['updatedAt'],
      createdAt: map['createdAt'],
      id: map['id'],
    );
  }

  static User? fromJson(String source) => fromMap(json.decode(source));
}
