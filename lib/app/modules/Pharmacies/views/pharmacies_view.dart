// ignore_for_file: library_prefixes, non_constant_identifier_names, prefer_is_empty, avoid_single_cascade_in_expression_statements, unnecessary_brace_in_string_interps
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/Pharmacies/phar_model.dart'
    as userModel;
import 'package:shs108private/app/modules/Pharmacies/views/widgets/pharmaciesFilters.dart';
import 'package:shs108private/app/modules/Pharmacies/views/widgets/pharmacy_card.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugsSearch.dart';

class PharmaciesView extends StatefulWidget {
  @override
  State<PharmaciesView> createState() => _PharmaciesState();
}

bool internet = true;
bool empty = true;
int index = 1;
int lastPage = 1;
String alphabet = '';
String search_text = '';
List<userModel.SinglePharmacy>? AddedData = [];
bool wait = true;

class _PharmaciesState extends State<PharmaciesView> {
  ScrollController scrollController = ScrollController();
  Future<List<userModel.SinglePharmacy>?> pharmacies() async {
    try {
      var headers = {
        'Connection': 'keep-alive',
      };

      var request = http.MultipartRequest(
          'GET', Uri.parse('$url/pharmacies/8?page=$index'));
      // var request = http.MultipartRequest('GET', Uri.parse('$url/pharmacies/$index'));
      // request.fields.addAll({
      // 'language_code': 'en',
      // 'items_per_page': '10',
      //   'page': '$index',
      // 'alphabet': '$alphabet',
      // 'search_text': '$search_text'
      // });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var allData = jsonDecode(await response.stream.bytesToString());
        List<dynamic>? data = allData['data'];
        lastPage = allData['last_page'];
        print('last page = $lastPage');
        AddedData?.addAll(
            data!.map((e) => userModel.SinglePharmacy.fromJson(e)).toList());
        setState(() {
          wait = false;
          internet = true;
        });
        if (AddedData!.length == 0) {
          setState(() {
            empty = true;
          });
        } else {
          setState(() {
            empty = false;
          });
        }
        Future.microtask(() {
          setState(() {});
        });
        return AddedData;
      } else {
        print(response.statusCode);
      }
    } on SocketException {
      internet = false;
    } catch (e) {
      throw 'حدث خطأ ما';
    }
    setState(() {});
  }

  @override
  initState() {
    pharmacies();
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          print('index = $index');
          print('AddedData!.length = ${AddedData!.length}');
          print('lastPage = ${lastPage}');

          if (index < lastPage) {
            index++;
            pharmacies();
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
              stringText: "الصيدليات",
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
              // CategoriesSearchBar(
              //   textHint: "بحث عن صيدليات . . .",
              //   onPressed: () {
              //     setState(() {
              //       if (categoriesSearchText.text != null) {
              //         search_text = categoriesSearchText.text;
              //         _selectedIndex = 1;
              //         alphabet = '';
              //       } else
              //         search_text = '';
              //     });
              //   },
              // ),
              PharmaciesFilters(),
              Container(
                  color: generalColor1,
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
                                    : generalColor1,
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
                                        wait = true;
                                        search_text = '';
                                        searchText.text = '';
                                      });
                                    },
                                    child: textWidget(
                                      fontWeight: FontWeight.bold,
                                      stringText: ARalphabets[index1 - 1],
                                      color: _selectedIndex == index1
                                          ? generalColor1
                                          : Colors.white,
                                    )),
                              ),
                            );
                          }
                        }),
                  )),
              SizedBox(
                height: 10,
              ),
              internet
                  ? wait
                      ? CircularProgressIndicator()
                      : empty
                          ? Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Center(
                                child: textWidget(
                                    fontSize: 25,
                                    stringText: "لا يوجد صيدليات"),
                              ),
                            )
                          : Flexible(
                              flex: 1,
                              child: GridView.builder(
                                controller: scrollController,
                                itemCount: AddedData!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // childAspectRatio: 1.2,
                                ),
                                itemBuilder: (context, index) => PharmacyCard(
                                  pharmacyName: AddedData?[index].name,
                                  governorate: AddedData![index]
                                      .addresses![0]
                                      .governorate!
                                      .name,
                                  city: AddedData![index]
                                      .addresses![0]
                                      .city!
                                      .name,
                                  image: AddedData![index].image != null
                                      ? AddedData![index].image!.imageUrl
                                      : AddedData![index].image,
                                  onPressed: () {
                                    //after create pharmacy profile
                                  },
                                ),
                              ),
                            )
                  : Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(
                        child: textWidget(
                            fontSize: 25,
                            stringText: "يرجى االاتصال بالانترنت"),
                      ),
                    ),
            ],
          ),
        ));
  }

  int _selectedIndex = 1;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
}
