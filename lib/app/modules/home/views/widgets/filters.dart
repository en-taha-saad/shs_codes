// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/controllers/fetch_data.dart';
import 'package:shs108private/app/routes/app_pages.dart';

import 'dropdownHome.dart';

int? serviceID;
String? serviceName;
int? specializationID;
String? specializationName;
int? cityID;
String? cityName;
int? districtID;
String? districtName;
String? dateTime;
GetDataModel? selectedDistrictString;
GetDataModel? selectedSpecializationString;

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        DropDownFormFieldH(
          items: servicesItemsMap,
          stringText: 'الخدمة',
          onChanged: (GetDataModel? model) {
            print(model!.name);
            print(model.id);
            serviceID = model.id;
            serviceName = model.name;
            setState(() {
              selectedSpecializationString = null;
              specializationID = null;
              specializationName = null;
            });
          },
          icon: SvgPicture.asset(
            serviceIconIMG,
            width: 20,
            height: 20,
            color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
        DropDownFormFieldH(
          onFind: (String? filter) => getData(
            filter,
            medicalSpecialtiesUrl,
          ),
          selectedItem: selectedSpecializationString,
          stringText: 'الاختصاص',
          onChanged: (GetDataModel? model) {
            print(model!.name);
            print(model.id);
            setState(() {
              selectedSpecializationString = model;
            });
            specializationID = model.id;
            specializationName = model.name;
          },
          icon: SvgPicture.asset(
            // dateIMG,
            specializationIconIMG,
            width: 20,
            height: 20,
            color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
        DropDownFormFieldH(
          onFind: (String? filter) => getData(
            filter,
            '$governoratesUrl/106',
          ),
          stringText: 'المدينة',
          onChanged: (GetDataModel? model) {
            print(model!.name);
            print(model.id);
            cityID = model.id;
            cityName = model.name;
            setState(() {
              districtID = null;
              districtName = null;
              selectedDistrictString = null;
            });
          },
          icon: SvgPicture.asset(
            "assets/general_for_two_apps/icons/address.svg",
            width: 20,
            height: 20,
            color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
        DropDownFormFieldH(
          onFind: (String? filter) => getData(
            filter,
            '$citiesUrl/$cityID',
          ),
          stringText: 'المنطقة',
          selectedItem: selectedDistrictString,
          onChanged: (GetDataModel? model) {
            print(model!.name);
            print(model.id);
            setState(() {
              selectedDistrictString = model;
            });
            districtID = model.id;
            districtName = model.name;
          },
          icon: SvgPicture.asset(
            buildingIMG,
            width: 20,
            height: 20,
            color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: () => Get.defaultDialog(
                //     title: "تاريخ الحجز",
                //     titleStyle: TextStyle(fontSize: 25),
                //     backgroundColor: Colors.white,
                //     barrierDismissible: false,
                //     titlePadding: EdgeInsets.all(10),
                //     contentPadding: EdgeInsets.all(20),
                //     content: Container(
                //       height: 250,
                //       width: 270,
                //       child: CupertinoDatePicker(
                //         minimumYear: DateTime.now().year,
                //         maximumYear: DateTime.now().year + 1,
                //         minimumDate: DateTime.now(),
                //         initialDateTime: DateTime.now(),
                //         mode: CupertinoDatePickerMode.date,
                //         dateOrder: DatePickerDateOrder.dmy,
                //         onDateTimeChanged: (value) => setState(() {
                //           dateTime =
                //               "${value.year}-${value.month}-${value.day}";
                //         }),
                //       ),
                //     ),
                //     actions: [
                //       TextButton(
                //         child: textWidget(
                //           stringText: "الغاء",
                //           fontSize: 20,
                //           color: Colors.blue,
                //         ),
                //         onPressed: () {
                //           setState(() => dateTime = null);
                //           Get.back();
                //         },
                //       ),
                //       TextButton(
                //         child: textWidget(
                //           stringText: "تأكيد",
                //           fontSize: 20,
                //           color: Colors.blue,
                //         ),
                //         onPressed: () {
                //           if (dateTime == null)
                //             setState(() {
                //               dateTime =
                //                   "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
                //             });
                //           Get.back();
                //         },
                //       )
                //     ],
                //   ),
                //   child: Container(
                //     width: SizeConfig().widthSize(context, 45),
                //     height: SizeConfig().heightSize(context, 5),
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(5.0),
                //         border: Border.all(
                //           color: Colors.grey.withOpacity(0.5),
                //         )),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         dateTime == null
                //             ?textWidget(
                //           stringText: 'تاريخ الحجز',
                //           fontSize: 14,
                //         ):
                //         textWidget(
                //           stringText: dateTime,
                //           fontSize: 17,
                //         ),
                //         // SizedBox(
                //         //   width: 30,
                //         // ),
                //         SvgPicture.asset(
                //           dateIMG,
                //           width: 20,
                //           height: 20,
                //           color: Colors.black,
                //           fit: BoxFit.cover,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: SizeConfig().heightSize(context, 5),
                    color: generalColor,
                    child: TextButton(
                      onPressed: () {
                        // Get.toNamed(
                        //   Routes.FILTERS_RESULTS,
                        //   arguments: [
                        //     "$serviceName",
                        //     '$specializationName',
                        //     '$cityName',
                        //     '$districtName',
                        //     '$dateTime',
                        //   ],
                        // );
                      },
                      child: textWidget(
                        stringText: "ابحث الان",
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
