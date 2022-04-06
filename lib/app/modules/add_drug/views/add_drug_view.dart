import 'dart:convert';
import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as paths;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart'
    as globalstring;
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/bottom_theme.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart'
    as textwidget;
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/signup/widgets/signup_appbar.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class AddDrugView extends StatefulWidget {
  @override
  State<AddDrugView> createState() => _AddDrugViewState();
}

class _AddDrugViewState extends State<AddDrugView> {
  StepState step0State = StepState.editing;
  StepState step1State = StepState.editing;
  bool? success1;
  bool? success2;
  bool? success3;
  String text = '';
  ButtonState stateTextWithIcon1 = ButtonState.idle;
  ButtonState stateTextWithIcon2 = ButtonState.idle;
  var formKey = GlobalKey<FormBuilderState>();
  int currentstep = 0;
  int? drugId;
  String? mohCode;
  String? gs1Code;
  String? shsCode;
  String? enTradeName;
  String? enStrngthName;
  String? enGenericName;
  String? enDosageFormName;
  String? enRouteOfAdministrationName;
  String? enPackageSizeName;
  String? enManufacturerName;
  String? enOriginName;
  String? enDistributorName;
  String? arTradeName;
  String? arStrngthName;
  String? arGenericName;
  String? arDosageFormName;
  String? arRouteOfAdministrationName;
  String? arPackageSizeName;
  String? arManufacturerName;
  String? arOriginName;
  String? arDistributorName;

  final ImagePicker _pickerCoverEn = ImagePicker();
  String? imageCoverEn;
  String? storedImageCoverEn;
  final ImagePicker _pickerCoverAr = ImagePicker();
  String? imageCoverAr;
  String? storedImageCoverAr;

