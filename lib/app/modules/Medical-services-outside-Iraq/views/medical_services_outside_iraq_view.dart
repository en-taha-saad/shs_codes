// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/Medical-services-outside-Iraq/views/widgets/MedicalServicesOutsideCard.dart';
import 'package:shs108private/app/modules/Medical-services-outside-Iraq/views/widgets/MedicalServicesOutsideFilters.dart';
import 'package:shs108private/app/modules/Medical-services-outside-Iraq/views/widgets/MedicalServicesOutsideStatic.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugsSearch.dart';

bool empty = true;
int index = 8;
String alphabet = '';
String search_text = '';

class MedicalServicesOutsideIraqView extends StatefulWidget {
  const MedicalServicesOutsideIraqView({Key? key}) : super(key: key);

  @override
  _MedicalServicesOutsideIraqViewState createState() =>
      _MedicalServicesOutsideIraqViewState();
}

class _MedicalServicesOutsideIraqViewState
    extends State<MedicalServicesOutsideIraqView> {
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
              stringText: "المستشفيات والخدمات العلاجية خارج العراق",
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
              MedicalServicesOutsideFilters(),
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
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 1,
                child: GridView.builder(
                    controller: scrollController,
                    itemCount: medicalServicesOutsideImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.2,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        MedicalServicesOutsideCard(
                          image: medicalServicesOutsideImages[index],
                          organizationName: "الوطني المركزي",
                          enOrganizationName: "Central Hospital",
                          governorate: "تركيا اسطنبول",
                        )),
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
