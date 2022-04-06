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
import 'package:shs108private/app/global/methods/api_provider.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/main.dart';

import '../doctor_model.dart';

class DoctorProvider {
  void getDoctorProfile({
    Function()? beforeSend,
    Function(Doctor doctor)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    String baseUrl = "$url/doctor_profile";
    ApiProvider(
      url: baseUrl,
      options: Options(
        method: 'GET',
        headers: {
          'Authorization': 'Bearer $savedToken',
        },
      ),
    ).get(
      beforeSend: () => {
        if (beforeSend != null)
          {
            beforeSend(),
          }
      },
      onSuccess: (data) => onSuccess!(Doctor.fromJson(data[0])),
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
