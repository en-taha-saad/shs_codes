import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class AddCardWidget0 extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String stringText;
  final void Function() onPressedCancel;
  final void Function() onPressedAddCard;
  final double? height;
  AddCardWidget0({
    Key? key,
    this.height,
    required this.title,
    required this.children,
    required this.stringText,
    required this.onPressedCancel,
    required this.onPressedAddCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:TextButton(
      // ElevatedButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(
          //   Colors.green.shade500,
          // ),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(20),
          ),
        ),
        onPressed: () {
          Get.defaultDialog(
            titleStyle: style(fontSize: 20),
            title: title,
            backgroundColor: Colors.white,
            barrierDismissible: true,
            titlePadding: EdgeInsets.all(20),
            actions: [
              TextButton(
                child: textWidget(
                  stringText: "الغاء",
                  fontSize: 20,
                  color: Colors.blue,
                ),
                onPressed: onPressedCancel,
              ),
              TextButton(
                child: textWidget(
                  stringText: "تأكيد",
                  fontSize: 20,
                  color: Colors.blue,
                ),
                onPressed: onPressedAddCard,
              )
            ],
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.all(10),
                height: height ?? 200,
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: generalColor,
              size: 25,
            ),
            SizedBox(width: 10,),
            textWidget(
              stringText: stringText,
              fontSize: 20,
              // color: Colors.white,
              color: generalColor,
            ),

          ],
        ),
      ),
    );
  }
}

class AddCardWidgetWithoutDialog extends StatelessWidget {
  final void Function() onPressedAddCard;
  final String stringText;
  final double? height;
  AddCardWidgetWithoutDialog({
    Key? key,
    this.height,
    required this.stringText,
    required this.onPressedAddCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:TextButton(
        // ElevatedButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(
          //   Colors.green.shade500,
          // ),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(20),
          ),
        ),
        onPressed: onPressedAddCard,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: generalColor,
              size: 25,
            ),
            SizedBox(width: 10,),
            textWidget(
              stringText: stringText,
              fontSize: 20,
              // color: Colors.white,
              color: generalColor,
            ),

          ],
        ),
      ),
    );
  }
}

class AddCardWidget extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String stringText;
  final void Function() onPressedCancel;
  final void Function() onPressedAddCard;
  final double? height;
  AddCardWidget({
    Key? key,
    this.height,
    required this.title,
    required this.children,
    required this.stringText,
    required this.onPressedCancel,
    required this.onPressedAddCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
        // ElevatedButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(
          //   Colors.green.shade500,
          // ),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(20),
          ),
        ),
        onPressed: () {
          Get.defaultDialog(
            titleStyle: style(fontSize: 20),
            title: title,
            backgroundColor: Colors.white,
            barrierDismissible: true,
            titlePadding: EdgeInsets.all(20),
            actions: [
              TextButton(
                child: textWidget(
                  stringText: "الغاء",
                  fontSize: 20,
                  color: Colors.blue,
                ),
                onPressed: onPressedCancel,
              ),
              TextButton(
                child: textWidget(
                  stringText: "تأكيد",
                  fontSize: 20,
                  color: Colors.blue,
                ),
                onPressed: onPressedAddCard,
              )
            ],
            content: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.all(10),
                height: height ?? 200,
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: generalColor,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            textWidget(
              stringText: stringText,
              fontSize: 20,
              // color: Colors.white,
              color: generalColor,
            ),
          ],
        ),
      ),
    );
  }
}

