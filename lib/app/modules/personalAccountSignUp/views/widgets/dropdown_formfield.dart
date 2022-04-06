import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';

class DropDownFormField extends StatelessWidget {
  final Future<List<GetDataModel>> Function(String?)? onFind;
  final void Function(GetDataModel?)? onChanged;
  final String? Function(GetDataModel?)? validator;
  final GetDataModel? selectedItem;
  final bool enabled;
  final List<GetDataModel>? items;
  final Widget Function(BuildContext)? clearButtonBuilder;
  final Widget? clearButton;
  DropDownFormField({
    this.clearButton,
    this.clearButtonBuilder,
    this.onFind,
    this.onChanged,
    this.validator,
    this.selectedItem,
    this.enabled = true,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig().widthSize(context, 55),
      height: SizeConfig().heightSize(context, 8),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DropdownSearch<GetDataModel>(
        items: items,
        selectedItem: selectedItem,
        enabled: enabled,
        onFind: onFind,
        clearButton: clearButton,
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          errorStyle: style(
            fontSize: 12,
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.all(10),
          isDense: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        maxHeight: 500,
        popupBarrierColor: Colors.grey.withOpacity(0.5),
        showAsSuffixIcons: true,
        onChanged: onChanged,
        showSearchBox: true,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        mode: Mode.DIALOG,
        showClearButton: true,
        popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
        clearButtonSplashRadius: 20,
        showSelectedItems: true,
        compareFn: (i, s) => i!.isEqual(s),
        clearButtonBuilder: clearButtonBuilder,
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
        dropdownBuilder: (__, GetDataModel? model) {
          if (model == null) {
            return Container();
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
            hintStyle: style(),
            hintTextDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}

// class DropDownFormField1 extends StatelessWidget {
//   final Future<List<GetDataModel1>> Function(String?)? onFind;
//   final void Function(GetDataModel1?)? onChanged;
//   final String? Function(GetDataModel1?)? validator;
//   final GetDataModel1? selectedItem;
//   final bool enabled;
//   final List<GetDataModel1>? items;
//   final Widget Function(BuildContext)? clearButtonBuilder;
//   DropDownFormField1({
//     this.clearButtonBuilder,
//     this.onFind,
//     this.onChanged,
//     this.validator,
//     this.selectedItem,
//     this.enabled = true,
//     this.items,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: SizeConfig().widthSize(context, 55),
//       height: SizeConfig().heightSize(context, 8),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: DropdownSearch<GetDataModel1>(
//         items: items,
//         selectedItem: selectedItem,
//         enabled: enabled,
//         onFind: onFind,
//         dropdownSearchDecoration: InputDecoration(
//           filled: true,
//           errorStyle: style(
//             fontSize: 12,
//             color: Colors.red,
//           ),
//           contentPadding: EdgeInsets.all(10),
//           isDense: true,
//           border: OutlineInputBorder(borderSide: BorderSide.none),
//         ),
//         maxHeight: 500,
//         popupBarrierColor: Colors.grey.withOpacity(0.5),
//         showAsSuffixIcons: true,
//         onChanged: onChanged,
//         showSearchBox: true,
//         autoValidateMode: AutovalidateMode.onUserInteraction,
//         validator: validator,
//         mode: Mode.DIALOG,
//         showClearButton: true,
//         popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
//         clearButtonSplashRadius: 20,
//         showSelectedItems: true,
//         compareFn: (i, s) => i!.isEqual(s),
//         clearButtonBuilder: clearButtonBuilder,
//         popupItemBuilder: (__, model, _) {
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: Container(
//               padding: EdgeInsets.all(15),
//               child: Center(
//                 child: textWidget(
//                   stringText: model.name,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           );
//         },
//         // searchBoxDecoration: InputDecoration(
//         //   filled: true,
//         //   fillColor: Theme.of(context).inputDecorationTheme.fillColor,
//         // ),
//         dropdownBuilder: (__, GetDataModel1? model) {
//           if (model == null) {
//             return Container();
//           }
//           return Directionality(
//             textDirection: TextDirection.rtl,
//             child: Container(
//               child: Center(
//                 child: textWidget(
//                   stringText: "${model.name}",
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//           );
//         },
//         emptyBuilder: (_, item) {
//           return Center(
//             child: textWidget(
//               stringText: "لا يوجد $item",
//               fontSize: 30,
//             ),
//           );
//         },
//         searchFieldProps: TextFieldProps(
//           textDirection: TextDirection.rtl,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
//             hintText: "ابحث هنا",
//             hintStyle: style(),
//             hintTextDirection: TextDirection.rtl,
//           ),
//         ),
//       ),
//     );
//   }
// }

class MultiSelectDropDownFormField extends StatefulWidget {
  final Future<List<GetDataModel>> Function(String?)? onFind;
  final void Function(List<GetDataModel>)? onChange;
  final String? Function(List<GetDataModel>?)? validator;
  final bool enabled;
  final List<GetDataModel>? items;
  final List<GetDataModel> selectedItems;

  MultiSelectDropDownFormField({
    required this.selectedItems,
    this.onFind,
    this.onChange,
    this.validator,
    this.enabled = true,
    this.items,
  });

  @override
  State<MultiSelectDropDownFormField> createState() =>
      _MultiSelectDropDownFormFieldState();
}

class _MultiSelectDropDownFormFieldState
    extends State<MultiSelectDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig().widthSize(context, 55),
      height: SizeConfig().heightSize(context, 8),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: DropdownSearch<GetDataModel>.multiSelection(
        mode: Mode.DIALOG,
        showClearButton: true,
        onChanged: widget.onChange,
        popupOnItemRemoved: (list, item) =>
            list.removeWhere((e) => e.id == item.id),
        popupSelectionWidget: (_, GetDataModel item, bool isSelected) {
          return isSelected
              ? Icon(
            Icons.check_circle,
            color: Colors.green[500],
          )
              : Container();
        },
        clearButtonSplashRadius: 20,
        items: widget.items,
        selectedItems: widget.selectedItems,
        enabled: widget.enabled,
        onFind: widget.onFind,
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          errorStyle: style(
            fontSize: 12,
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.all(10),
          isDense: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        maxHeight: 500,
        popupBarrierColor: Colors.grey.withOpacity(0.5),
        showAsSuffixIcons: true,
        showSearchBox: true,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        popupSafeArea: PopupSafeAreaProps(top: true, bottom: true),
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
        dropdownBuilder: (__, model) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: Center(
                child: textWidget(
                  stringText: model.where((element) => element.other==null).map(
                          (e) => e.name).join(' - '),
                  fontSize: 17,
                  textAlign: TextAlign.center,
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
      ),
    );
  }
}
