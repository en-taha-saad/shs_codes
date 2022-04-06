import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.width,
    this.height,
    this.onChanged,
    this.expands,
    this.initialValue,
    this.hintText,
    required this.name,
    this.maxLength,
    this.textDirection,
    this.contentPadding,
    this.validator,
    this.keyboardType,
    this.neededSuffixIcon,
    this.onPressedSuffixIcon,
    this.controller,
    this.border,
  }) : super(key: key);
  final double? width;
  final double? height;
  final void Function(dynamic)? onChanged;
  final bool? expands;
  final String? initialValue;
  final String name;
  final String? hintText;
  final int? maxLength;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? neededSuffixIcon;
  final void Function()? onPressedSuffixIcon;
  final TextEditingController? controller;

  final OutlineInputBorder? border;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ??
          SizeConfig().widthSize(
            context,
            70,
          ),
      height: height ?? 70.0,
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: FormBuilderTextField(
        key: key,
        controller: controller,
        minLines: null,
        maxLines: null,
        expands: true,
        maxLength: maxLength,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        showCursor: true,
        style: style(fontSize: 20),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: false,
          contentPadding: contentPadding ??
              EdgeInsets.only(
                left: 20,
                right: 20,
              ),
          isDense: false,
          suffixIcon: neededSuffixIcon == true
              ? Container(
                  margin: EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: onPressedSuffixIcon,
                  ),
                )
              : null,
          disabledBorder: border,
          enabledBorder: border,
          errorBorder: border,
          focusedBorder: border,
          focusedErrorBorder: border,
          border: border ??
              OutlineInputBorder(
                gapPadding: 20,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
              ),
          hintText: hintText,
          hintStyle: style(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        /*
        InputDecoration(
          filled: true,
          isDense: false,
          border: OutlineInputBorder(
            gapPadding: 20,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: style(
            color: Colors.black38,
            fontSize: 18,
          ),
          hintTextDirection: TextDirection.rtl,
        )
        */

        keyboardType: keyboardType,
        name: name,
        textDirection: textDirection,
        autofocus: false,
        onChanged: onChanged,
        initialValue: initialValue,
      ),
    );
  }
}
