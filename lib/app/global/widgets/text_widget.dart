import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget({
  String? stringText,
  double? fontSize = 15,
  Color? color,
  List<Shadow>? shadows,
  Color? backgroundColor,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
  double? height,
  TextAlign? textAlign,
  double? letterSpacing,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    stringText!,
    style: style(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      color: color,
      shadows: shadows,
      backgroundColor: backgroundColor,
      fontWeight: fontWeight,
      textDecoration: textDecoration,
      height: height,
    ),
    textAlign: textAlign,
    softWrap: true,
    overflow: overflow,
    maxLines: maxLines,
  );
}

TextStyle? style({
  double? fontSize = 15,
  Color? color = Colors.black,
  List<Shadow>? shadows,
  double? letterSpacing,
  Color? backgroundColor,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
  double? height,
}) {
  return GoogleFonts.almarai(
    shadows: shadows,
    letterSpacing: letterSpacing,
    backgroundColor: backgroundColor,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: textDecoration,
    height: height,
  );
}
