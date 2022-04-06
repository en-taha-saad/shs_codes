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

class PrivateClinicsFilters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<PrivateClinicsFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        title: textWidget(
          stringText: 'بحث متخصص',
          color: generalColor5,
        ),
        tilePadding: EdgeInsets.all(0),
        collapsedIconColor: generalColor5,
        iconColor: generalColor5,
        initiallyExpanded: true,
        onExpansionChanged: (_) {},
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              DropDownFormFieldC(
                percent: 1,
                items: servicesItemsMap,
                stringText: 'بحث عن اسم الطبيب',
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
                  color: generalColor5,
                  fit: BoxFit.cover,
                ),
              ),
              DropDownFormFieldC(
                percent: 1,
                items: servicesItemsMap,
                stringText: 'بحث عن التخصص',
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
                  specializationIconIMG,
                  width: 20,
                  height: 20,
                  color: generalColor5,
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
                  color: generalColor5,
                  fit: BoxFit.cover,
                ),
              ),
              DropDownFormFieldC(
                percent: 1,
                onFind: (String? filter) => getData(
                  filter,
                  '$citiesUrl/$cityID',
                ),
                stringText: 'بحث عن المحافظة',
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
                  color: generalColor5,
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
                  color: generalColor5,
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
