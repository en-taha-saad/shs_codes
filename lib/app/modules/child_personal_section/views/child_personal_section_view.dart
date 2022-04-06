// ignore_for_file: unnecessary_brace_in_string_interps, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:convert';
import 'package:path/path.dart' as paths;

import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/container_element.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/edit_child_information/views/edit_child_information_view.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/modules/profile/user_model.dart'
    as user_model;
import 'package:shs108private/main.dart';

class ChildPersonalSectionView extends StatefulWidget {
  final String? getImage;
  final int? getImageId;
  final int? getRelatedId;
  final String? getRelatedFirstName;
  final String? getRelatedSecondName;
  final String? getRelatedSurName;
  final String? getRelatedEnFirstName;
  final String? getRelatedEnSecondName;
  final String? getRelatedEnSurName;
  final String? getRelatedSex;
  final DateTime? getRelatedDateOfBirth;
  final String? getRelatedHandicaps;
  final String? getRelatedChronicDiseases;
  final String? getRelatedNationalities1;
  final String? getRelatedNationalities2;
  final String? getRelatedCountry1;
  final String? getRelatedGov1;
  final String? getRelatedDestrict1;
  final String? getRelatedCountry2;
  final String? getRelatedGov2;
  final String? getRelatedDestrict2;
  final String? getRelation;
  final String? getFamilyMemberPersonalId;

  ///
  final List<GetDataModel>? getRelatedChronicDiseasesList;
  final List<GetDataModel>? getRelatedHandicapsList;
  final List<GetDataModel>? getRelatedNationalitiesList;
  final GetDataModel? getRelatedCountry1Model;
  final GetDataModel? getRelatedGov1Model;
  final GetDataModel? getRelatedCity1Model;
  final GetDataModel? getRelatedDestrict1Model;
  final String? getRelatedCity1;
  final GetDataModel? getRelationModel;
  final int? getAddress1Id;
  final String? getRelatedSexEn;
  final String? getRelatedName;

  ChildPersonalSectionView({
    this.getRelatedName,
    this.getImageId,
    this.getRelatedSexEn,
    this.getAddress1Id,
    this.getRelationModel,
    this.getRelatedChronicDiseasesList,
    this.getRelatedHandicapsList,
    this.getRelatedNationalitiesList,
    this.getRelatedCountry1Model,
    this.getRelatedGov1Model,
    this.getRelatedCity1Model,
    this.getRelatedDestrict1Model,
    this.getRelatedCity1,
    this.getImage,
    this.getRelatedId,
    this.getRelation,
    this.getFamilyMemberPersonalId,
    this.getRelatedFirstName,
    this.getRelatedSecondName,
    this.getRelatedSurName,
    this.getRelatedEnFirstName,
    this.getRelatedEnSecondName,
    this.getRelatedEnSurName,
    this.getRelatedSex,
    this.getRelatedDateOfBirth,
    this.getRelatedHandicaps,
    this.getRelatedChronicDiseases,
    this.getRelatedNationalities1,
    this.getRelatedNationalities2,
    this.getRelatedCountry1,
    this.getRelatedGov1,
    this.getRelatedDestrict1,
    this.getRelatedCountry2,
    this.getRelatedGov2,
    this.getRelatedDestrict2,
  });

  @override
  State<ChildPersonalSectionView> createState() =>
      _ChildPersonalSectionViewState();
}

class _ChildPersonalSectionViewState extends State<ChildPersonalSectionView> {
  @override
  initState() {
    gender();
    fetchChildRelation();
    fetchChildProfileVar = fetchChildProfile();
    super.initState();
  }

  String? genderSex;
  String? getRelation2;
  final ImagePicker _pickerAvatar = ImagePicker();
  String? imageAvatar;
  String? storedImageAvatar;
  Future<List<user_model.ChildProfileRelateds>?>? fetchChildProfileVar;

