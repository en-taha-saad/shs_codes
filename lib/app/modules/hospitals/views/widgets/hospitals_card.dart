import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
// import 'package:sizer/sizer.dart';

double divide = 2.3;

class HospitalCard extends StatelessWidget {
  HospitalCard({
    this.hospitalsName,
    this.governorate,
    required this.image,
    this.onPressed,
  });
  final String? hospitalsName;
  final String? governorate;
  final String? image;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
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
              child: Container(
                padding: EdgeInsets.all(2),
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            (MediaQuery.of(context).size.width * 0.6) / divide,
                        width: (MediaQuery.of(context).size.width) / divide,
                        child: Stack(
                          children: <Widget>[
                            // image != null
                            //     ? CachedNetworkImage(
                            //         imageUrl: "$imageUrl/$image",
                            //         width: (MediaQuery.of(context).size.width) /
                            //             divide,
                            //         placeholder: (context, url) => Image.asset(
                            //           "assets/images/drug-placeholder.jpg",
                            //           fit: BoxFit.cover,
                            //           width:
                            //               (MediaQuery.of(context).size.width) /
                            //                   divide,
                            //         ),
                            //         fit: BoxFit.cover,
                            //         errorWidget: (context, url, error) {
                            //           debugPrint('error: $error');
                            //           return Image.asset(
                            //             "assets/images/drug-placeholder.jpg",
                            //             fit: BoxFit.cover,
                            //             width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width) /
                            //                 divide,
                            //           );
                            //           // return Center(child: Icon(Icons.error));
                            //         },
                            //       )
                            //     :
                            Image.asset(
                              labPlaceHolderIMG,
                              fit: BoxFit.cover,
                              width:
                                  (MediaQuery.of(context).size.width) / divide,
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
                        height:
                            (MediaQuery.of(context).size.width * 0.4) / divide,
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
                              stringText: hospitalsName,
                              fontSize: (22) / divide,
                              fontWeight: FontWeight.bold,
                              color: generalColor4,
                            ),
                            SizedBox(
                              height: 10 / divide,
                            ),
                            textWidget(
                              stringText: "$governorate",
                              fontSize: (18) / divide,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                              color: generalColor4,
                              width:
                                  (MediaQuery.of(context).size.width) / divide,
                              height:
                                  (MediaQuery.of(context).size.width * 0.15) /
                                      divide,
                              child: Center(
                                child: TextButton(
                                  child: textWidget(
                                    stringText: "معلومات المستشفى",
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
          )
        ],
      ),
    );
  }
}
