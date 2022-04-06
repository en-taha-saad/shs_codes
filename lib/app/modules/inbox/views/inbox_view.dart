import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/header_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

import '../controllers/inbox_controller.dart';
import 'inbox_static.dart';

class InboxView extends GetView<InboxController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Stack(
            children: [
              HeaderTheme()
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: textWidget(
            stringText: 'الإشعارات',
            color: Colors.black,
            fontSize: 25,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: BottomTheme(
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: inboxTitles.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index != inboxTitles.length) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: inboxIsRead[index]
                                ? Colors.white
                                : Colors.blue[50],
                            border: Border.all(color: Colors.black12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: (1),
                                blurRadius: 7,
                                offset:
                                    Offset(-4, 4), // changes position of
                                // shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                              title: textWidget(
                                stringText: inboxTitles[index],
                                fontWeight: FontWeight.bold,
                              ),
                              leading: Icon(inboxIcons[index]),
                              subtitle: textWidget(
                                stringText: inboxDate[index],
                              )),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        child: textWidget(
                          textDecoration: TextDecoration.underline,
                          stringText: "الأرشيف",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: generalColor,
                        )
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
