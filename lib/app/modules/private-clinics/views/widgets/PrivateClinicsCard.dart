// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

double divide = 2.3;

class PrivateClinicsCard extends StatelessWidget {
  PrivateClinicsCard({
    this.organizationName,
    this.specialist,
    this.governorate,
    required this.image,
    this.onPressed,
  });
  final String? organizationName;
  final String? specialist;
  final String? governorate;
  final String? image;
  final Callback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: (((MediaQuery.of(context).size
      //     .height+MediaQuery.of
      //   (context).size.width)/5) / 4.5) / divide,
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
                          (MediaQuery.of(context).size.width * 0.5) / divide,
                      width: (MediaQuery.of(context).size.width) / divide,
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: "$imageUrl/$image",
                            width: (MediaQuery.of(context).size.width) / divide,
                            imageBuilder: (context, imageProvider) =>
                                Image.network(
                              '$imageUrl/$image',
                              fit: BoxFit.cover,
                            ),
                            placeholder: (context, url) => Image.asset(
                              "assets/general_for_two_apps/shared/placeholder_image.jpg",
                              fit: BoxFit.cover,
                              width:
                                  (MediaQuery.of(context).size.width) / divide,
                            ),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              debugPrint('error: $error');
                              return Image.asset(
                                "assets/general_for_two_apps/shared/placeholder_image.jpg",
                                fit: BoxFit.cover,
                                width: (MediaQuery.of(context).size.width) /
                                    divide,
                              );
                              // return Center(child: Icon(Icons.error));
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
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height:
                            (MediaQuery.of(context).size.width * 0.62) / divide,
                        color: Colors.white,
                        width: (MediaQuery.of(context).size.width) / divide,
                        padding: EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            textWidget(
                              stringText: organizationName,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: generalColor5,
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: specialist,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              color: Colors.black,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 10),
                            textWidget(
                              stringText: "$governorate",
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.all(0),
                              color: generalColor5,
                              width:
                                  (MediaQuery.of(context).size.width) / divide,
                              height:
                                  (MediaQuery.of(context).size.width * 0.15) /
                                      divide,
                              child: Center(
                                child: TextButton(
                                  child: textWidget(
                                    stringText: "معلومات العيادة",
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
