import 'package:dio/dio.dart';

class ApiProvider {
  final String url;
  final Map<String, dynamic>? payload;
  final Options? options;
  final dynamic data;

  ApiProvider({required this.url, this.payload, this.options, this.data});
  Dio dio = Dio();

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    dio.get(url, queryParameters: payload, options: options).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    dio
        .post(url, data: data, options: options, queryParameters: payload)
        .then((response) {
      if (onSuccess != null) {
        print("response$response");
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
