import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class ShowListWidget extends StatelessWidget {
  final List<Widget> children3;
  final List<Widget>? children2;
  final String stringText;
  final String title;
  final void Function() onPressedCancel;
  final void Function() onPressedRemove;
  final void Function() onPressedEditCard;
  final void Function()? onPressedEditCardBeforeDialog;
  final double? height;

  ShowListWidget({
    Key? key,
    this.children2,
    this.height,
    required this.children3,
    required this.stringText,
    required this.title,
    required this.onPressedCancel,
    required this.onPressedRemove,
    required this.onPressedEditCard,
    this.onPressedEditCardBeforeDialog,
  }) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     color: Colors.grey[200],
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(24),
  //     ),
  //     child: RoundedExpansionTile(
  //       rotateTrailing: true,
  //       trailing: IconButton(
  //         icon: Icon(
  //           Icons.keyboard_arrow_down,
  //           color: Colors.black,
  //           size: 25,
  //         ),
  //         onPressed: () {},
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(28),
  //       ),
  //       childrenPadding: EdgeInsets.all(30),
  //       contentPadding: EdgeInsets.all(20),
  //       dense: true,
  //       tileColor: Colors.grey[350],
  //       visualDensity: VisualDensity.compact,
  //       onTap: () {},
  //       title: textWidget(
  //         stringText: stringText,
  //         fontSize: 20,
  //         color: Colors.black,
  //         fontWeight: FontWeight.w900,
  //       ),
  //       children: [
  //         SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: children2 ?? [],
  //           ),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             TextButton(
  //               child: textWidget(
  //                 stringText: 'تعديل',
  //                 fontSize: 20,
  //               ),
  //               onPressed: () {
  //                 Get.defaultDialog(
  //                   titleStyle: style(fontSize: 20),
  //                   title: title,
  //                   backgroundColor: Colors.white,
  //                   barrierDismissible: true,
  //                   titlePadding: EdgeInsets.all(20),
  //                   actions: [
  //                     TextButton(
  //                       child: textWidget(
  //                         stringText: "الغاء",
  //                         fontSize: 20,
  //                         color: Colors.blue,
  //                       ),
  //                       onPressed: onPressedCancel,
  //                     ),
  //                     TextButton(
  //                       child: textWidget(
  //                         stringText: "تأكيد",
  //                         fontSize: 20,
  //                         color: Colors.blue,
  //                       ),
  //                       onPressed: onPressedEditCard,
  //                     )
  //                   ],
  //                   content: Directionality(
  //                     textDirection: TextDirection.rtl,
  //                     child: Container(
  //                       margin: EdgeInsets.all(10),
  //                       height: height ?? 200,
  //                       width: 400,
  //                       child: SingleChildScrollView(
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: children3,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //             TextButton(
  //               child: textWidget(
  //                 stringText: 'حذف',
  //                 fontSize: 20,
  //               ),
  //               onPressed: onPressedRemove,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: RoundedExpansionTile(
        rotateTrailing: true,
        trailing: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {},
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        childrenPadding: EdgeInsets.all(30),
        contentPadding: EdgeInsets.all(20),
        dense: true,
        tileColor: Colors.grey[350],
        visualDensity: VisualDensity.compact,
        onTap: () {},
        title: textWidget(
          stringText: stringText,
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children2 ?? [],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: textWidget(
                  stringText: 'تعديل',
                  fontSize: 20,
                ),
                onPressed: () {
                  if(onPressedEditCardBeforeDialog!=null){
                    onPressedEditCardBeforeDialog!();
                  }
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
                        onPressed: onPressedEditCard,
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
                            children: children3,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                child: textWidget(
                  stringText: 'حذف',
                  fontSize: 20,
                ),
                onPressed: onPressedRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShowListWidget2 extends StatelessWidget {
  final List<Widget>? children2;
  final String stringText;
  final double? height;

  ShowListWidget2({
    Key? key,
    this.children2,
    this.height,
    required this.stringText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: RoundedExpansionTile(
        rotateTrailing: true,
        trailing: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {},
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        childrenPadding: EdgeInsets.all(30),
        contentPadding: EdgeInsets.all(20),
        dense: true,
        tileColor: Colors.grey[350],
        visualDensity: VisualDensity.compact,
        onTap: () {},
        title: textWidget(
          stringText: stringText,
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w900,
        ),
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children2 ?? [],
            ),
          ),
        ],
      ),
    );
  }
}