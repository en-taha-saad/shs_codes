import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as img;
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/loading_logo_controller.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/controllers/edit_doctor_screen_controller.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/models/doctor_profile_model.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    this.width,
    this.height,
    this.itemAsString,
    this.popupTitle,
    this.items,
    this.onFind,
    this.onChanged,
    this.selectedItem,
    this.dropdownBuilderStringText,
    this.showClearButton,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String Function(dynamic)? itemAsString;
  final String? popupTitle;
  final List<DropDownType>? items;
  final Future<List<DropDownType>> Function(String?)? onFind;
  final void Function(DropDownType?)? onChanged;
  final DropDownType? selectedItem;
  final dynamic dropdownBuilderStringText;
  final bool? showClearButton;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? SizeConfig().widthSize(context, 55),
      height: widget.height ?? 70,
      child: DropdownSearch<DropDownType?>(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(
            right: 20,
          ),
          isDense: false,
          border: OutlineInputBorder(
            gapPadding: 20,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        itemAsString: widget.itemAsString,
        maxHeight: 550,
        popupBackgroundColor: Colors.white,
        popupElevation: 0,
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        popupTitle: Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: textWidget(
            stringText: widget.popupTitle,
            fontSize: 20,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ),
        selectionListViewProps: SelectionListViewProps(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
        ),
        searchFieldProps: TextFieldProps(
          textDirection: TextDirection.rtl,
          autofocus: false,
          padding: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 15,
            bottom: 10,
          ),
          style: style(
            fontSize: 15,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            isDense: false,
            border: OutlineInputBorder(
              gapPadding: 20,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              borderSide: BorderSide.none,
            ),
            hintText: "ابحث هنا",
            hintStyle: style(
              color: Colors.black38,
              fontSize: 18,
            ),
            hintTextDirection: TextDirection.rtl,
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
        dialogMaxWidth: Get.width,
        dropdownButtonSplashRadius: 20.0,
        items: widget.items,
        onFind: widget.onFind,
        onChanged: widget.onChanged,
        selectedItem: widget.selectedItem,
        popupBarrierColor: Colors.grey.withOpacity(0.5),
        showAsSuffixIcons: true,
        showSearchBox: true,
        mode: Mode.DIALOG,
        showClearButton: widget.showClearButton ?? false,
        popupSafeArea: PopupSafeAreaProps(
          top: true,
          bottom: true,
          left: true,
          right: true,
          maintainBottomViewPadding: true,
        ),
        clearButtonSplashRadius: 20,
        dropdownSearchBaseStyle: style(
          fontSize: 15,
          color: Colors.black,
        ),
        loadingBuilder: (_, __) {
          return GetBuilder(
            init: LoadingController(),
            builder: (LoadingController c) {
              c.animatedlogo();
              return Center(
                child: AnimatedBuilder(
                  animation: c.heartAnimationController,
                  builder: (_, child) {
                    return Container(
                      child: img.Image.asset(
                        faviconIMG,
                        fit: BoxFit.cover,
                        height: c.heartAnimation.value,
                        width: c.heartAnimation.value,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        popupItemBuilder: (
          __,
          model,
          _,
        ) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(5, 5),
                ),
              ],
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
            child: Center(
              child: textWidget(
                stringText: model?.name,
                fontSize: 18,
                color: Colors.black87,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        dropdownBuilder: (
          __,
          model,
        ) {
          return GetBuilder(
            init: EditDoctorScreenController(),
            builder: (EditDoctorScreenController c) {
              return Center(
                child: textWidget(
                  stringText: model?.name ?? '',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        },
        emptyBuilder: (_, item) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textWidget(
                  stringText: "لا يوجد",
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
                textWidget(
                  stringText: "$item",
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
