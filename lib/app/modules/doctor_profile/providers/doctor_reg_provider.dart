import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shs108private/app/global/methods/api_provider.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/main.dart';

import '../doctor_reg_model.dart';

class DoctorRegProvider {
  void postDoctorReg({
    Function()? beforeSend,
    Function(String success)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    String baseUrl = "$url/register_doctor";
    ApiProvider(
            url: baseUrl,
            options: Options(
                headers: {
                  'Authorization': 'Be'
                      'arer $savedToken',
                  'Accept': 'application/json'
                },
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }),
            data: jsonEncode({
              'json': jsonEncode(DoctorReg(
                doctor:
                    DoctorR(registrationNo: "43613f", username: "username2"),
                doctorTitles: [
                  DoctorTitles(id: 1, other: "kk"),
                  DoctorTitles(
                    id: 2,
                  )
                ],
                doctorDescription: [
                  DoctorDescription(
                      languageCode: "ar",
                      descriptions: ""
                          "ماعنده خبرة",
                      experiences: "hello"),
                  DoctorDescription(
                      languageCode: "en",
                      descriptions: "description "
                          "english",
                      experiences: "hello")
                ],
                setting: Setting(
                    showPhone: 0,
                    showEmail: 0,
                    showMessages: 0,
                    showRecommendations: 0,
                    showRatings: 1),
                doctorCertificates: [
                  DoctorCertificates(
                      certificateId: 1,
                      otherCertificate: "طبببب",
                      universityId: 1,
                      otherUniversity: "يامعة "
                          "برلين",
                      graduationYear: 2005),
                ],
                trainingPrograms: [
                  TrainingPrograms(
                      name: "عنوان التدريب الثاني",
                      from: "مقدم من الجهة الفلانية",
                      date: "2020-07-30",
                      countryId: 100,
                      duration: "3 "
                          "days"),
                  TrainingPrograms(
                      name: "عنوان التدريب",
                      from: "مقدم "
                          "من الجهة الفلانية",
                      date: "2020-07-30",
                      countryId: 106,
                      duration: "3days"),
                ],
                memberships: [
                  Memberships(id: 1, other: "درجة غير معرفة"),
                  Memberships(id: 2)
                ],
                treatments: [
                  Treatments(name: "علاج اربعة"),
                  Treatments(
                    name: "علاج "
                        "ثلاثة",
                  )
                ],
                medicalSpecialties: [
                  MedicalSpecialties(
                    id: 2,
                  ),
                  MedicalSpecialties(id: 3)
                ],
              ).toJson())
            }).toString())
        .post(
      beforeSend: () => {
        if (beforeSend != null)
          {
            beforeSend(),
          }
      },
      onSuccess: (data) => {
        print('اني هنانه تره'),
        print('data = $data'),
        onSuccess!(
          data[0]["success"],
        ),
      },
      onError: (error) => {
        if (onError != null)
          {
            if (error is DioError) print('api error message ${error.response}'),
            onError(error),
          }
      },
    );
  }
}
