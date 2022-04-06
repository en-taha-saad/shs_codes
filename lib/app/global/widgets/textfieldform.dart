import 'package:flutter/material.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldForm extends StatelessWidget {
  final String? name;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
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
  final bool? autofocus;
  final bool? expands;
  final String? labelText;
  final String? initialValue;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? margin;
  final int? maxLength;
  final void Function()? onEditingComplete;
  final int? maxLines;
  final InputDecoration? decoration;
  TextFieldForm({
    this.decoration,
    this.initialValue,
    this.margin,
    this.maxLines,
    this.enabled = true,
    this.name,
    this.autofocus,
    this.validator,
    this.autovalidateMode,
    this.obscureText,
    this.suffixIcon,
    this.icons,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.suffix,
    this.width,
    this.height,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.expands,
    this.maxLength,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? SizeConfig().widthSize(context, 55),
      height: height ?? SizeConfig().heightSize(context, 10),
      child: FormBuilderTextField(
        initialValue: initialValue,
        autofocus: autofocus ?? false,
        onChanged: onChanged,
        controller: controller,
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        validator: validator,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        name: name ?? '',
        enabled: enabled,
        expands: expands ?? false,
        minLines: null,
        maxLines: maxLines,
        onEditingComplete: onEditingComplete,
        keyboardType: keyboardType,
        enableInteractiveSelection: true,
        onSaved: (input) => input,
        decoration: decoration ??
            InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle: hintStyle ?? style(fontSize: 12),
              labelText: labelText,
              errorMaxLines: 2,
              errorStyle: style(
                fontSize: 10,
                color: Colors.red,
              ),
              labelStyle: labelStyle ?? style(fontSize: 12),
              prefixIcon: Icon(icons),
              suffix: suffix,
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 10,
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                gapPadding: 10,
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
      ),
    );
  }
}

class CustomeTextField extends StatelessWidget {
  final String? stringText;
  final String? labelText;
  final String? name;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final int? maxLength;

  const CustomeTextField({
    this.stringText,
    this.labelText,
    this.autofocus,
    this.name,
    this.controller,
    this.height,
    this.width,
    this.maxLength,
    this.autovalidateMode,
    this.keyboardType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          width: SizeConfig().widthSize(context, 25),
          height: SizeConfig().heightSize(context, height ?? 10),
          child: textWidget(
            stringText: stringText ?? '',
            fontSize: 15,
          ),
        ),
        TextFieldForm(
          maxLength: maxLength,
          width: width,
          height: height,
          autofocus: autofocus,
          keyboardType: keyboardType,
          labelText: labelText,
          name: name,
          controller: controller,
          enabled: true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        ),
      ],
    );
  }
}

class CustomDialogTextField extends StatelessWidget {
  const CustomDialogTextField({
    Key? key,
    this.enabled,
    this.controller,
    this.name,
    this.hintText,
    this.keyboardType,
    this.initialValue,
    this.width,
    this.validator,
    this.autovalidateMode,
    this.icons,
    this.suffix,
    this.maxLength,
    this.height,
    this.onChanged,
    this.onEditingComplete,
    this.hintStyle,
  }) : super(key: key);
  final void Function()? onEditingComplete;
  final int? maxLength;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final IconData? icons;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? name;
  final String? initialValue;
  final String? hintText;
  final bool? enabled;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffix;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFieldForm(
        onChanged: onChanged,
        icons: icons,
        height: height ?? 60,
        maxLength: maxLength,
        onEditingComplete: onEditingComplete,
        suffix: suffix,
        initialValue: initialValue,
        width: width ?? 400,
        expands: true,
        margin: EdgeInsets.only(top: 8),
        autofocus: false,
        keyboardType: keyboardType ?? TextInputType.text,
        hintStyle: hintStyle ?? style(fontSize: 16),
        hintText: hintText,
        name: name,
        validator: validator,
        controller: controller,
        enabled: enabled ?? true,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}

class CustomDialogTextFieldTextContainer extends StatelessWidget {
  const CustomDialogTextFieldTextContainer({
    Key? key,
    this.stringText,
    this.fontSize,
    this.margin,
    this.fontWeight,
    this.color,
  }) : super(key: key);
  final String? stringText;
  final Color? color;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 10),
      child: textWidget(
        stringText: stringText,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 17,
        color: color,
      ),
    );
  }
}
