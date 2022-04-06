import 'package:get/get.dart';

import '../labs_model.dart';

class LabsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Labs.fromJson(map);
      if (map is List) return map.map((item) => Labs.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Labs?> getLabs(int id) async {
    final response = await get('labs/$id');
    return response.body;
  }

  Future<Response<Labs>> postLabs(Labs labs) async => await post('labs', labs);
  Future<Response> deleteLabs(int id) async => await delete('labs/$id');
}
