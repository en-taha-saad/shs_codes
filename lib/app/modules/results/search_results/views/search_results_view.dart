import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/appbar.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
// import 'package:shs_108/app/modules/drawer/drawer.dart';

import '../controllers/search_results_controller.dart';

class SearchResultsView extends GetView<SearchResultsController> {
  final homeData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(appBarTitle: 'نتائج البحث',context: context),
        // drawer: MainDrawer(),
        floatingActionButton: ambulanceFloating(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textWidget(stringText: "لقد بحثت عن اسم", fontSize: 25),
              textWidget(stringText: homeData, fontSize: 25),
              textWidget(
                  stringText: "ولكن غير متوفر, حاول لاحقا", fontSize: 25),
            ],
          ),
        ),
      ),
    );
  }
}
