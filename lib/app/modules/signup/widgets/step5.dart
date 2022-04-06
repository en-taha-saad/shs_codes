// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

import 'add_card_widget.dart';

class Step5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // #region avatar image picker
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: textWidget(
                stringText: 'اختيار صورة شخصية مهنية',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder(
                builder: (SignUpController c) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 40,
                        color: generalColor,
                        icon: Icon(Icons.photo_camera),
                        onPressed: c.onPressedCameraAvatar,
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.photo),
                        color: generalColor,
                        onPressed: c.onPressedGalleryAvatar,
                      )
                    ],
                  );
                },
              ),
              GetBuilder(
                builder: (SignUpController cx) {
                  return cx.toPinedJson?.imageAvatar != null ||
                          cx.imageAvatar != null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(
                            File(
                              cx.toPinedJson?.imageAvatar ?? cx.imageAvatar!,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(
                            defaultAvatarIMG,
                          ),
                        );
                },
              ),
            ],
          ),
          // #endregion

          // #region Cover image picker
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Center(
              child: textWidget(
                stringText: 'اختيار صورة خلفية مهنية',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          GetBuilder(
            builder: (SignUpController c) {
              return Center(
                child: GetBuilder(
                  builder: (SignUpController cx) {
                    return cx.toPinedJson?.imageCover != null ||
                            cx.imageCover != null
                        ? Container(
                            width: SizeConfig().widthSize(context, 70),
                            height: SizeConfig().heightSize(context, 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: FileImage(
                                  File(
                                    cx.toPinedJson?.imageCover ??
                                        cx.imageCover!,
                                  ),
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          )
                        : Container(
                            width: SizeConfig().widthSize(context, 70),
                            height: SizeConfig().heightSize(context, 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  placeholderImageIMG,
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          );
                  },
                ),
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController c) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: GetBuilder(
                    builder: (SignUpController cx) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: textWidget(
                              stringText: 'التقاط صورة',
                              fontSize: 18,
                              color: generalColor,
                            ),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:
                                      BorderSide(color: generalColor, width: 1),
                                ),
                              ),
                            ),
                            onPressed: c.onPressedCameraCover,
                          ),
                          TextButton(
                            child: textWidget(
                              stringText: 'اختيار صورة',
                              fontSize: 18,
                              color: generalColor,
                            ),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:
                                      BorderSide(color: generalColor, width: 1),
                                ),
                              ),
                            ),
                            onPressed: c.onPressedGalleryCover,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
          // #endregion

          // #region add more images
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Center(
              child: textWidget(
                stringText: 'اضافة المزيد من الصور المهنية',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          GetBuilder(
            builder: (SignUpController c) {
              print('c.listOfImages.length = ${c.listOfImages.length}');
              // FocusScope.of(context).unfocus();
              return AddCardWidget(
                height: SizeConfig().heightSize(context, 35),
                children: [
                  Center(
                    child: GetBuilder(
                      builder: (SignUpController cx) {
                        return cx.storedImage != null
                            ? Container(
                                width: SizeConfig().widthSize(context, 70),
                                height: SizeConfig().heightSize(context, 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image:
                                        FileImage(File(cx.storedImage ?? '')),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                            : Container(
                                width: SizeConfig().widthSize(context, 70),
                                height: SizeConfig().heightSize(context, 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      placeholderImageIMG,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: textWidget(
                          stringText: 'التقاط صورة',
                          fontSize: 18,
                          color: generalColor,
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: generalColor, width: 1),
                            ),
                          ),
                        ),
                        onPressed: c.onPressedCamera,
                      ),
                      TextButton(
                        child: textWidget(
                          stringText: 'اختيار صورة',
                          fontSize: 18,
                          color: generalColor,
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: generalColor, width: 1),
                            ),
                          ),
                        ),
                        onPressed: c.onPressedGallery,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GetBuilder(
                      builder: (SignUpController c) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: SizeConfig().widthSize(context, 70),
                          height: SizeConfig().heightSize(context, 20),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: FormBuilderTextField(
                              name: 'arabic_description',
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              maxLength: 100,
                              onChanged: (val) =>
                                  c.onChangedarabicDescriptionImage(val),
                              showCursor: true,
                              style: style(fontSize: 20),
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              buildCounter: (
                                BuildContext context, {
                                required int currentLength,
                                required int? maxLength,
                                required bool isFocused,
                              }) {
                                return textWidget(
                                  stringText: '$currentLength / $maxLength',
                                  fontWeight: FontWeight.w600,
                                );
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                focusColor: Colors.white,
                                labelText: 'وصف للصورة بالعربي',
                                labelStyle: style(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                contentPadding: EdgeInsets.all(25),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: GetBuilder(
                      builder: (SignUpController c) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: SizeConfig().widthSize(context, 70),
                          height: SizeConfig().heightSize(context, 20),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: FormBuilderTextField(
                              name: 'english_description',
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              maxLength: 100,
                              onChanged: (val) =>
                                  c.onChangedenglishDescriptionImage(val),
                              showCursor: true,
                              style: style(fontSize: 20),
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              buildCounter: (
                                BuildContext context, {
                                required int currentLength,
                                required int? maxLength,
                                required bool isFocused,
                              }) {
                                return textWidget(
                                  stringText: '$currentLength / $maxLength',
                                  fontWeight: FontWeight.w600,
                                );
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                focusColor: Colors.white,
                                labelText: 'Image Decription in English',
                                labelStyle: style(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                contentPadding: EdgeInsets.all(25),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
                onPressedAddCard: c.addImage,
                onPressedCancel: c.cancelImage,
                stringText: 'تحميل صورة',
                title: 'اضافة صورة جديدة',
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController cx) {
              return Center(
                child: textWidget(
                  // ignore: unnecessary_string_interpolations
                  stringText: "${cx.imageError ?? ''}",
                  color: Colors.red,
                ),
              );
            },
          ),
          GetBuilder(
            builder: (SignUpController c) {
              // FocusScope.of(context).unfocus();
              return Column(
                children: c.listOfImages.map((image) {
                  return ShowListWidget(
                    onPressedEditCard: () => c.editImage(image),
                    onPressedCancel: c.cancelImage,
                    height: SizeConfig().heightSize(context, 40),
                    children3: [
                      Center(
                        child: GetBuilder(
                          builder: (SignUpController cx) {
                            return cx.storedImage != null || image.image != null
                                ? Container(
                                    width: SizeConfig().widthSize(context, 70),
                                    height:
                                        SizeConfig().heightSize(context, 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: FileImage(File(
                                            cx.storedImage ?? image.image!)),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: SizeConfig().widthSize(context, 70),
                                    height:
                                        SizeConfig().heightSize(context, 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(placeholderImageIMG),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: textWidget(
                              stringText: 'التقاط صورة',
                              fontSize: 18,
                              color: generalColor,
                            ),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:
                                      BorderSide(color: generalColor, width: 1),
                                ),
                              ),
                            ),
                            onPressed: c.onPressedCameraEdit,
                          ),
                          TextButton(
                            child: textWidget(
                              stringText: 'اختيار صورة',
                              fontSize: 18,
                              color: generalColor,
                            ),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side:
                                      BorderSide(color: generalColor, width: 1),
                                ),
                              ),
                            ),
                            onPressed: c.onPressedGalleryEdit,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GetBuilder(
                          builder: (SignUpController c) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: SizeConfig().widthSize(context, 70),
                              height: SizeConfig().heightSize(context, 20),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: FormBuilderTextField(
                                  name: 'arabic_description_edit',
                                  minLines: null,
                                  maxLines: null,
                                  expands: true,
                                  maxLength: 100,
                                  showCursor: true,
                                  style: style(fontSize: 20),
                                  textAlign: TextAlign.start,
                                  onChanged: (val) =>
                                      c.onChangedarabicDescriptionImage(val),
                                  textAlignVertical: TextAlignVertical.top,
                                  buildCounter: (
                                    BuildContext context, {
                                    required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused,
                                  }) {
                                    return textWidget(
                                      stringText: '$currentLength / $maxLength',
                                      fontWeight: FontWeight.w600,
                                    );
                                  },
                                  initialValue: image.arabicDescription ??
                                      c.arabicDescriptionImage,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    focusColor: Colors.white,
                                    labelText: 'وصف للصورة بالعربي',
                                    labelStyle: style(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding: EdgeInsets.all(25),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: GetBuilder(
                          builder: (SignUpController c) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: SizeConfig().widthSize(context, 70),
                              height: SizeConfig().heightSize(context, 20),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: FormBuilderTextField(
                                  name: 'english_description_edit',
                                  onChanged: (val) =>
                                      c.onChangedenglishDescriptionImage(val),
                                  minLines: null,
                                  maxLines: null,
                                  expands: true,
                                  maxLength: 100,
                                  showCursor: true,
                                  style: style(fontSize: 20),
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.top,
                                  buildCounter: (
                                    BuildContext context, {
                                    required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused,
                                  }) {
                                    return textWidget(
                                      stringText: '$currentLength / $maxLength',
                                      fontWeight: FontWeight.w600,
                                    );
                                  },
                                  initialValue: image.englishDescription ??
                                      c.englishDescriptionImage,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    focusColor: Colors.white,
                                    labelText: 'Image Decription in English',
                                    labelStyle: style(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding: EdgeInsets.all(25),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    children2: [
                      Center(
                        child: image.image != null
                            ? Container(
                                width: SizeConfig().widthSize(context, 70),
                                height: SizeConfig().heightSize(context, 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(image.image ?? ''),
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                            : Container(
                                width: SizeConfig().widthSize(context, 70),
                                height: SizeConfig().heightSize(context, 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      placeholderImageIMG,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 10),
                      textWidget(
                        stringText:
                            'الوصف العربي : ${image.arabicDescription ?? ''}',
                        fontSize: 20,
                      ),
                      SizedBox(height: 10),
                      textWidget(
                        stringText:
                            '${image.englishDescription ?? ''} : English description',
                        fontSize: 20,
                      ),
                    ],
                    stringText: 'صورة',
                    title: 'التعديل على الصورة',
                    onPressedRemove: () => c.removeImage(image),
                  );
                }).toList(),
              );
            },
          ),
          // #endregion
        ],
      ),
    );
  }
}
