import 'package:get/get.dart';

import '../drugs_model.dart';

class DrugsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Drugs.fromJson(map);
      if (map is List) return map.map((item) => Drugs.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Drugs?> getDrugs(int id) async {
    final response = await get('drugs/$id');
    return response.body;
  }

  Future<Response<Drugs>> postDrugs(Drugs drugs) async =>
      await post('drugs', drugs);
  Future<Response> deleteDrugs(int id) async => await delete('drugs/$id');
}
