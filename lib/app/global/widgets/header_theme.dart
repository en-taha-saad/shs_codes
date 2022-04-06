import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';

class HeaderTheme extends StatelessWidget {
  const HeaderTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      headerIMG,
      fit: BoxFit.cover,
      height: 60,
      width: MediaQuery.of(context).size.width,
    );
  }
}
