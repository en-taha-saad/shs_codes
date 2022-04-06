import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';

import 'package:shs108private/app/global/widgets/text_widget.dart';
// ignore: library_prefixes
import 'package:shs108private/app/modules/drugs/views/widgets/drug_card.dart';
import 'package:shs108private/app/modules/home/views/widgets/drugs_search_bar.dart';

class DrugProfileView extends StatefulWidget {
  @override
  State<DrugProfileView> createState() => _DrugProfileViewState();
}

class _DrugProfileViewState extends State<DrugProfileView> {
  DrugsSearch i = Get.arguments;
  int? id;
  String? barcode;
  bool isNavigate = false;
  getBarcode() async {
    var response = await Dio().get(
      "https://shs-iq.com/api/api/drug/qrcode/$id",
    );
    if (response.statusCode == 200) {
      debugPrint('response.data["data"] = ${response.data["data"]}');
      barcode = response.data["data"];
      setState(() {});
    } else {}
  }

  Future<DrugsSearch> onfindSearchDrugs0() async {
    var response = await Dio().get(
      "https://shs-iq.com/api/api/drug/$id",
    );
    if (response.statusCode == 200) {
      return DrugsSearch.fromJson(response.data[0]);
    } else {
      return DrugsSearch.fromJson(response.data[0]);
    }
  }

