import 'package:get/get.dart';

import '../phar_model.dart';

class PharProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Phar.fromJson(map);
      if (map is List) return map.map((item) => Phar.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Phar?> getPhar(int id) async {
    final response = await get('phar/$id');
    return response.body;
  }

  Future<Response<Phar>> postPhar(Phar phar) async => await post('phar', phar);
  Future<Response> deletePhar(int id) async => await delete('phar/$id');
}
