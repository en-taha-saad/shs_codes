import 'package:flutter/material.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/drop_down_patient.dart';

class Address extends StatelessWidget {
  final String groupName;
  final String? stringText1, stringText2, stringText3, stringText4;
  final String? Function(GetDataModel?)? validatorCountry;
  final String? Function(GetDataModel?)? validatorGovernorate;
  final String? Function(GetDataModel?)? validatorCity;

  final Future<List<GetDataModel>> Function(String?)? onFindCountry;
  final Future<List<GetDataModel>> Function(String?)? onFindGovernorate;
  final Future<List<GetDataModel>> Function(String?)? onFindCity;
  final Future<List<GetDataModel>> Function(String?)? onFindDestrict;

  final void Function(GetDataModel?)? onChangedCountry;
  final void Function(GetDataModel?)? onChangedGovernorate;
  final void Function(GetDataModel?)? onChangedCity;
  final void Function(GetDataModel?)? onChangedDestrict;

  final GetDataModel? selectedItemCountry;
  final GetDataModel? selectedItemGovernorate;
  final GetDataModel? selectedItemCity;
  final GetDataModel? selectedItemDestrict;

  final Widget? clearButtonCountry;
  final Widget? clearButtonGovernorate;
  final Widget? clearButtonCity;
  final Widget? clearButtonDestrict;

  Address({
    this.clearButtonCountry,
    this.clearButtonGovernorate,
    this.clearButtonCity,
    this.clearButtonDestrict,
    required this.groupName,
    this.stringText1,
    this.stringText2,
    this.stringText3,
    this.stringText4,
    this.selectedItemCountry,
    this.selectedItemGovernorate,
    this.selectedItemCity,
    this.selectedItemDestrict,
    this.onChangedCountry,
    this.onChangedGovernorate,
    this.onChangedCity,
    this.onChangedDestrict,
    this.onFindCountry,
    this.onFindGovernorate,
    this.onFindCity,
    this.onFindDestrict,
    this.validatorCountry,
    this.validatorGovernorate,
    this.validatorCity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          child: textWidget(stringText: groupName, fontSize: 17),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig().widthSize(context, 25),
                  height: SizeConfig().heightSize(context, 12),
                  child: textWidget(
                    stringText: stringText1,
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: SizeConfig().widthSize(context, 25),
                  height: SizeConfig().heightSize(context, 10),
                  child: textWidget(
                    stringText: stringText2,
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: SizeConfig().widthSize(context, 25),
                  height: SizeConfig().heightSize(context, 9),
                  child: textWidget(
                    stringText: stringText3,
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: SizeConfig().widthSize(context, 25),
                  height: SizeConfig().heightSize(context, 3),
                  child: textWidget(
                    stringText: stringText4,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropDownFormField(
                  clearButton: clearButtonCountry,
                  selectedItem: selectedItemCountry,
                  validator: validatorCountry,
                  onFind: onFindCountry,
                  onChanged: onChangedCountry,
                ),
                DropDownFormField(
                  clearButton: clearButtonGovernorate,
                  selectedItem: selectedItemGovernorate,
                  validator: validatorGovernorate,
                  onFind: onFindGovernorate,
                  onChanged: onChangedGovernorate,
                ),
                DropDownFormField(
                  clearButton: clearButtonCity,
                  selectedItem: selectedItemCity,
                  validator: validatorCity,
                  onFind: onFindCity,
                  onChanged: onChangedCity,
                ),
                DropDownFormField(
                  clearButton: clearButtonDestrict,
                  selectedItem: selectedItemDestrict,
                  onFind: onFindDestrict,
                  onChanged: onChangedDestrict,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
