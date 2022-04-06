import 'package:flutter/material.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class BuildContainer extends StatelessWidget {
  final String? stringText1;
  final String? stringText2;

  BuildContainer({
    this.stringText1,
    this.stringText2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(stringText: stringText1, fontSize: 15),
          Directionality(
            textDirection: TextDirection.ltr,
            child: textWidget(stringText: stringText2, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
