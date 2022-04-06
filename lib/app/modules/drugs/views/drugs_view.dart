// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, prefer_is_empty, unnecessary_brace_in_string_interps, curly_braces_in_flow_control_structures
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/drawer/drawer.dart';
// ignore: library_prefixes
import 'package:shs108private/app/modules/drugs/drugs_model.dart' as userModel;
import 'package:shs108private/app/modules/drugs/views/widgets/drug_card.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugsSearch.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugs_search_bar.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class DrugsView extends StatefulWidget {
  @override
  State<DrugsView> createState() => _DrugsViewState();
}

bool internet = true;
bool empty = true;
bool wait = true;
int pageindex = 1;
int lastPage = 1;
String alphabet = '';
String search_text = '';
List<userModel.SingleDrug>? AddedData = [];

class _DrugsViewState extends State<DrugsView> {
  ScrollController scrollController = ScrollController();
  Future<List<userModel.SingleDrug>?> englishDrugs() async {
    try {
      var headers = {'Connection': 'keep-alive'};

      var request = http.MultipartRequest(
          'POST',
          Uri.parse('$url'
              '/drugs'));
      request.fields.addAll({
        'language_code': 'en',
        'items_per_page': '6',
        'page': '$pageindex',
        'alphabet': '$alphabet',
        'search_text': '$search_text'
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var allData = jsonDecode(await response.stream.bytesToString());
        List<dynamic>? data = allData['data'];
        lastPage = allData['last_page'];
        print('last page = $lastPage');
        AddedData?.addAll(
            data!.map((e) => userModel.SingleDrug.fromJson(e)).toList());
        print("data : ${AddedData!.length}");
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
        // return data!.map((e) => userModel.SinglePharmacy.fromJson(e)).toList();
      } else {}
    } on SocketException {
      internet = false;
    } catch (e) {
      throw 'حدث خطأ ما';
    }
    // var headers = {'Connection': 'keep-alive'};
    //
    // var request = http.MultipartRequest('POST', Uri.parse('$url/drugs'));
    // request.fields.addAll({
    //   'language_code': 'en',
    //   'items_per_page': '$index',
    //   // 'page': '',
    //   'alphabet': '$alphabet',
    //   'search_text': '$search_text'
    // });
    // request.headers.addAll(headers);
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   List<dynamic>? data =
    //       jsonDecode(await response.stream.bytesToString())['data'];
    //   // setState(() {
    //   //   if(data!.isEmpty)
    //   //     empty= true;
    //   //   else
    //   //     empty = false;
    //   // });
    //   return data!.map((e) => userModel.SingleDrug.fromJson(e)).toList();
    // } else {
    //   throw 'Error has occurred';
    // }
  }

  List<DrugsSearch>? list = [];

  onfindSearchDrugs() async {
    await Dio()
        .get(
      "https://shs-iq.com/api/api/drugs",
      // queryParameters: {"filter": filter},
    )
        .then((value) {
      debugPrint('list = $list');
      debugPrint('value.data = ${value.data}');
      list = DrugsSearch.fromJsonList(value.data);
      setState(() {});
      debugPrint('11@@@list = $list');
      debugPrint('222@@@value.data = ${value.data}');
    }).onError((_, __) {
      return;
    });
  }

  @override
  initState() {
    onfindSearchDrugs();
    englishDrugs();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('index = $pageindex');
        print('AddedData!.length = ${AddedData!.length}');
        print('lastPage = ${lastPage}');
        if (pageindex < lastPage) {
          print('بعد لازم');
          pageindex++;
          englishDrugs();
        } else {}
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
              stringText: "الادوية",
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
              DrugSearchBar(
                onPressed: () {
                  setState(() {
                    // ignore: unnecessary_null_comparison
                    if (searchText.text != null) {
                      search_text = searchText.text;
                      pageindex = 1;
                      AddedData = [];
                      _selectedIndex = 1;
                      alphabet = '';
                      englishDrugs();
                    } else
                      search_text = '';
                  });
                },
              ),
              Container(
                color: generalColor,
                height: 50,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: alphabets.length + 2,
                      itemBuilder: (BuildContext context, int index1) {
                        if (index1 == 0 || index1 == alphabets.length + 1) {
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
                                  : generalColor,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      index1 != 1
                                          ? alphabet = alphabets[index1 - 1]
                                          : alphabet = '';
                                      print(alphabet);
                                      pageindex = 1;
                                      _onSelected(index1);
                                      empty = true;
                                      wait = true;
                                      search_text = '';
                                      searchText.text = '';
                                      AddedData = [];
                                      englishDrugs();
                                    });
                                  },
                                  child: textWidget(
                                    stringText: alphabets[index1 - 1],
                                    color: _selectedIndex == index1
                                        ? generalColor
                                        : Colors.white,
                                  )),
                            ),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(height: 10),
              wait
                  ? CircularProgressIndicator()
                  : empty
                      ? Container(
                          child: textWidget(stringText: "لا يوجد ادوية"),
                        )
                      : Flexible(
                          flex: 1,
                          child: GridView.builder(
                            controller: scrollController,
                            itemCount: AddedData!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.845,
                            ),
                            itemBuilder: (context, index) => DrugCard(
                              genericName: AddedData![index]
                                  .drugDescriptions![0]
                                  .genericName,
                              packageSize: AddedData![index]
                                  .drugDescriptions![0]
                                  .packageSize,
                              strength: AddedData![index]
                                  .drugDescriptions![0]
                                  .strength,
                              tradeName: AddedData![index]
                                  .drugDescriptions![0]
                                  .tradeName,
                              image: AddedData![index]
                                  .drugDescriptions![0]
                                  .image
                                  ?.imageUrl,
                              onPressed: () {
                                Get.toNamed(
                                  Routes.DRUG_PROFILE,
                                  arguments: list?[index],
                                );
                              },
                            ),
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
