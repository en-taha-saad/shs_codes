// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shs_108/app/core/values/strings.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shs_108/app/global_widgets/text_widget.dart';
// import 'package:shs_108/app/modules/drawer/drawer.dart';
// import 'package:shs_108/app/modules/drugs/controllers/drugs_controller.dart';
//
// import 'package:shs_108/app/modules/drugs/user_model.dart' as userModel;
// import 'package:shs_108/app/modules/drugs/views/widgets/drug_card.dart';
// import 'package:shs_108/app/modules/home/views/widgets/drugsSearch.dart';
// import 'package:shs_108/app/routes/app_pages.dart';
//
// class DrugsView extends GetView<DrugsController> {
//
//   DrugsController _drugsController = new DrugsController();
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           drawer: MainDrawer(),
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             elevation: 0,
//             flexibleSpace: Stack(
//               children: [
//                 Image.asset(
//                   '$headerIMG',
//                   fit: BoxFit.cover,
//                   height: 60,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ],
//             ),
//             title: textWidget(
//               stringText: "دليل الادوية",
//               color: Colors.black,
//               fontSize: 20,
//             ),
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ),
//           body: Column(
//             children: [
//               DrugSearchBar(),
//               Container(
//                   height: 50,
//                   margin: EdgeInsets.all(20),
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: alphabets.length,
//                         itemBuilder: (BuildContext context, int index1) =>
//                             Obx(()=>
//                                Container(
//                                 color: _drugsController.selectedIndex.value == index1
//                                     ? Colors.blue.shade50
//                                     : Colors.white,
//                                 child: TextButton(
//                                     onPressed: () {
//                                         index1 != 0
//                                             ? _drugsController.alphabet.value =
//                                       alphabets[index1]
//                                             : _drugsController.alphabet.value = '';
//                                         print(_drugsController.alphabet.value);
//                                         _drugsController.index.value = 3;
//                                         _drugsController.onSelected(index1);
//                                         _drugsController.empty.value = true;
//                                         _drugsController.englishDrugs();
//                                         // _drugsController.update();
//                                     },
//                                     child: textWidget(
//                                         stringText: alphabets[index1],
//                                         color: generalColor)),
//                               ),
//                             )
//
//                         //     alphabet.map((item)
//                         // => Container()).toList(),
//
//                         ),
//                   )),
//               Flexible(
//                 flex: 1,
//                 child: Obx(()=>
//                     FutureBuilder<List<userModel.SingleDrug>?>(
//                     future: _drugsController.englishDrugs(),
//                     builder:
//                         (_, AsyncSnapshot<List<userModel.SingleDrug>?> snapshot) {
//                       List<userModel.SingleDrug>? data = snapshot.data;
//                       if (snapshot.data != null) {
//                         print('empty ${_drugsController.empty.value}');
//                         return ListView.builder(
//                             controller: _drugsController.scrollController.value,
//                             itemCount: data!.length,
//                             itemBuilder: (_, index) {
//                               print('data id = ${snapshot.data![index].drugId}');
//                               return GetBuilder<DrugsController>(
//                                       init: DrugsController(),
//                                       builder: (_){
//                                         if(_drugsController.empty
//                                   .value ==
//                                   true)
//                                 return Center(
//                                   child: Text('empty'),
//                                 );
//                               else return DrugCard(
//                                   genericName: snapshot.data![index].genericName,
//                                   packageSize: snapshot.data![index].packageSize,
//                                   strength: snapshot.data![index].strength,
//                                   tradeName: snapshot.data![index].tradeName,
//                                   image: snapshot.data![index].image!.imageUrl,
//                                   onPressed: () {
//                                     Get.toNamed(
//                                       Routes.DRUG_PROFILE,
//                                       arguments: [
//                                         snapshot.data![index].drugId,
//                                         snapshot.data![index].tradeName,
//                                         snapshot.data![index].strength,
//                                         snapshot.data![index].genericName,
//                                         snapshot.data![index].dosageForm,
//                                         snapshot.data![index].routeOfAdministration,
//                                         snapshot.data![index].drug!.mohCode,
//                                         snapshot.data![index].packageSize,
//                                         snapshot.data![index].image!.imageUrl,
//                                         snapshot.data![index].manufacturer,
//                                         snapshot.data![index].distributor,
//                                         _drugsController.index,
//                                       ],
//                                     );
//                                   },
//                                 );}
//                               );
//                             },
//                           );
//                       } else if (snapshot.hasError) {
//                         print('snapshot.hasError = ${snapshot.error}');
//                         return Center(
//                           child: Text('error'),
//                         );
//                       } else {
//                         print(snapshot.error);
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
//
// }
//
// List<String> alphabets = [
//   'الكل',
//   'A',
//   'B',
//   'C',
//   'D',
//   'E',
//   'F',
//   'G',
//   'H',
//   'I',
//   'J',
//   'K',
//   'J',
//   'L',
//   'M',
//   'N',
//   'O',
//   'P',
//   'Q',
//   'R',
//   'S',
//   'T',
//   'U',
//   'V',
//   'W',
//   'X',
//   'Y',
//   'Z'
// ];
