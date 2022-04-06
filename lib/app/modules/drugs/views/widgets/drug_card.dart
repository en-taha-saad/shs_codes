import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
// import 'package:sizer/sizer.dart';

double divide = 1;

class DrugCard extends StatelessWidget {
  DrugCard({
    this.tradeName,
    this.genericName,
    this.strength,
    this.packageSize,
    required this.image,
    this.onPressed,
  });
  final String? tradeName;
  final String? genericName;
  final String? strength;
  final String? packageSize;
  final String? image;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        // height: MediaQuery.of(context).size.width*1.2,
        decoration: BoxDecoration(
          color: generalColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: (5) / divide,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Column(
            children: [
              SizedBox(
                  height: (MediaQuery.of(context).size.width * 0.5) / divide,
                  width: (MediaQuery.of(context).size.width) / divide,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: (MediaQuery.of(context).size.width * 0.5) / divide,
                        width: (MediaQuery.of(context).size.width) / divide,
                        color: Colors.white,
                      ),
                      CachedNetworkImage(
                        imageUrl: "$imageUrl/$image",
                        width: (MediaQuery.of(context).size.width) / divide,
                        placeholder: (context, url) => Image.asset(
                          placeholderImageIMG,
                          fit: BoxFit.cover,
                          width: (MediaQuery.of(context).size.width) / divide,
                        ),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          debugPrint('error: $error');
                          return Icon(Icons.error);
                        },
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black38,
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 50.0, horizontal: 20.0),
                            child: Container()),
                      ),
                    ],
                  )),
              Container(
                  height: (MediaQuery.of(context).size.width * 0.65) / divide,
                  color: Colors.white,
                  width: (MediaQuery.of(context).size.width) / divide,
                  padding: EdgeInsets.all(0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10 / divide,
                      ),
                      textWidget(
                        stringText: tradeName,
                        fontSize: (22) / divide,
                        fontWeight: FontWeight.bold,
                        color: generalColor,
                      ),
                      SizedBox(
                        height: 10 / divide,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            drugProperty(
                                property: "الاسم العلمي",
                                value: genericName,
                                context: context,
                                padding: 0),
                            drugProperty(
                                property: "التركيز",
                                context: context,
                                value: strength,
                                padding: 0),
                            drugProperty(
                                context: context,
                                property: "حجم العبوة",
                                value: packageSize,
                                padding: 0),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        color: generalColor,
                        width: (MediaQuery.of(context).size.width) / divide,
                        height:
                            (MediaQuery.of(context).size.width * 0.15) / divide,
                        child: Center(
                          child: TextButton(
                            child: textWidget(
                              stringText: "معلومات الدواء",
                              color: Colors.white,
                              fontSize: (20) / divide,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: onPressed,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget drugProperty({
  String? property,
  String? value,
  required BuildContext context,
  Color bgColor = Colors.white,
  TextDirection textDirection = TextDirection.rtl,
  double padding = 5,
}) {
  return Container(
    color: bgColor,
    alignment: Alignment.center,
    padding: EdgeInsets.all(padding),
    child: Directionality(
      textDirection: textDirection,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 3) / divide,
            height: (MediaQuery.of(context).size.width / 10) / divide,
            alignment: textDirection == TextDirection.rtl
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: textWidget(
                stringText: property,
                fontSize: (15) / divide,
                color: generalColor,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2) / divide,
            height: (MediaQuery.of(context).size.width / 10) / divide,
            alignment: textDirection == TextDirection.rtl
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: textWidget(
              stringText: value,
              fontSize: (15) / divide,
            ),
          ),
        ],
      ),
    ),
  );
}

class DrugClass {
  String? tradeName;
  String? strength;
  String? genericName;
  String? packageSize;

  DrugClass({
    this.tradeName,
    this.strength,
    this.genericName,
    this.packageSize,
  });
}