  Future step1Post() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
        // 'Authorization': 'Bearer 8|r01pGmfGKy9vccBExgz94Yo0Bw3JlXi6sY6AoUbk'
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${globalstring.url}/add_drug',
        ),
      );
      request.fields.addAll(
        {
          'moh_code': '$mohCode',
          'gs1_code': '$gs1Code',
          'shs_code': '$shsCode',
          // 'moh_code': 'mohCode2',
          // 'gs1_code': 'gs1Code2',
          // 'shs_code': 'shsCode2',
        },
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        success1 = true;
        var data = jsonDecode(await response.stream.bytesToString());
        print('data = $data');
        drugId = data['data']["drug"]["id"];
        print('drugId = $drugId');
        setState(() {});
      } else {
        var data = await response.stream.bytesToString();
        if (data.toString().contains('moh_code') ||
            data.toString().contains('gs1_code') ||
            data.toString().contains('shs_code')) {
          Get.snackbar(
            '',
            '',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            titleText: Center(
              child: textWidget(
                stringText: 'حدث خطأ بالتسجيل',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Center(
              child: textWidget(
                stringText: 'احد الرموز مدخله مسبقا',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.all(15),
            snackStyle: SnackStyle.FLOATING,
            duration: Duration(seconds: 3),
            dismissDirection: SnackDismissDirection.VERTICAL,
            // dismissDirection: DismissDirection.vertical,
            margin: EdgeInsets.all(15),
            borderRadius: 20,
          );
          success1 = false;
          print('data = $data');
          success1 = false;
          setState(() {});
          print(response.reasonPhrase);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future step2Post() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
        // 'Authorization': 'Bearer 8|r01pGmfGKy9vccBExgz94Yo0Bw3JlXi6sY6AoUbk'
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${globalstring.url}/add_drug_description',
        ),
      );
      request.fields.addAll({
        'trade_name': '$enTradeName',
        'strength': '$enStrngthName',
        'drug_id': '$drugId',
        'generic_name': '$enGenericName',
        'dosage_form': '$enDosageFormName',
        'route_of_administration': '$enRouteOfAdministrationName',
        'package_size': '$enPackageSizeName',
        'manufacturer': '$enManufacturerName',
        'origin': '$enOriginName',
        'distributor': '$enDistributorName',
        'language_code': 'en'
        // 'trade_name': 'enTradeName',
        // 'strength': 'enStrngthName',
        // 'drug_id': '$drugId',
        // 'generic_name': 'enGenericName',
        // 'dosage_form': 'enDosageFormName',
        // 'route_of_administration': 'enRouteOfAdministrationName',
        // 'package_size': 'enPackageSizeName',
        // 'manufacturer': 'enManufacturerName',
        // 'origin': 'enOriginName',
        // 'distributor': 'enDistributorName',
        // 'language_code': 'en'
      });
      if (storedImageCoverEn != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', storedImageCoverEn!),
        );
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        success2 = true;
        setState(() {});
      } else {
        success2 = false;
        setState(() {});
        print(response.reasonPhrase);
      }

      ///
    } catch (e) {
      print(e);
    }
  }

  Future step3Post() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $savedToken'
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${globalstring.url}/add_drug_description',
        ),
      );
      request.fields.addAll({
        'trade_name': '$arTradeName',
        'strength': '$arStrngthName',
        'drug_id': '$drugId',
        'generic_name': '$arGenericName',
        'dosage_form': '$arDosageFormName',
        'route_of_administration': '$arRouteOfAdministrationName',
        'package_size': '$arPackageSizeName',
        'manufacturer': '$arManufacturerName',
        'origin': '$arOriginName',
        'distributor': '$arDistributorName',
        'language_code': 'ar'
        // 'trade_name': 'arTradeName',
        // 'strength': 'arStrngthName',
        // 'drug_id': '$drugId',
        // 'generic_name': 'arGenericName',
        // 'dosage_form': 'arDosageFormName',
        // 'route_of_administration': 'arRouteOfAdministrationName',
        // 'package_size': 'arPackageSizeName',
        // 'manufacturer': 'arManufacturerName',
        // 'origin': 'arOriginName',
        // 'distributor': 'arDistributorName',
        // 'language_code': 'ar'
      });
      if (storedImageCoverAr != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', storedImageCoverAr!),
        );
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        success3 = true;
        setState(() {});
      } else {
        success3 = false;
        setState(() {});
        print(response.reasonPhrase);
      }

      ///
      if (storedImageCoverAr != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', storedImageCoverAr!),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget buildTextWithIcon(void Function()? onStepContinue) {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
          text: "ارسال",
          icon: Icon(Icons.send, color: Colors.white),
          color: globalstring.generalColor,
        ),
        ButtonState.loading: IconedButton(
          text: "إنتظار",
          color: globalstring.generalColor,
        ),
        ButtonState.fail: IconedButton(
          text: "فشل",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300,
        ),
        ButtonState.success: IconedButton(
          text: "نجاح",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400,
        ),
      },
      maxWidth: 110.0,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: Colors.white,
        strokeWidth: 1,
      ),
      minWidth: 50.0,
      height: 39.0,
      radius: 5.0,
      progressIndicatorSize: 25.0,
      textStyle: textwidget.style(
        fontSize: 15,
        color: Colors.white,
      ),
      onPressed: onStepContinue,
      state: currentstep == 0 ? stateTextWithIcon1 : stateTextWithIcon2,
    );
  }

  Widget backButton() {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 12,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: globalstring.generalColor,
              width: 1,
            ),
          ),
        ),
      ),
      onPressed: () {
        Get.offNamed(Routes.DOCTOR_DASHBOARD);
      },
      child: textwidget.textWidget(
        stringText: 'إضافة لاحقا',
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  onStepContinue() {
    if (currentstep == 0 && formKey.currentState!.validate()) {
      stateTextWithIcon1 = ButtonState.loading;
      setState(() {});
      step1Post().then((value) {
        debugPrint('value = $value');
        switch (stateTextWithIcon1) {
          case ButtonState.idle:
            break;
          case ButtonState.loading:
            if (success1 == true) {
              step2Post().then((value) {
                switch (stateTextWithIcon1) {
                  case ButtonState.idle:
                    break;
                  case ButtonState.loading:
                    if (success2 == true) {
                      stateTextWithIcon1 = ButtonState.success;
                      setState(() {});
                      Future.delayed(Duration(seconds: 1), () {
                        currentstep++;
                        step0State = StepState.complete;
                        setState(() {});
                      });
                    } else {
                      stateTextWithIcon1 = ButtonState.fail;
                      step0State = StepState.editing;
                      setState(() {});
                    }
                    break;

                  case ButtonState.success:
                    stateTextWithIcon1 = ButtonState.idle;
                    setState(() {});
                    break;
                  case ButtonState.fail:
                    stateTextWithIcon1 = ButtonState.idle;
                    setState(() {});
                    break;
                }
              });
            } else {
              stateTextWithIcon1 = ButtonState.fail;
              step0State = StepState.editing;
              setState(() {});
            }
            break;
          case ButtonState.success:
            stateTextWithIcon1 = ButtonState.idle;
            setState(() {});
            break;
          case ButtonState.fail:
            stateTextWithIcon1 = ButtonState.idle;
            setState(() {});
            break;
        }
      });
    }
    if (currentstep == 1 && formKey.currentState!.validate()) {
      stateTextWithIcon2 = ButtonState.loading;
      setState(() {});
      step3Post().then((value) {
        switch (stateTextWithIcon2) {
          case ButtonState.idle:
            break;
          case ButtonState.loading:
            if (success3 == true) {
              stateTextWithIcon2 = ButtonState.success;
              step1State = StepState.complete;
              setState(() {});
              Future.delayed(Duration(seconds: 1), () {
                Get.offNamed(Routes.DOCTOR_DASHBOARD);
              });
            } else {
              stateTextWithIcon2 = ButtonState.fail;
              step0State = StepState.editing;
              setState(() {});
            }
            break;

          case ButtonState.success:
            stateTextWithIcon2 = ButtonState.idle;
            setState(() {});
            break;
          case ButtonState.fail:
            stateTextWithIcon2 = ButtonState.idle;
            setState(() {});
            break;
        }
      });
    }
  }

  onPressedCameraCoverEn() async {
    imageCoverEn = '';
    await _pickerCoverEn
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        imageCoverEn = value?.path;
        setState(() {});
      },
    );
    if (imageCoverEn != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCoverEn!,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: globalstring.generalColor,
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
        storedImageCoverEn = localImage.path;
        setState(() {});
      }
    }
  }

  onPressedGalleryCoverEn() async {
    imageCoverEn = '';
    await _pickerCoverEn
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        imageCoverEn = value?.path;
        setState(() {});
      },
    );
    if (imageCoverEn != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCoverEn!,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: globalstring.generalColor,
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
        storedImageCoverEn = localImage.path;
        setState(() {});
      }
    }
  }

  onPressedCameraCoverAr() async {
    imageCoverAr = '';
    await _pickerCoverAr
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      preferredCameraDevice: CameraDevice.front,
    )
        .then(
      (value) async {
        imageCoverAr = value?.path;
        setState(() {});
      },
    );
    if (imageCoverAr != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCoverAr!,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: globalstring.generalColor,
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
        storedImageCoverAr = localImage.path;
        setState(() {});
      }
    }
  }

  onPressedGalleryCoverAr() async {
    imageCoverAr = '';
    await _pickerCoverAr
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    )
        .then(
      (value) async {
        imageCoverAr = value?.path;
        setState(() {});
      },
    );
    if (imageCoverAr != '') {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageCoverAr!,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'اختيار الحجم  الانسب',
          toolbarColor: globalstring.generalColor,
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
        storedImageCoverAr = localImage.path;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: SignUpAppBar(),
            title: Center(
              child: textwidget.textWidget(
                stringText: 'اضافة دواء',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          body: BottomTheme(
            child: FormBuilder(
              key: formKey,
              child: Stepper(
                onStepTapped: null,
                type: StepperType.vertical,
                steps: [
                  Step(
                    title: textwidget.textWidget(
                      stringText: 'ادخال الدواء',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: currentstep == 0,
                    state: step0State,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDialogTextFieldTextContainer(
                          fontSize: 20,
                          margin: EdgeInsets.only(bottom: 10),
                          stringText: 'ادخال الرموز الخاصة بالدواء',
                          color: Colors.black,
                        ),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          stringText: 'رمز moh',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: mohCode ?? '',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: globalstring.textfieldErrorText,
                            ),
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            mohCode = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الرمز',
                          keyboardType: TextInputType.text,
                          name: 'moh',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          stringText: 'رمز gs1',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: gs1Code ?? '',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: globalstring.textfieldErrorText,
                            ),
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            gs1Code = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الرمز',
                          keyboardType: TextInputType.text,
                          name: 'gs1',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          stringText: 'رمز shs',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: shsCode ?? '',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: globalstring.textfieldErrorText,
                            ),
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            shsCode = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الرمز',
                          keyboardType: TextInputType.text,
                          name: 'shs',
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 20,
                                margin: EdgeInsets.only(bottom: 10),
                                stringText: 'enter english description of drug',
                                color: Colors.black,
                              ),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Trade Name',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enTradeName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enTradeName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the trade name',
                                keyboardType: TextInputType.text,
                                name: 'tradename',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Strngth',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enStrngthName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enStrngthName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the strength',
                                hintStyle: textwidget.style(fontSize: 13.0),
                                keyboardType: TextInputType.text,
                                name: 'enStrngthName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Generic Name',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enGenericName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enGenericName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the generic name',
                                keyboardType: TextInputType.text,
                                name: 'enGenericName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Dosage Form',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enDosageFormName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enDosageFormName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the dosage form',
                                keyboardType: TextInputType.text,
                                name: 'enDosageFormName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Route Of Administration',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enRouteOfAdministrationName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enRouteOfAdministrationName = val;
                                  setState(() {});
                                },
                                hintText:
                                    'please enter the route of administration',
                                keyboardType: TextInputType.text,
                                name: 'enRouteOfAdministrationName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Package Size',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enPackageSizeName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enPackageSizeName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the package size',
                                keyboardType: TextInputType.text,
                                name: 'enPackageSizeName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Manufacturer',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enManufacturerName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enManufacturerName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the manufacturer',
                                keyboardType: TextInputType.text,
                                name: 'enManufacturerName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Origin',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enOriginName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enOriginName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the origin',
                                keyboardType: TextInputType.text,
                                name: 'enOriginName',
                              ),
                              SizedBox(height: 10),
                              CustomDialogTextFieldTextContainer(
                                fontSize: 15,
                                margin: EdgeInsets.only(bottom: 0),
                                stringText: 'Distributor',
                                color: Colors.black,
                              ),
                              CustomDialogTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintStyle: textwidget.style(fontSize: 13.0),
                                width: SizeConfig().widthSize(context, 95),
                                height: 55.0,
                                initialValue: enDistributorName ?? '',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ]),
                                onChanged: (val) {
                                  enDistributorName = val;
                                  setState(() {});
                                },
                                hintText: 'please enter the distributor',
                                keyboardType: TextInputType.text,
                                name: 'enDistributorName',
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Center(
                                  child: textwidget.textWidget(
                                    stringText: 'choose picture for drug',
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    storedImageCoverEn != null
                                        ? Container(
                                            width: SizeConfig()
                                                .widthSize(context, 50),
                                            height: SizeConfig()
                                                .heightSize(context, 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(storedImageCoverEn!),
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: SizeConfig()
                                                .widthSize(context, 50),
                                            height: SizeConfig()
                                                .heightSize(context, 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  placeholderImageIMG,
                                                ),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          child: Icon(
                                            Icons.photo_camera,
                                            size: 30,
                                            color: globalstring.generalColor,
                                          ),
                                          onPressed: onPressedCameraCoverEn,
                                        ),
                                        TextButton(
                                          child: Icon(
                                            Icons.photo,
                                            size: 30,
                                            color: globalstring.generalColor,
                                          ),
                                          onPressed: onPressedGalleryCoverEn,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    title: textwidget.textWidget(
                      stringText: 'ادخال الوصف العربي للدواء',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    isActive: currentstep == 1,
                    state: step1State,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'الاسم التجاري',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arTradeName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arTradeName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الاسم التجاري',
                          keyboardType: TextInputType.text,
                          name: 'artradename',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'التركيز',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arStrngthName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arStrngthName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال التركيز',
                          hintStyle: textwidget.style(fontSize: 13.0),
                          keyboardType: TextInputType.text,
                          name: 'arStrngthName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'الاسم العلمي',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arGenericName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arGenericName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الاسم العلمي',
                          keyboardType: TextInputType.text,
                          name: 'arGenericName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'الشكل الصيدلاني',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arDosageFormName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arDosageFormName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الشكل الصيدلاني',
                          keyboardType: TextInputType.text,
                          name: 'arDosageFormName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'طريقة أخذ الدواء',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arRouteOfAdministrationName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arRouteOfAdministrationName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال طريقة أخذ الدواء',
                          keyboardType: TextInputType.text,
                          name: 'arRouteOfAdministrationName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'حجم العبوة',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arPackageSizeName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arPackageSizeName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال حجم العبوة',
                          keyboardType: TextInputType.text,
                          name: 'arPackageSizeName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'المصنع',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arManufacturerName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arManufacturerName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال المصنع',
                          keyboardType: TextInputType.text,
                          name: 'arManufacturerName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'المنشأ',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arOriginName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arOriginName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال المنشأ',
                          keyboardType: TextInputType.text,
                          name: 'arOriginName',
                        ),
                        SizedBox(height: 10),
                        CustomDialogTextFieldTextContainer(
                          fontSize: 15,
                          margin: EdgeInsets.only(bottom: 0),
                          stringText: 'الموزع',
                          color: Colors.black,
                        ),
                        CustomDialogTextField(
                          hintStyle: textwidget.style(fontSize: 13.0),
                          width: SizeConfig().widthSize(context, 95),
                          height: 55.0,
                          initialValue: arDistributorName ?? '',
                          autovalidateMode: currentstep == 1
                              ? AutovalidateMode.onUserInteraction
                              : null,
                          validator: currentstep == 1
                              ? FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    context,
                                    errorText: globalstring.textfieldErrorText,
                                  ),
                                ])
                              : null,
                          onChanged: (val) {
                            arDistributorName = val;
                            setState(() {});
                          },
                          hintText: 'يرجى ادخال الموزع',
                          keyboardType: TextInputType.text,
                          name: 'arDistributorName',
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Center(
                            child: textwidget.textWidget(
                              stringText: 'اختيار صورة للدواء',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              storedImageCoverAr != null
                                  ? Container(
                                      width:
                                          SizeConfig().widthSize(context, 50),
                                      height:
                                          SizeConfig().heightSize(context, 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(storedImageCoverAr!),
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width:
                                          SizeConfig().widthSize(context, 50),
                                      height:
                                          SizeConfig().heightSize(context, 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            placeholderImageIMG,
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    child: Icon(
                                      Icons.photo_camera,
                                      size: 30,
                                      color: globalstring.generalColor,
                                    ),
                                    onPressed: onPressedCameraCoverAr,
                                  ),
                                  TextButton(
                                    child: Icon(
                                      Icons.photo,
                                      size: 30,
                                      color: globalstring.generalColor,
                                    ),
                                    onPressed: onPressedGalleryCoverAr,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                currentStep: currentstep,
                onStepCancel: null,
                onStepContinue: onStepContinue,
                controlsBuilder: (BuildContext context, details) {
                  return currentstep == 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            currentstep == 1 ? backButton() : Container(),
                            buildTextWithIcon(details.onStepContinue),
                          ],
                        )
                      : Center(
                          child: buildTextWithIcon(details.onStepContinue),
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
