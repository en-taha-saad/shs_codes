import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/api_provider.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import '../doctor_model.dart';

class UniversitiesProvider extends GetConnect {
  void getUniversities({
    Function()? beforeSend,
    Function(List<University> universities)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    String baseUrl = "$url/universities";
    ApiProvider(url: baseUrl, ).get(
      beforeSend: () => {
        if (beforeSend != null)
          {
            beforeSend(),
          }
      },
      onSuccess: (data) => {
        print('هايه الداتا يابه  = $data'),
        print('هايه نوع الداتا يابه  = ${data.runtimeType}'),
        onSuccess!(
          University.fromJsonList(data),
        ),
      },
      onError: (error) => {
        if (onError != null)
          {
            print('هذا هو الايررور يابه = $error'),
            onError(error),

          }
      },
    );
  }
}



