// ignore_for_file: library_prefixes, non_constant_identifier_names, prefer_is_empty, avoid_single_cascade_in_expression_statements, unnecessary_brace_in_string_interps
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
import 'package:shs108private/app/modules/private-clinics/views/widgets/PrivateClinicsCard.dart';
import 'package:shs108private/app/modules/private-clinics/views/widgets/PrivateClinicsFilters.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class PrivateClinicsView extends StatefulWidget {
  @override
  State<PrivateClinicsView> createState() => _PharmaciesState();
}

bool internet = true;
bool empty = true;
int index = 1;
int lastPage = 1;
String alphabet = '';
String search_text = '';
Future<List<dynamic>?>? addedData;
bool wait = true;
bool? isProfile = false;
String? profileImage;
int? publicInstitutionId;
double? publiclatitudeVar;
double? publiclongitudeVar;

class _PharmaciesState extends State<PrivateClinicsView> {
  ScrollController scrollController = ScrollController();
  int _selectedIndex = 1;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<List<dynamic>?> allInstituions() async {
    try {
      var headers = {
        'Connection': 'keep-alive',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      var request = http.Request(
        'GET',
        Uri.parse(
          '$url/institutions',
        ),
      );
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        List<dynamic>? data = jsonDecode(await response.stream.bytesToString());
        // List<dynamic>? data = allData['data'];
        return data;
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        return data;
      }
    } on SocketException {
      internet = false;
    } catch (e) {
      print('error = ${e}');
      throw 'حدث خطأ ما';
    }
    setState(() {});
  }

  @override
  initState() {
    addedData = allInstituions();
    allInstituions();
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          print('index = $index');
          print('lastPage = ${lastPage}');

          if (index < lastPage) {
            index++;
            allInstituions();
          } else {}

          // Future.delayed(Duration(milliseconds: 2000), () {
          //   return CircularProgressIndicator();
          // });
          // setState(() {
          //   index = index + 4;
          // });
        }
      });
    super.initState();
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                '$headerIMG',
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          title: textWidget(
            stringText: "العيادات والمراكز والمجمعات الطبيه الخاصة",
            color: Colors.black,
            fontSize: 20,
          ),
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
        body: Column(
          children: [
            PrivateClinicsFilters(),
            Container(
              color: generalColor5,
              height: 50,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ARalphabets.length + 2,
                  itemBuilder: (BuildContext context, int index1) {
                    if (index1 == 0 || index1 == ARalphabets.length + 1) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        height: 50,
                        width: 20,
                        color: Colors.white,
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          color: _selectedIndex == index1
                              ? Colors.blue.shade50
                              : generalColor5,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  index1 != 1
                                      ? alphabet = ARalphabets[index1 - 1]
                                      : alphabet = '';
                                  print(alphabet);
                                  index = 8;
                                  _onSelected(index1);
                                  empty = true;
                                  search_text = '';
                                });
                              },
                              child: textWidget(
                                fontWeight: FontWeight.bold,
                                stringText: ARalphabets[index1 - 1],
                                color: _selectedIndex == index1
                                    ? generalColor5
                                    : Colors.white,
                              )),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: textWidget(
                stringText: "الدليل الشامل",
                color: generalColor5,
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: addedData,
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>?> snapshot) {
                List<dynamic>? insitutions = snapshot.data;
                if (snapshot.hasData) {
                  return Flexible(
                    flex: 1,
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: insitutions?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return PrivateClinicsCard(
                          organizationName: insitutions?[index]["name"],
                          governorate: insitutions![index]["address"] != null
                              ? insitutions[index]["address"]["governorate"]
                                  ["name"]
                              : '',
                          specialist: insitutions[index]["medical_specialties"]
                                  ?.map((e) {
                                    if (e["name"] == 'اخرى') {
                                      return e["extra_info"]?["other"] ?? '';
                                    } else {
                                      return e["name"] ?? '';
                                    }
                                  })
                                  .toList()
                                  .join('\n') ??
                              '',
                          image: insitutions[index]["profile_image"].length != 0
                              ? insitutions[index]["profile_image"][0]
                                  ["image_url"]
                              : '',
                          onPressed: () {
                            publicInstitutionId = insitutions[index]["id"];
                            List<String> images = [
                              "assets/temporary_images_for institutions_covers/1.jpg",
                              "assets/temporary_images_for institutions_covers/2.jpg",
                              "assets/temporary_images_for institutions_covers/3.jpg",
                              "assets/temporary_images_for institutions_covers/4.png",
                              "assets/temporary_images_for institutions_covers/5.jpg",
                            ];
                            if (insitutions[index]["address"] != null) {
                              publiclatitudeVar = insitutions[index]["address"]
                                  ["location"]["latitude"];
                              publiclongitudeVar = insitutions[index]["address"]
                                  ["location"]["longitude"];
                            }
                            print(
                              '@@@@@@@publicInstitutionId = $publicInstitutionId',
                            );
                            setState(() {});
                            Get.toNamed(
                              Routes.PUBLIC_INSTITUTION_PROFILE,
                              arguments: images[index],
                            );
                            //after create pharmacy profile
                          },
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