  Future fetchChildRelation() async {
    print('fetchRelation is called');
    var headers = {'Authorization': 'Bearer $savedToken'};
    var request = http.Request(
      'GET',
      Uri.parse('$url/related_profile/${widget.getRelatedId}'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (savedToken != null) {
      if (response.statusCode == 200) {
        List data = jsonDecode(await response.stream.bytesToString());
        print("data[0][relation]${data[0]["relation"]}");
        setState(() {
          getRelation2 = data[0]["relation"];
        });
        // familyMembers = dataMap.relateds!.length;
      } else {
        var data = jsonDecode(await response.stream.bytesToString());
        print('data = $data');
        throw 'data not fetched';
      }
    } else {
      throw 'token not found';
    }
  }

  gender() {
    if (widget.getRelatedSex == 'male') {
      setState(() {
        genderSex = 'ذكر';
      });
    } else if (widget.getRelatedSex == 'female') {
      setState(() {
        genderSex = 'انثى';
      });
    } else {
      setState(() {
        genderSex = '';
      });
    }
  }

  Future? editImage() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $savedToken',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$url/update_family_picture'),
    );
    request.fields.addAll(
      {
        'related_id': '${widget.getRelatedId}',
        'image_id': '${widget.getImageId ?? ''}'
      },
    );

