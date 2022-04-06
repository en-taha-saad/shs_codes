import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';

Future<List<GetDataModel>> getData(filter, wholeUrl) async {
  var response = await Dio().get(
    wholeUrl,
    queryParameters: {"filter": filter},
  );
  final data = await jsonDecode(json.encode(response.data));

  return GetDataModel.fromJsonList(data);
}

Future<List<CountryModel>> getCountriesData(filter, wholeUrl) async {
  var response = await Dio().get(
    wholeUrl,
    queryParameters: {"filter": filter},
  );
  final data = await jsonDecode(json.encode(response.data));

  return CountryModel.fromJsonList(data);
}
