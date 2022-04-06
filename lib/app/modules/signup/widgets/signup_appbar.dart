import 'package:flutter/material.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderTheme(),
      ],
    );
  }
}
