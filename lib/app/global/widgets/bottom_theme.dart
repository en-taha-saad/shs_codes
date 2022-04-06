import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';

class BottomTheme extends StatelessWidget {
  final Widget? child;
  BottomTheme({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              footerIMG,
              fit: BoxFit.cover,
              height: 60,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          child!,
        ],
      ),
    );
  }
}
