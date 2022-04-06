// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/dropdownCategories.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/controllers/fetch_data.dart';

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

class HospitalsFilters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<HospitalsFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        title: textWidget(
          stringText: 'بحث متخصص',
          color: generalColor4,
          fontWeight: FontWeight.bold,
        ),
        tilePadding: EdgeInsets.all(0),
        collapsedIconColor: generalColor4,
        iconColor: generalColor4,
        initiallyExpanded: true,
        onExpansionChanged: (_) {},
        //textWidget(stringText: 'عن الشركة', color: Colors.white,fontSize: 20),
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              DropDownFormFieldC(
                percent: 1,
                items: servicesItemsMap,
                stringText: 'بحث عن اسم المستشفى',
                onChanged: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  serviceID = model.id;
                  serviceName = model.name;
                },
                icon: SvgPicture.asset(
                  serviceIconIMG,
                  width: 20,
                  height: 20,
                  color: generalColor4,
                  fit: BoxFit.cover,
                ),
              ),
              DropDownFormFieldC(
                percent: 1,
                items: servicesItemsMap,
                stringText: 'بحث عن الاختصاص',
                selectedItem: selectedSpecializationString,
                onChanged: (GetDataModel? model) {
                  print(model!.name);
                  print(model.id);
                  setState(() {
                    selectedSpecializationString = model;
                  });
                  districtID = model.id;
                  districtName = model.name;
                },
                icon: SvgPicture.asset(
                  // dateIMG,
                  specializationIconIMG,
                  width: 20,
                  height: 20,
                  color: generalColor4,
                  fit: BoxFit.cover,
                ),
              ),
              DropDownFormFieldC(
                percent: 1,
                onFind: (String? filter) => getData(
                  filter,
                  '$governoratesUrl',
                ),
                stringText: 'بحث عن المدينة',
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
                  color: generalColor4,
                  fit: BoxFit.cover,
                ),
              ),
              DropDownFormFieldC(
                percent: 1,
                onFind: (String? filter) => getData(
                  filter,
                  '$citiesUrl/$cityID',
                ),
                stringText: 'بحث عن المنطقة',
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
                  color: generalColor4,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 100,
                  height: SizeConfig().heightSize(context, 5),
                  color: generalColor4,
                  child: TextButton(
                    onPressed: () {},
                    child: textWidget(
                      stringText: "ابحث الان",
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
