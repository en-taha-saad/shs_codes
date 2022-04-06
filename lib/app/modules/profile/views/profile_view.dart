// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/widgets/noAccount.dart';
import 'package:shs108private/app/modules/profile/user_model.dart' as profile;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/container_element.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/personal_account_sign_up_view.dart';
import 'package:path/path.dart' as paths;
import 'package:http/http.dart' as http;
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

String? firstNameStringDrawer;
String? secondNameStringDrawer;
String? primaryPhoneStringDrawer;
int? getUserId;

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget verifiedNumber = Container();
  checkVerifiedNumber() async {
    var headers = {'Authorization': 'Bearer $savedToken'};
    var request = http.Request(
      'GET',
      Uri.parse('$url/verify_code/111111}'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 && savedToken != null) {
      var data = jsonDecode(await response.stream.bytesToString());
      var dataMap = data["success"];

      if (dataMap == 'true') {
        setState(() {
          verifiedNumber = Container(
            padding: EdgeInsets.all(0),
            width: 100,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightGreen,
              ),
              borderRadius: BorderRadius.circular(80),
            ),
            child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(0)),
                ),
                onPressed: null,
                child: textWidget(
                  stringText: "الرقم مؤكد",
                  color: Colors.lightGreen,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
          );
        });
      }
    } else {
      setState(() {
        verifiedNumber = Container(
          padding: EdgeInsets.all(0),
          width: 100,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(80),
          ),
          child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(0)),
              ),
              onPressed: () => {},
              child: textWidget(
                stringText: "تأكيد الرقم",
                color: Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )),
        );
      });
    }
  }

  Future<profile.ParentProfile>? fetchParentProfileVar;

  @override
  initState() {
    fetchParentProfileVar = fetchParentProfile();
    getBarcode();
    checkVerifiedNumber();
    super.initState();
  }

  final ImagePicker _pickerAvatar = ImagePicker();
  String? imageAvatar;
  String? storedImageAvatar;
  Future? editImage() async {
    var headers = {
      'Authorization': 'Bearer $savedToken',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$url/update_profile_picture'),
    );

    request.headers.addAll(headers);

    if (storedImageAvatar != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          storedImageAvatar!,
        ),
      );
    }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
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

      debugPrint("${await response.stream.bytesToString()}");
    } else {
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

      debugPrint("${await response.stream.bytesToString()}");
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
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              toolbarHeight: 120,
              title: textWidget(
                fontWeight: FontWeight.w900,
                stringText: "المعلومات الشخصية",
                color: Colors.black,
                fontSize: 20,
              ),
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
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: savedToken != null
                ? FutureBuilder(
                    future: fetchParentProfileVar,
                    builder: (BuildContext context,
                        AsyncSnapshot<profile.ParentProfile> snapshot) {
                      if (snapshot.hasData) {
                        return savedToken != null
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        footerIMG,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    SafeArea(
                                      child: ListView(
                                        children: [
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 130,
                                                width: 130,
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  fit: StackFit.expand,
                                                  children: [
                                                    if (storedImageAvatar !=
                                                        null)
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            FileImage(
                                                          File(
                                                              storedImageAvatar!),
                                                        ),
                                                      )
                                                    else if (getImage != null)
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                          '$imageUrl/$getImage',
                                                        ),
                                                      )
                                                    else
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(
                                                          defaultAvatarIMG,
                                                        ),
                                                      ),
                                                    Positioned(
                                                      right: -7,
                                                      bottom: 0,
                                                      child: Container(
                                                        height: 48,
                                                        width: 48,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 3,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(45),
                                                        ),
                                                        child: FlatButton(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          color:
                                                              Color(0xFFF5F6F9),
                                                          onPressed: () {
                                                            Get.defaultDialog(
                                                              title:
                                                                  "تحديث الصورة",
                                                              titleStyle: style(
                                                                  fontSize: 20),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              barrierDismissible:
                                                                  true,
                                                              titlePadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(20),
                                                              content: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .photo_camera,
                                                                      color:
                                                                          generalColor,
                                                                      size: 30,
                                                                    ),
                                                                    onPressed:
                                                                        onPressedCameraAvatar,
                                                                  ),
                                                                  IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .photo,
                                                                      color:
                                                                          generalColor,
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
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 16),
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
                                              SizedBox(
                                                height: 130,
                                                width: 130,
                                                child: SvgPicture.network(
                                                  getBarcodeString ?? '',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 50),
                                          BuildContainer(
                                            stringText1: 'الرقم الشخصي',
                                            stringText2: '$personalIdDrawer',
                                          ),
                                          BuildContainer(
                                            stringText1: 'اسم المستخدم',
                                            stringText2:
                                                '${getFirstName ?? ''} ${getSecondName ?? ''} ${getSurName ?? ''}',
                                          ),
                                          (getEnFirstName != null &&
                                                  getEnSecondName != null &&
                                                  getEnSurName != null)
                                              ? BuildContainer(
                                                  stringText1: '',
                                                  stringText2:
                                                      '${getEnFirstName ?? ''} ${getEnSecondName ?? ''} ${getEnSurName ?? ''}',
                                                )
                                              : Container(),
                                          BuildContainer(
                                            stringText1: 'الجنس',
                                            stringText2: '${getSex ?? ''}',
                                          ),
                                          BuildContainer(
                                            stringText1: 'تاريخ الميلاد',
                                            stringText2:
                                                '${getDateOfBirth?.year ?? ''}-${getDateOfBirth?.month ?? ''}-${getDateOfBirth?.day ?? ''}',
                                          ),
                                          getNationalities2 != null
                                              ? BuildContainer(
                                                  stringText1: 'الجنسية',
                                                  stringText2:
                                                      '${getNationalities1 ?? ''}-${getNationalities2 ?? ''}',
                                                )
                                              : BuildContainer(
                                                  stringText1: 'الجنسية',
                                                  stringText2:
                                                      '${getNationalities1 ?? ''}',
                                                ),
                                          BuildContainer(
                                            stringText1: 'العنوان',
                                            stringText2:
                                                '${getCountry1 ?? ''}-${getGov1 ?? ''}-${getCity1 ?? ''} ${getDestrict1 ?? ''}',
                                          ),
                                          getCountry2 != null ||
                                                  getGov2 != null ||
                                                  getCity2 != null
                                              ? BuildContainer(
                                                  stringText1: '',
                                                  stringText2:
                                                      '${getCountry2 ?? ''} ${getGov2 ?? ''} ${getCity2 ?? ''} ${getDestrict2 ?? ''}',
                                                )
                                              : Container(),
                                          SizedBox(height: 10),
                                          getEmail2 != null
                                              ? Column(
                                                  children: [
                                                    BuildContainer(
                                                      stringText1:
                                                          'الايميل الأول',
                                                      stringText2:
                                                          '${getEmail1 ?? ''}',
                                                    ),
                                                    BuildContainer(
                                                      stringText1:
                                                          'الايميل الثاني',
                                                      stringText2:
                                                          '${getEmail2 ?? ''}',
                                                    )
                                                  ],
                                                )
                                              : getEmail1 != null
                                                  ? BuildContainer(
                                                      stringText1: 'الايميل',
                                                      stringText2:
                                                          '${getEmail1 ?? ''}',
                                                    )
                                                  : Container(),
                                          SizedBox(height: 10),
                                          Stack(
                                            children: [
                                              Positioned(
                                                left: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3 -
                                                    22,
                                                top: 11,
                                                child: verifiedNumber,
                                              ),
                                              getPhone2 != null
                                                  ? Column(
                                                      children: [
                                                        BuildContainer(
                                                          stringText1:
                                                              'رقم الهاتف الاول',
                                                          stringText2:
                                                              '${getPhone1 ?? ''}',
                                                        ),
                                                        BuildContainer(
                                                          stringText1:
                                                              'رقم الهاتف الثاني',
                                                          stringText2:
                                                              '${getPhone2 ?? ''}',
                                                        )
                                                      ],
                                                    )
                                                  : SizedBox(
                                                      child: BuildContainer(
                                                        stringText1:
                                                            'رقم الهاتف',
                                                        stringText2:
                                                            '${getPhone1 ?? ''}',
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          getChronicDiseases != null
                                              ? BuildContainer(
                                                  stringText1:
                                                      'الأمراض المزمنة',
                                                  stringText2:
                                                      '$getChronicDiseases',
                                                )
                                              : Container(),
                                          getHandicaps != null
                                              ? BuildContainer(
                                                  stringText1: 'علامات فارقة',
                                                  stringText2: '$getHandicaps',
                                                )
                                              : Container(),
                                          SizedBox(height: 40),
                                          Container(
                                            width: 300,
                                            height: 60,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        generalColor),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.all(10)),
                                              ),
                                              onPressed: () {
                                                Get.toNamed(Routes
                                                    .EDIT_PERSONAL_INFORMATION);
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
                                  ],
                                ),
                              )
                            : noAccount();
                      } else if (snapshot.hasError) {
                        return savedToken != null
                            ? Center(
                                child: textWidget(
                                  // stringText: 'حدث خطأ ما : ${snapshot.error}',
                                  stringText: 'حدث خطأ ما',
                                  fontSize: 20,
                                  textAlign: TextAlign.center,
                                  color: Colors.red,
                                ),
                              )
                            : noAccount();
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : noAccount(),
          ),
        ],
      ),
    );
  }
}
