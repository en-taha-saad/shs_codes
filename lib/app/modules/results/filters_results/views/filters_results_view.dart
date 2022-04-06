import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/appbar.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
// import 'package:shs_108/app/modules/drawer/drawer.dart';

import '../controllers/filters_results_controller.dart';

class FiltersResultsView extends GetView<FiltersResultsController> {
  final filtersData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(appBarTitle: 'نتائج الفلترة',context: context),
        // drawer: MainDrawer(),
        floatingActionButton: ambulanceFloating(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textWidget(stringText: 'لقد فلترت', fontSize: 25),
              textWidget(stringText: "${filtersData[0]}", fontSize: 25),
              textWidget(stringText: "${filtersData[1]}", fontSize: 25),
              textWidget(stringText: "${filtersData[2]}", fontSize: 25),
              textWidget(stringText: "${filtersData[3]}", fontSize: 25),
              textWidget(stringText: "${filtersData[4]}", fontSize: 25),
              textWidget(
                stringText: 'لكن لا يوجد معلومات حاليا الرجاء المحاولة لاحقا',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
