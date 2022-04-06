// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/noAccount.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/child_personal_section/views/child_personal_section_view.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/modules/profile/user_model.dart' as usermodel;
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class FamilyInformationView extends StatefulWidget {
  @override
  _FamilyInformationViewState createState() => _FamilyInformationViewState();
}

class _FamilyInformationViewState extends State<FamilyInformationView> {
  @override
  void initState() {
    fetchChildProfileVar = fetchChildProfile();
    print("saved token $savedToken");
    super.initState();
  }

  late Future<List<usermodel.ChildProfileRelateds>?> fetchChildProfileVar;
  String? relatedNationalities2;
  String? relatedHandicaps;
  String? relatedChronicDiseases;
  String? relatedCountry2;
  String? relatedGov2;
  String? relatedDestrict2;
  String? relatedGenderSex;
  DateTime? relatedBirthDate;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                headerIMG,
                fit: BoxFit.cover,
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          title: textWidget(
            stringText: 'أفراد العائلة',
            color: Colors.black,
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  footerIMG,
                  fit: BoxFit.cover,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              savedToken == null
                  ? noAccount()
                  : Center(
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 110.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade500),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(20)),
                              ),
                              onPressed: () {
                                Get.toNamed(
                                  Routes.FAMILY_SIGNUP,
                                  arguments: getParentId,
                                );
                              },
                              child: textWidget(
                                stringText: 'أضف افراد الى عائلتك',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 110.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.red.shade500),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(20)),
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  contentPadding: EdgeInsets.all(20),
                                  titleStyle: style(fontSize: 20),
                                  title: 'ربط حسابات افراد العائلة',
                                  backgroundColor: Colors.white,
                                  barrierDismissible: false,
                                  titlePadding: EdgeInsets.all(10),
                                  content: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Container(
                                      height: 300,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.blue[200]!,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.lightBlue[50],
                                            ),
                                            width: 450,
                                            padding: EdgeInsets.all(20),
                                            child: textWidget(
                                              stringText:
                                                  'تنويه:\nعند ربط افراد العائلة سيتم تسهيل اجراء الحجوزات وطلب الخدمات وتبادل المعلومات والحصول على الخدمات العائلية بين افراد العائله',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: SizeConfig()
                                                        .heightSize(context, 7),
                                                    width: 80,
                                                    child: textWidget(
                                                      stringText:
                                                          'اضافة عن طريق الرقم الشخصي',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: SizeConfig()
                                                        .heightSize(context, 5),
                                                    width: 80,
                                                    child: textWidget(
                                                      stringText: 'الصلة',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  TextFieldForm(
                                                    height: 60,
                                                    width: 200,
                                                    obscureText: false,
                                                    name: 'personalId',
                                                    keyboardType:
                                                        TextInputType.text,
                                                    labelText: 'الرقم الشخصي',
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                  ),
                                                  TextFieldForm(
                                                    height: 60,
                                                    width: 200,
                                                    obscureText: false,
                                                    name: 'relationShip',
                                                    keyboardType:
                                                        TextInputType.text,
                                                    labelText: 'الصلة',
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xff0000FE),
                                        ),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(15)),
                                      ),
                                      child: textWidget(
                                        stringText: "الغاء",
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xff0000FE),
                                        ),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(15)),
                                      ),
                                      child: textWidget(
                                        stringText: "تأكيد الاضافة",
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                );
                              },
                              child: textWidget(
                                stringText: 'ربط حساب افراد العائلة',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            color: Colors.grey.shade100,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                getImage != null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                          '$imageUrl/$getImage',
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                          defaultAvatarIMG,
                                        ),
                                      ),
                                SizedBox(width: 20),
                                textWidget(
                                  stringText:
                                      '${getFirstName ?? ''} ${getSecondName ?? ''} ${getSurName ?? ''}',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    MaterialButton(
                                      child: textWidget(
                                        stringText: 'التاريخ المرضي',
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ),
                                    MaterialButton(
                                      child: textWidget(
                                        stringText: 'الحجوزات',
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 400,
                            child: FutureBuilder<
                                List<usermodel.ChildProfileRelateds?>?>(
                              future: fetchChildProfileVar,
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  List<usermodel.ChildProfileRelateds?>? data =
                                      snapshot.data;
                                  if (data?.length == 0) {
                                    return Center(
                                      child: textWidget(
                                        stringText: 'يرجى اضافة افراد عائلة',
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    );
                                  } else if (data?.length != 0) {
                                    return ListView.separated(
                                      itemCount: data!.length,
                                      itemBuilder: (_, index) {
                                        print(
                                          'data[index]!.image = ${data[index]!.image}',
                                        );
                                        return TextButton(
                                          onPressed: () {
                                            if (data[index]!
                                                    .handicaps!
                                                    .length >=
                                                1) {
                                              relatedHandicaps = data[index]!
                                                  .handicaps!
                                                  .map((v) => v.name)
                                                  .toList()
                                                  .join("\n");
                                            }
                                            if (data[index]!
                                                    .chronicDiseases!
                                                    .length >=
                                                1) {
                                              relatedChronicDiseases =
                                                  data[index]!
                                                      .chronicDiseases!
                                                      .map((v) => v.name)
                                                      .toList()
                                                      .join("\n");
                                            }

                                            if (data[index]!
                                                    .nationalities!
                                                    .length >
                                                1) {
                                              relatedNationalities2 =
                                                  data[index]!
                                                      .nationalities![1]
                                                      .name;
                                            } else {
                                              relatedNationalities2 = '';
                                            }
                                            if (data[index]!.addresses!.length >
                                                1) {
                                              relatedCountry2 = data[index]!
                                                  .addresses![1]
                                                  .country!
                                                  .name;
                                              relatedGov2 = data[index]!
                                                  .addresses![1]
                                                  .governorate!
                                                  .name;
                                              relatedDestrict2 = data[index]!
                                                  .addresses![1]
                                                  .city!
                                                  .name;
                                            } else {
                                              relatedCountry2 = '';
                                              relatedGov2 = '';
                                              relatedDestrict2 = '';
                                            }
                                            if (data[index]!.sex == 'male') {
                                              relatedGenderSex = 'ذكر';
                                            } else if (data[index]!.sex ==
                                                'female') {
                                              relatedGenderSex = 'انثى';
                                            } else {
                                              relatedGenderSex = '';
                                            }
                                            if (data[index]!.dateOfBirth !=
                                                null) {
                                              var list = data[index]!
                                                  .dateOfBirth
                                                  ?.split('-');
                                              relatedBirthDate = DateTime(
                                                int.parse((list?[0])!),
                                                int.parse((list?[1])!),
                                                int.parse((list?[2])!),
                                              );
                                            }
                                            Get.to(() =>
                                                ChildPersonalSectionView(
                                                  getAddress1Id: data[index]
                                                      ?.addresses?[0]
                                                      .id,

                                                  getRelatedChronicDiseasesList:
                                                      data[index]!
                                                          .chronicDiseases,
                                                  getRelatedHandicapsList:
                                                      data[index]!.handicaps,
                                                  getRelatedNationalitiesList:
                                                      data[index]!
                                                          .nationalities,

                                                  ///
                                                  getRelatedCountry1Model:
                                                      data[index]!
                                                          .addresses![0]
                                                          .country,
                                                  getRelatedGov1Model:
                                                      data[index]!
                                                          .addresses![0]
                                                          .governorate,
                                                  getRelatedCity1Model:
                                                      data[index]!
                                                          .addresses![0]
                                                          .city,
                                                  getRelatedDestrict1Model:
                                                      data[index]!
                                                          .addresses![0]
                                                          .region,

                                                  ///
                                                  getRelatedId: data[index]!.id,
                                                  getRelatedName:
                                                      data[index]!.relation,
                                                  getRelatedFirstName:
                                                      data[index]!.firstName,
                                                  getRelatedSecondName:
                                                      data[index]!.secondName,
                                                  getRelatedSurName:
                                                      data[index]!.surName,
                                                  getRelatedEnFirstName:
                                                      data[index]!.enFirstName,
                                                  getRelatedEnSecondName:
                                                      data[index]!.enSecondName,
                                                  getRelatedEnSurName:
                                                      data[index]!.enSurName,

                                                  ///
                                                  getRelatedSexEn:
                                                      data[index]!.sex,
                                                  getRelatedSex:
                                                      relatedGenderSex,
                                                  getRelatedDateOfBirth:
                                                      relatedBirthDate,

                                                  ///
                                                  getRelatedCountry1:
                                                      data[index]!
                                                          .addresses![0]
                                                          .country!
                                                          .name,
                                                  getRelatedGov1: data[index]!
                                                      .addresses![0]
                                                      .governorate!
                                                      .name,
                                                  getRelatedCity1: data[index]!
                                                      .addresses![0]
                                                      .city!
                                                      .name,
                                                  getRelatedDestrict1:
                                                      data[index]!
                                                              .addresses![0]
                                                              .region
                                                              ?.name ??
                                                          '',

                                                  ///
                                                  getImage:
                                                      // ignore: prefer_null_aware_operators
                                                      data[index]!.image != null
                                                          ? data[index]!
                                                              .image
                                                              ?.imageUrl
                                                          : null,
                                                  // getImageId:
                                                  //     // ignore: prefer_null_aware_operators
                                                  //     data[index]!.image != null
                                                  //         ? data[index]!
                                                  //             .image
                                                  //             ?.id
                                                  //         : null,
                                                  getFamilyMemberPersonalId:
                                                      data[index]!.personalId,
                                                  getRelatedChronicDiseases:
                                                      relatedChronicDiseases,
                                                  getRelatedHandicaps:
                                                      relatedHandicaps,
                                                  getRelatedNationalities1:
                                                      data[index]!
                                                          .nationalities![0]
                                                          .name,
                                                  getRelatedNationalities2:
                                                      relatedNationalities2,
                                                ));
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                              EdgeInsets.all(10),
                                            ),
                                          ),
                                          child: Container(
                                            child: Row(
                                              children: <Widget>[
                                                data[index]!.image != null
                                                    ? CircleAvatar(
                                                        radius: 40,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "$imageUrl/${data[index]?.image?.imageUrl}",
                                                        ),
                                                      )
                                                    : CircleAvatar(
                                                        radius: 40,
                                                        backgroundImage:
                                                            AssetImage(
                                                          defaultAvatarIMG,
                                                        ),
                                                      ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    textWidget(
                                                      stringText:
                                                          '${data[index]!.firstName} ${data[index]!.secondName}',
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(height: 15),
                                                    textWidget(
                                                      stringText:
                                                          '${data[index]!.relation}',
                                                      fontSize: 15,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    MaterialButton(
                                                      child: textWidget(
                                                        stringText:
                                                            'التاريخ المرضي',
                                                        color: Colors.blue,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    MaterialButton(
                                                      child: textWidget(
                                                        stringText: 'الحجوزات',
                                                        color: Colors.blue,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
