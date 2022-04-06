// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class DrugsController extends GetxController {
  // var scrollController = ScrollController().obs;
  // var empty = true.obs;
  // var index = 3.obs;
  // var alphabet = ''.obs;
  // var selectedIndex = 0.obs;
  // onSelected(int index) {
  //   selectedIndex.value = index;
  //   update();
  // }


  // Future<List<userModel.SingleDrug>?> englishDrugs() async {
  //   var headers = {'Connection': 'keep-alive'};
  //
  //   var request = http.MultipartRequest('POST', Uri.parse('$url/drugs'));
  //   request.fields.addAll({
  //     'language_code': 'en',
  //     'items_per_page': '${index.value}',
  //     // 'page': '',
  //     'alphabet': '${alphabet.value}',
  //     // 'search_text': ''
  //   });
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print("reached index = ${index.value} & alphabet = ${alphabet.value}");
  //     List<dynamic>? data =
  //     jsonDecode(await response.stream.bytesToString())['data'];
  //     // if(data!.isEmpty) {
  //     //   empty.value = true;
  //     // } else {
  //     //   empty.value = false;
  //     // }
  //     // update();
  //     return data!.map((e) => userModel.SingleDrug.fromJson(e)).toList();
  //   } else {
  //     throw 'Error has occurred';
  //   }
  // }
  @override
  void onInit() {
    super.onInit();
    // englishDrugs();
    // scrollController.value.addListener(() {
    //   if (scrollController.value.position.pixels ==
    //       scrollController.value.position.maxScrollExtent) {
    //     Future.delayed(Duration(milliseconds: 2000), () {
    //       return CircularProgressIndicator();
    //     });
    //     index.value = index.value + 3;
    //     update();
    //   }
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {
  //   scrollController.value.dispose();
  // }
}