  @override
  void initState() {
    id = i.id;
    getBarcode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DrugsSearch>(
        future: onfindSearchDrugs0(),
        builder: (_, AsyncSnapshot<DrugsSearch> snapshot) {
          if (snapshot.hasData) {
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
                  title: snapshot.data?.drugDescriptions?.length == 2
                      ? textWidget(
                          stringText:
                              "معلومات دواء ${snapshot.data?.drugDescriptions![1].tradeName}",
                          color: Colors.black,
                          fontSize: 20,
                        )
                      : textWidget(
                          stringText:
                              "معلومات دواء ${snapshot.data?.drugDescriptions![0].tradeName}",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                  // title: textWidget(
                  //   stringText:
                  //       "معلومات دواء ${snapshot.data?.drugDescriptions![1].tradeName}",
                  //   color: Colors.black,
                  //   fontSize: 20,
                  // ),
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
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (id! > 1) {
                                      getBarcode();
                                      id = id! - 1;
                                      setState(() {});
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(generalColor),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder(side: BorderSide.none),
                                    ),
                                  ),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    id = id! + 1;
                                    getBarcode();

                                    setState(() {});
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(generalColor),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                      CircleBorder(side: BorderSide.none),
                                    ),
                                  ),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "$imageUrl/${snapshot.data?.drugDescriptions?[0].image?.imageUrl}",
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: 300,
                                      width: 270,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            "$imageUrl/${snapshot.data?.drugDescriptions?[0].image?.imageUrl}",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return Container(
                                      height: 300,
                                      width: 270,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            placeholderImageIMG,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      height: 300,
                                      width: 270,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            placeholderImageIMG,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: SvgPicture.network(
                                    barcode ?? '',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 190,
                                  height: 80,
                                  color: Color(0xff44C29A),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SvgPicture.asset(
                                          //   "assets/general_for_two_apps/selectsIcons/closestPharmacy.svg",
                                          //   width: 50,
                                          //   height: 50,
                                          //   color: Colors.white,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          textWidget(
                                            stringText: "ايجاد الدواء",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                          textWidget(
                                            stringText: "في اقرب صيدلية",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(width: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 190,
                                  height: 80,
                                  color: Color(0xffF02A42),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SvgPicture.asset(
                                          //   "assets/general_for_two_apps/selectsIcons/closestHospital.svg",
                                          //   width: 50,
                                          //   height: 50,
                                          //   color: Colors.white,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          textWidget(
                                            stringText: "توصيل الدواء",
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textWidget(
                                            stringText: "منزليا",
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 190,
                                height: 80,
                                color: generalColor,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_shopping_cart,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      textWidget(
                                        stringText: "إضافة الى السلة",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          (snapshot.data?.drugDescriptions?.length)! > 1
                              ? Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      color: generalColor,
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      alignment: Alignment.center,
                                      child: textWidget(
                                          stringText: "معلومات الدواء",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    drugProperty(
                                      property: "الاسم التجاري",
                                      value: snapshot
                                          .data?.drugDescriptions![1].tradeName,
                                      context: context,
                                    ),
                                    drugProperty(
                                        property: "التركيز",
                                        context: context,
                                        value: snapshot.data
                                            ?.drugDescriptions![1].strength,
                                        bgColor: Colors.black12),
                                    drugProperty(
                                      property: "الاسم العلمي",
                                      value: snapshot.data?.drugDescriptions![1]
                                          .genericName,
                                      context: context,
                                    ),
                                    drugProperty(
                                        property: "الشكل الصيدلاني",
                                        value: snapshot.data
                                            ?.drugDescriptions![1].dosageForm,
                                        context: context,
                                        bgColor: Colors.black12),
                                    drugProperty(
                                      context: context,
                                      property: "طريقة أخذ الدواء",
                                      value: snapshot.data?.drugDescriptions![1]
                                          .routeOfAdministration,
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "حجم العبوة",
                                      bgColor: Colors.black12,
                                      value: snapshot.data?.drugDescriptions![1]
                                          .packageSize,
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "المصنعين",
                                      value: snapshot.data?.drugDescriptions![1]
                                          .manufacturer,
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "مزودي الخدمة",
                                      value: snapshot.data?.drugDescriptions![1]
                                                  .distributor !=
                                              'N/A'
                                          ? snapshot.data?.drugDescriptions![1]
                                              .distributor
                                          : 'غير متاح',
                                      bgColor: Colors.black12,
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "رقم التسجيل الوزاره",
                                      value: snapshot.data?.mohCode != 'N/A'
                                          ? snapshot.data?.mohCode
                                          : 'غير متاح',
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "رمز GS1",
                                      bgColor: Colors.black12,
                                      value: snapshot.data?.gs1Code != 'N/A'
                                          ? snapshot.data?.gs1Code
                                          : 'غير متاح',
                                    ),
                                    drugProperty(
                                      context: context,
                                      property: "رمز SHS",
                                      value: snapshot.data?.shsCode != 'N/A'
                                          ? snapshot.data?.shsCode
                                          : 'غير متاح',
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 20),
                          Container(
                            color: generalColor,
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            alignment: Alignment.center,
                            child: textWidget(
                              stringText: "Drug Information",
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          drugProperty(
                            property: "Trade Name",
                            context: context,
                            value:
                                snapshot.data?.drugDescriptions![0].tradeName,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                              property: "Strength",
                              context: context,
                              textDirection: TextDirection.ltr,
                              value:
                                  snapshot.data?.drugDescriptions?[0].tradeName,
                              bgColor: Colors.black12),
                          drugProperty(
                            property: "Generic Name",
                            value:
                                snapshot.data?.drugDescriptions?[0].genericName,
                            context: context,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            property: "Dosage Form",
                            value:
                                snapshot.data?.drugDescriptions?[0].dosageForm,
                            context: context,
                            bgColor: Colors.black12,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "Route of Administration",
                            value: snapshot.data?.drugDescriptions?[0]
                                .routeOfAdministration,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "Package Size",
                            bgColor: Colors.black12,
                            value:
                                snapshot.data?.drugDescriptions?[0].packageSize,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "Manufacturer",
                            value: snapshot
                                .data?.drugDescriptions?[0].manufacturer,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "Distributor",
                            bgColor: Colors.black12,
                            value:
                                snapshot.data?.drugDescriptions?[0].distributor,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: ".MOH Registeration NO",
                            value: snapshot.data?.mohCode,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "GS1 Code",
                            bgColor: Colors.black12,
                            value: snapshot.data?.gs1Code,
                            textDirection: TextDirection.ltr,
                          ),
                          drugProperty(
                            context: context,
                            property: "SHS Code",
                            value: snapshot.data?.shsCode,
                            textDirection: TextDirection.ltr,
                          ),
                          SizedBox(height: 20),
                          Container(
                            color: generalColor,
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            alignment: Alignment.center,
                            child: textWidget(
                                stringText: "الإجراءات الإحترازية",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            alignment: Alignment.center,
                            child: textWidget(
                              stringText:
                                  "لضمان سلامتك واستفادتك الكاملة من الدواء؛ نأمل اتباع تعليمات الطبيب وإرشادات الصيدلي والاطلاع على التعليمات في النشرة الداخلية المرفقة مع الدواء",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: textWidget(stringText: snapshot.error.toString()));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
