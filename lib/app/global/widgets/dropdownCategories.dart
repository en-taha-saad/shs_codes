// ignore_for_file: file_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class DropDownFormFieldC extends StatelessWidget {
  final Future<List<GetDataModel>> Function(String?)? onFind;
  final String stringText;
  final void Function(GetDataModel?)? onChanged;
  final GetDataModel? selectedItem;
  final bool enabled;
  final List<GetDataModel>? items;
  final Widget? icon;
  final int percent;

  DropDownFormFieldC(
      {this.onFind,
        required this.stringText,
        this.onChanged,
        this.selectedItem,
        this.enabled = true,
        this.items,
        this.icon,
        this.percent = 2
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/percent -40,
      height: SizeConfig().heightSize(context, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // textWidget(stringText: stringText, fontSize: 14),
          // SizedBox(height: 100),
          Container(
            width: MediaQuery.of(context).size.width/percent -40,
            height: SizeConfig().heightSize(context, 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownSearch<GetDataModel>(
              items: items,
              selectedItem: selectedItem,
              enabled: enabled,
              onFind: onFind,
              maxHeight: 500,
              popupBarrierColor: Colors.grey.withOpacity(0.5),
              showAsSuffixIcons: true,
              onChanged: onChanged,
              showSearchBox: true,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              mode: Mode.DIALOG,
              showClearButton: true,
              popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
              clearButtonSplashRadius: 20,
              showSelectedItems: true,
              compareFn: (i, s) => i!.isEqual(s),
              popupItemBuilder: (__, model, _) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: textWidget(
                        stringText: model.name,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
              dropdownSearchDecoration: InputDecoration.collapsed(
                hintText: stringText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              // searchBoxDecoration: InputDecoration(
              //   filled: true,
              //   fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              // ),
              dropdownBuilder: (__, GetDataModel? model) {
                if (model == null) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: textWidget(
                        stringText: stringText,
                        fontSize: 14,
                      ),

                    ),
                  );
                }
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    child: Center(
                      child: textWidget(
                        stringText: model.name,
                        fontSize: 17,
                      ),
                    ),
                  ),
                );
              },
              emptyBuilder: (_, item) {
                return Center(
                  child: textWidget(
                    stringText: "لا يوجد $item",
                    fontSize: 30,
                  ),
                );
              },
              searchFieldProps: TextFieldProps(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  hintText: "ابحث هنا",
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              dropDownButton: icon,
            ),
          ),
        ],
      ),
    );
  }
}