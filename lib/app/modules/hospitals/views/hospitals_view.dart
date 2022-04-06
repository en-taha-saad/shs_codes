// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugsSearch.dart';
import 'package:shs108private/app/modules/hospitals/views/widgets/hospitalsFilters.dart';
import 'package:shs108private/app/modules/hospitals/views/widgets/hospitals_card.dart';
import 'package:shs108private/app/modules/hospitals/views/widgets/staticHospitals.dart';

bool empty = true;
int index = 8;
String alphabet = '';
String search_text = '';

class HospitalsView extends StatefulWidget {
  const HospitalsView({Key? key}) : super(key: key);

  @override
  _HospitalViewState createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalsView> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
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
              stringText: "المستشفيات الخاصة",
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
              HospitalsFilters(),
              Container(
                  color: generalColor4,
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
                                    : generalColor4,
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
                                        searchText.text = '';
                                      });
                                    },
                                    child: textWidget(
                                      fontWeight: FontWeight.bold,
                                      stringText: ARalphabets[index1 - 1],
                                      color: _selectedIndex == index1
                                          ? generalColor4
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
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: textWidget(
                  stringText: "الدليل الشامل",
                  color: generalColor4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 1,
                child: GridView.builder(
                    controller: scrollController,
                    itemCount: hospitalsImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        HospitalCard(
                          image: hospitalsImages[index],
                          hospitalsName: hospitalsNames[index],
                          governorate: "بغداد",
                        )),
                // child: FutureBuilder<List<userModel.SingleDoctor>?>(
                //   future: laboratories(),
                //   builder: (_, AsyncSnapshot<List<userModel.SingleDoctor>?> snapshot) {
                //     List<userModel.SingleDoctor>? data = snapshot.data;
                //     // print(snapshot.data);
                //     if (snapshot.data != null) {
                //       print('fetched');
                //       return GridView.builder(
                //         controller: scrollController,
                //         itemCount: data!.length,
                //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //           childAspectRatio: 1.2,
                //         ),
                //         itemBuilder: (context, index) =>
                //             LaboratoryCard(
                //               laboratoryName: "${snapshot.data![index]
                //                   .firstName} ${snapshot.data![index]
                //                   .secondName}",
                //               governorate:"بغداد",
                //               // snapshot.data![index]
                //               //     .addresses![0].governorate!.name,
                //               city: "المنصور",
                //               // snapshot.data![index]
                //               //     .addresses![0].city!.name,
                //               image: snapshot.data![index]
                //                   .image!=null?snapshot.data![index]
                //                   .image!.imageUrl : snapshot.data![index].image,
                //               onPressed: () {
                //                 //after create laboratory profile
                //               },
                //             ),
                //       );
                //     }
                //     else if (snapshot.hasError) {
                //       print('snapshot.hasError = ${snapshot.error}');
                //       return Center(
                //         child: Text('error'),
                //       );
                //     } else {
                //       print(snapshot.error);
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //   },
                // ),
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
