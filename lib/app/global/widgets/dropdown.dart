import 'package:flutter/material.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class DropDownFormField extends StatelessWidget {
  // final Future<List<GetDataModel>> Function(String?)? onFind;
  // final void Function(GetDataModel?)? onChanged;
  // final String? Function(GetDataModel?)? validator;
  // final GetDataModel? selectedItem;
  // final bool enabled;
  final List? items;
  final Widget Function(BuildContext)? clearButtonBuilder;
  final Mode? mode;
  final double? width;
  final double? height;
  DropDownFormField({
    this.height,
    this.width,
    this.mode,
    this.clearButtonBuilder,
    // this.onFind,
    // this.onChanged,
    // this.validator,
    // this.selectedItem,
    // this.enabled = true,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig().widthSize(context, 55),
      height: height ?? SizeConfig().heightSize(context, 8),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DropdownSearch<String>(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          errorStyle: style(
            fontSize: 12,
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.all(10),
          isDense: false,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        popupItemBuilder: (__, model, _) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: textWidget(
                  // stringText: model.name,
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
        dropdownBuilder: (__, String? model) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: Center(
                child: textWidget(
                  // stringText: "${model.name}",
                  stringText: "",
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
            hintStyle: style(),
            hintTextDirection: TextDirection.rtl,
          ),
        ),
        maxHeight: 500,
        popupBarrierColor: Colors.grey.withOpacity(0.5),
        showAsSuffixIcons: true,
        showSearchBox: true,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        mode: mode ?? Mode.DIALOG,
        showClearButton: true,
        popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
        clearButtonSplashRadius: 20,
        clearButtonBuilder: clearButtonBuilder,
      ),
    );
  }
}
