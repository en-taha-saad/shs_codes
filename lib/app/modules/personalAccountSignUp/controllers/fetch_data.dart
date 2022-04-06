import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';

Future<List<GetDataModel>> getData(filter, wholeUrl) async {
  var response = await Dio().get(
    wholeUrl,
    queryParameters: {"filter": filter},
  );
  final data = await jsonDecode(json.encode(response.data));

  // if (data != null) {
  return GetDataModel.fromJsonList(data);
  // }
  // return [];
}
