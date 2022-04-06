import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/ambulance_floating.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/our_services/controllers/our_services_controller.dart';

class OurServicesView extends GetView<OurServicesController> {
  // @override
  // Widget build(BuildContext context) {
  //   return Directionality(
  //     textDirection: TextDirection.rtl,
  //     child: Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: AppBar(
  //         flexibleSpace: Stack(
  //           children: [
  //             Image.asset(
  //               '$headerIMG',
  //               fit: BoxFit.cover,
  //               height: 60,
  //               width: MediaQuery.of(context).size.width,
  //             ),
  //           ],
  //         ),
  //         backgroundColor: Colors.white,
  //         elevation: 0,
  //         title: textWidget(
  //           stringText: 'خدماتنا',
  //           color: Colors.black,
  //           fontSize: 25,
  //         ),
  //         centerTitle: true,
  //         leading: IconButton(
  //           icon: Icon(
  //             Icons.arrow_back,
  //             color: Colors.black,
  //           ),
  //           onPressed: () {
  //             Get.back();
  //           },
  //         ),
  //       ),
  //       drawer: MainDrawer(),
  //       body: SizedBox(
  //         height: MediaQuery.of(context).size.height,
  //         child: Stack(
  //           alignment: Alignment.bottomCenter,
  //           children: [
  //             ExpandableTheme(
  //               data: ExpandableThemeData(
  //                 iconColor: Colors.blue,
  //                 useInkWell: true,
  //               ),
  //               child: ListView.builder(
  //                 itemCount: 13,
  //                 physics: BouncingScrollPhysics(),
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return ExpandableNotifier(
  //                     child: Padding(
  //                       padding:
  //                           EdgeInsets.only(left: 10, right: 10, bottom: 10),
  //                       child: ScrollOnExpand(
  //                         child: Card(
  //                           clipBehavior: Clip.antiAlias,
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: <Widget>[
  //                               SizedBox(height: 10),
  //                               Expandable(
  //                                 collapsed: imagePart(index, context),
  //                                 expanded: imagePart(index, context),
  //                               ),
  //                               Expandable(
  //                                 collapsed: Container(),
  //                                 expanded: Padding(
  //                                   padding: EdgeInsets.all(10),
  //                                   child: textWidget(
  //                                     stringText: loremIpsum,
  //                                     fontSize: 15,
  //                                   ),
  //                                 ),
  //                               ),
  //                               Divider(height: 1),
  //                               Center(
  //                                 child: Builder(
  //                                   builder: (context) {
  //                                     var controller = ExpandableController.of(
  //                                       context,
  //                                       required: true,
  //                                     )!;
  //                                     return TextButton(
  //                                       child: textWidget(
  //                                         stringText: controller.expanded
  //                                             ? "طي"
  //                                             : "المزيد",
  //                                         color: Colors.blue.shade900,
  //                                       ),
  //                                       onPressed: () => controller.toggle(),
  //                                     );
  //                                   },
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //             Image.asset(
  //               footerIMG,
  //               fit: BoxFit.cover,
  //               height: 60,
  //               width: MediaQuery.of(context).size.width,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                '$headerIMG',
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          title: textWidget(
            stringText: "خدماتنا",
            color: Colors.black,
            fontSize: 20,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        floatingActionButton: ambulanceFloating(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 1),
              SvgPicture.asset(
                notFoundIMG,
                height: 270,
                width: 270,
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  child: textWidget(
                    stringText:
                        'الصفحة غير متوفرة حاليا, يرجى الرجوع اليها لاحقا',
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(flex: 1),
              Image.asset(
                footerIMG,
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