    if (storedImageAvatar != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          storedImageAvatar!,
        ),
      );
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      debugPrint(
        "await response.stream.bytesToString() = ${await response.stream.bytesToString()}",
      );
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        titleText: Center(
          child: textWidget(
            stringText: 'نجاح تعديل الصورة',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Container(),
        padding: EdgeInsets.all(15),
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 4),
        dismissDirection: SnackDismissDirection.VERTICAL,
                    // dismissDirection: DismissDirection.vertical,

        margin: EdgeInsets.all(15),
        borderRadius: 20,
      );
    } else {
      debugPrint(
        "await response.stream.bytesToString() = ${await response.stream.bytesToString()}",
      );
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        titleText: Center(
          child: textWidget(
            stringText: 'حدث خطأ ما',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Container(),
        padding: EdgeInsets.all(15),
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 4),
        dismissDirection: SnackDismissDirection.VERTICAL,
                    // dismissDirection: DismissDirection.vertical,

        margin: EdgeInsets.all(15),
        borderRadius: 20,
      );
    }
  }

  onPressedCameraAvatar() async {
    imageAvatar = '';
    await _pickerAvatar
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then((value) async {
      imageAvatar = value?.path;
      setState(() {});
    });
    if (imageAvatar != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageAvatar!,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: generalColor,
          toolbarWidgetColor: Colors.grey,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      if (croppedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = paths.basename(croppedFile.path);
        final File localImage =
            await croppedFile.copy('${appDir.path}/$fileName');
        storedImageAvatar = localImage.path;
        editImage();
        setState(() {});
      }
    }
    Get.back();
  }

  onPressedGalleryAvatar() async {
    imageAvatar = '';
    await _pickerAvatar
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        imageAvatar = value?.path;
        setState(() {});
      },
    );
    if (imageAvatar != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageAvatar!,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: generalColor,
          toolbarWidgetColor: Colors.grey,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      if (croppedFile != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = paths.basename(croppedFile.path);
        final File localImage =
            await croppedFile.copy('${appDir.path}/$fileName');
        storedImageAvatar = localImage.path;
        editImage();
        setState(() {});
      }
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
            stringText: 'معلومات فرد العائلة',
            color: Colors.black,
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
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
        body: FutureBuilder(
          future: fetchChildProfileVar,
          builder: (BuildContext context,
              AsyncSnapshot<List<user_model.ChildProfileRelateds>?> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
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
                    SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  if (storedImageAvatar != null)
                                    CircleAvatar(
                                      backgroundImage: FileImage(
                                        File(storedImageAvatar!),
                                      ),
                                    )
                                  else if (widget.getImage != null)
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        '$imageUrl/${widget.getImage}',
                                      ),
                                    )
                                  else
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        defaultAvatarIMG,
                                      ),
                                    ),
                                  Positioned(
                                    right: -7,
                                    bottom: 0,
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(45),
                                      ),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        color: Color(0xFFF5F6F9),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            title: "تحديث الصورة",
                                            titleStyle: style(fontSize: 20),
                                            backgroundColor: Colors.white,
                                            barrierDismissible: true,
                                            titlePadding: EdgeInsets.all(10),
                                            contentPadding: EdgeInsets.all(20),
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.photo_camera,
                                                    color: generalColor,
                                                    size: 30,
                                                  ),
                                                  onPressed:
                                                      onPressedCameraAvatar,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.photo,
                                                    color: generalColor,
                                                    size: 30,
                                                  ),
                                                  onPressed:
                                                      onPressedGalleryAvatar,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 16),
                                          child: Icon(
                                            Icons.edit,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            BuildContainer(
                              stringText1: 'صلة القرابة',
                              stringText2: '${getRelation2}',
                            ),
                            BuildContainer(
                              stringText1: 'الرقم الشخصي',
                              stringText2:
                                  '${widget.getFamilyMemberPersonalId}',
                            ),
                            BuildContainer(
                              stringText1: 'اسم المستخدم',
                              stringText2:
                                  '${widget.getRelatedFirstName} ${widget.getRelatedSecondName} ${widget.getRelatedSurName}',
                            ),
                            widget.getRelatedEnFirstName != null &&
                                    widget.getRelatedEnFirstName != ''
                                ? BuildContainer(
                                    stringText1: '',
                                    stringText2:
                                        '${widget.getRelatedEnFirstName ?? ''} ${widget.getRelatedEnSecondName ?? ''} ${widget.getRelatedEnSurName ?? ''}',
                                  )
                                : Container(),
                            BuildContainer(
                              stringText1: 'الجنس',
                              stringText2: '${widget.getRelatedSex}',
                            ),
                            BuildContainer(
                              stringText1: 'تاريخ الميلاد',
                              stringText2:
                                  '${widget.getRelatedDateOfBirth?.year}-${widget.getRelatedDateOfBirth?.month}-${widget.getRelatedDateOfBirth?.day}',
                            ),
                            BuildContainer(
                              stringText1: 'الجنسية',
                              stringText2:
                                  '${widget.getRelatedNationalities1}${widget.getRelatedNationalities2 == null || widget.getRelatedNationalities2 == '' ? '' : '-${widget.getRelatedNationalities2}'}',
                            ),
                            BuildContainer(
                              stringText1: 'العنوان',
                              stringText2:
                                  '${widget.getRelatedCountry1}-${widget.getRelatedGov1}-${widget.getRelatedCity1}${widget.getRelatedDestrict1 == null || widget.getRelatedDestrict1 == '' ? '' : '-${widget.getRelatedDestrict1}'}',
                            ),
                            SizedBox(height: 10),
                            widget.getRelatedChronicDiseases != null
                                ? BuildContainer(
                                    stringText1: 'الأمراض المزمنة',
                                    stringText2:
                                        '${widget.getRelatedChronicDiseases}',
                                  )
                                : Container(),
                            widget.getRelatedHandicaps != null
                                ? BuildContainer(
                                    stringText1: 'علامات فارقة',
                                    stringText2:
                                        '${widget.getRelatedHandicaps}',
                                  )
                                : Container(),
                            SizedBox(height: 40),
                            Container(
                              width: 500,
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(generalColor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(10)),
                                ),
                                onPressed: () {
                                  print(
                                    'widget.getRelationModel = ${widget.getRelationModel}',
                                  );
                                  Get.to(
                                    () => EditChildInformationView(
                                      getRelatedName: widget.getRelatedName,
                                      getRelatedSexEn: widget.getRelatedSexEn,
                                      getAddress1Id: widget.getAddress1Id,
                                      getRelatedId: widget.getRelatedId,
                                      getRelationModel: widget.getRelationModel,
                                      getRelatedFirstName:
                                          widget.getRelatedFirstName,
                                      getRelatedSecondName:
                                          widget.getRelatedSecondName,
                                      getRelatedSurName:
                                          widget.getRelatedSurName,
                                      getRelatedSex: widget.getRelatedSex,
                                      getRelatedDateOfBirth:
                                          widget.getRelatedDateOfBirth,
                                      getRelatedEnFirstName:
                                          widget.getRelatedEnFirstName,
                                      getRelatedEnSecondName:
                                          widget.getRelatedEnSecondName,
                                      getRelatedEnSurName:
                                          widget.getRelatedEnSurName,
                                      getRelatedChronicDiseasesList:
                                          widget.getRelatedChronicDiseasesList,
                                      getRelatedHandicapsList:
                                          widget.getRelatedHandicapsList,
                                      getRelatedNationalitiesList:
                                          widget.getRelatedNationalitiesList,
                                      getRelatedCountry1Model:
                                          widget.getRelatedCountry1Model,
                                      getRelatedCity1Model:
                                          widget.getRelatedCity1Model,
                                      getRelatedDestrict1Model:
                                          widget.getRelatedDestrict1Model,
                                      getRelatedGov1Model:
                                          widget.getRelatedGov1Model,
                                    ),
                                  );
                                },
                                child: textWidget(
                                  stringText: 'تعديل المعلومات',
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: textWidget(
                  stringText: 'حدث خطأ ما : ${snapshot.error}',
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  color: Colors.red,
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
