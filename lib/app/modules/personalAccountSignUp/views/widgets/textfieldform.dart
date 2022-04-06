import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/methods/size_config.dart';

class TextFieldForm extends StatelessWidget {
  final String? name;
  final String? labelText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final bool? obscureText;
  final Widget? suffixIcon;
  final IconData? icons;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final double? width;
  final double? height;
  final bool enabled;
  final int? maxLength;
  final EdgeInsetsGeometry? margin;
  final String? initialValue;
  TextFieldForm({
    this.margin,
    this.initialValue,
    this.maxLength,
    this.enabled = true,
    this.name,
    this.labelText,
    this.validator,
    required this.autovalidateMode,
    this.obscureText,
    this.suffixIcon,
    this.icons,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.suffix,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig().widthSize(context, 55),
      height: height ?? SizeConfig().heightSize(context, 10),
      margin: margin,
      child: FormBuilderTextField(
        maxLength: maxLength,
        onChanged: onChanged,
        initialValue: initialValue,
        controller: controller,
        obscureText: obscureText!,
        validator: validator,
        autovalidateMode: autovalidateMode,
        name: name!,
        enabled: enabled,
        keyboardType: keyboardType,
        enableInteractiveSelection: true,
        onSaved: (input) => input,
        decoration: InputDecoration(
          isDense: true,
          labelText: labelText,
          errorMaxLines: 2,
          errorStyle: style(
            fontSize: 10,
            color: Colors.red,
          ),
          labelStyle: style(fontSize: 12),
          prefixIcon: Icon(icons),
          suffix: suffix,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
