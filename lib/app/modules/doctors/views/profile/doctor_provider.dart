// import 'package:get/get.dart';
// import 'package:shs108private/app/global/strings/global_string.dart';
//
// import '../doctor_model_old.dart';
//
// class DoctorProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.defaultDecoder = (map) {
//       if (map is Map<String, dynamic>) return Doctor.fromJson(map);
//       if (map is List) return map.map((item) => Doctor.fromJson(item)).toList();
//     };
//     httpClient.baseUrl = url;
//   }
//
//   Future<Doctor?> getDoctor(int id) async {
//     final response = await get('doctor_profile/$id');
//     return response.body;
//   }
// }

import 'package:dio/dio.dart';
import 'package:shs108private/app/global/strings/global_string.dart';

import '../../doctor_model.dart';
import 'api_provider.dart';

class DoctorProvider {
  // final index;

  String apiKey = 'appid=2a756439d0ce74a5f7ff15d526d80cff';

  DoctorProvider();

  void getDoctorProfile({
    Function()? beforeSend,
    Function(Doctor doctor)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    String baseUrl = "$url/public_doctor_profile/1";
    ApiProvider(
      url: baseUrl,
    ).get(
      beforeSend: () => {
        if (beforeSend != null)
          {
            beforeSend(),
          }
      },
      onSuccess: (data) => {
        print("*********${data[0]}***************"),
        print(
            "Doctor.fromJson(data[0])${Doctor.fromJson(data[0]).registrationNo}"),
        onSuccess!(
          // Doctor(),
          Doctor.fromJson(data[0]),
        ),
      },
      onError: (error) => {
        if (onError != null)
          {
            if (error is DioError)
              print('هذا هو الايررور يابه = ${error.message}'),
            onError(error),
          }
      },
    );
  }
}
