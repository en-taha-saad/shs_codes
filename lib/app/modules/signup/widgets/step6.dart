// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';

class Step6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ///

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     TextButton(
            //       onPressed: () => RestartWidget.restartApp(context),
            //       child: textWidget(stringText: 'ترسيت'),
            //     ),
            //     GetBuilder<SignUpController>(
            //       builder: (c) {
            //         return TextButton(
            //           onPressed: c.onStepRemove,
            //           child: textWidget(stringText: 'حذف'),
            //         );
            //       },
            //     ),
            //   ],
            // ),

            ///
            GetBuilder(
              builder: (SignUpController c) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // #region username
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'اسم المستخدم*',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) {
                        c.changetextInputHeight();
                        c.onChangedUsername(val);
                      },
                      initialValue:
                          c.toPinedJson?.doctor?.username ?? c.username,
                      icons: Icons.person,
                      maxLength: 8,
                      width: SizeConfig().widthSize(context, 75),
                      height: c.textInputHeight,
                      hintText: 'يرجى ادخال اسم المستخدم',
                      name: 'username',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          context,
                          errorText: textfieldErrorText,
                        ),
                        FormBuilderValidators.minLength(
                          context,
                          8,
                          errorText: 'اسم المستخدم لا يقل عن 8',
                        ),
                      ]),
                    ),
                    // #endregion

                    // #region emails
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'البريد الالكتروني المهني الاول',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) => c.onChangedEmail1(val),
                      initialValue: c.toPinedJson?.emails?.length != 0
                          ? (c.toPinedJson?.emails?[0].email ?? c.email1)
                          : c.email1,
                      icons: Icons.email,
                      width: SizeConfig().widthSize(context, 75),
                      height: c.textInputHeight,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'البريد الالكتروني',
                      name: 'profession_first_email',
                      validator: (String? firstEmail) {
                        if (firstEmail != null) {
                          if (firstEmail != '') {
                            if (!firstEmail.contains('@')) {
                              return ("يرجى ادخال ايميل صالح");
                            }
                          }
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),

                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'البريد الالكتروني المهني الثاني',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) => c.onChangedEmail2(val),
                      initialValue: c.toPinedJson?.emails?.length != 0
                          ? (c.toPinedJson?.emails?[1].email ?? c.email2)
                          : c.email2,
                      icons: Icons.email,
                      width: SizeConfig().widthSize(context, 75),
                      height: c.textInputHeight,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'البريد الالكتروني',
                      name: 'profession_second_email',
                      validator: (String? secondEmail) {
                        if (secondEmail != null) {
                          if (secondEmail != '') {
                            if (secondEmail == c.email1) {
                              return (" يرجى ادخال أيميل اّخر");
                            }
                            if (!secondEmail.contains('@')) {
                              return ("يرجى ادخال ايميل صالح");
                            }
                          }
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    // #endregion

                    // #region phones
                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'الرقم المهني الاول',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) => c.onChangedPhone1(val),
                      initialValue: c.toPinedJson?.phones?.length != 0
                          ? (c.toPinedJson?.phones?[0].phone
                                  ?.replaceAll('+964', '0') ??
                              c.phone1)
                          : c.phone1,
                      icons: Icons.phone,
                      width: SizeConfig().widthSize(context, 75),
                      height: c.textInputHeight,
                      maxLength: 11,
                      suffix: textWidget(stringText: '+964'),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? firstPhone) {
                        print('firstPhone = $firstPhone');
                        if (firstPhone != null) {
                          if (firstPhone != '') {
                            if (firstPhone.length != 11) {
                              return ("يرجى ادخال رقم هاتف صالح");
                            }
                            if (firstPhone.length > 11) {
                              return ("الرقم لا يزيد عن 11");
                            }
                            if (!firstPhone.startsWith('0')) {
                              return ("يجب ان يبدأ الرقم ب 0");
                            }
                          }
                        } else {
                          return null;
                        }
                      },
                      hintText: 'رقم الهاتف',
                      name: 'profession_first_phone',
                    ),

                    CustomDialogTextFieldTextContainer(
                      fontSize: 15,
                      stringText: 'الرقم المهني الثاني',
                    ),
                    CustomDialogTextField(
                      onChanged: (val) => c.onChangedPhone2(val),
                      initialValue: c.toPinedJson?.phones?.length != 0
                          ? (c.toPinedJson?.phones?[1].phone
                                  ?.replaceAll('+964', '0') ??
                              c.phone2)
                          : c.phone2,
                      width: SizeConfig().widthSize(context, 75),
                      height: c.textInputHeight,
                      maxLength: 11,
                      icons: Icons.phone,
                      suffix: textWidget(stringText: '+964'),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? secondPhone) {
                        print('secondPhone = $secondPhone');
                        if (secondPhone != null) {
                          if (secondPhone != '') {
                            if (secondPhone.length != 11) {
                              return ("يرجى ادخال رقم هاتف صالح");
                            }
                            if (secondPhone.length > 11) {
                              return ("الرقم لا يزيد عن 11");
                            }
                            if (!secondPhone.startsWith('0')) {
                              return ("يجب ان يبدأ الرقم ب 0");
                            }
                          }
                        } else {
                          return null;
                        }
                      },
                      hintText: 'رقم الهاتف',
                      name: 'profession_second_phone',
                    ),
                    // #endregion

                    // #region settings
                    c.selectAllCheckbox(c.checkbox),
                    Divider(),
                    ...c.listOfCheckboxes.map(c.settingsCheckboxes).toList(),
                    // #endregion

                    // #region cancel Activiation
                    // SizedBox(height: 20),
                    // GetBuilder(
                    //   builder: (SignUpController cxx) {
                    //     return TextButton(
                    //       onPressed: cxx.onPressedCancelActivation,
                    //       style: ButtonStyle(
                    //         shape: MaterialStateProperty.all(
                    //           RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //             side: BorderSide(color: generalColor, width: 1),
                    //           ),
                    //         ),
                    //         padding: MaterialStateProperty.all(
                    //           EdgeInsets.symmetric(
                    //             horizontal: 20,
                    //             vertical: 20,
                    //           ),
                    //         ),
                    //       ),
                    //       child: textWidget(
                    //         stringText: "الغاء تنشيط الحسابات",
                    //         fontWeight: FontWeight.w900,
                    //         color: Colors.black,
                    //         fontSize: 18,
                    //       ),
                    //     );
                    //   },
                    // ),
                    // GetBuilder(
                    //   builder: (SignUpController cxx) {
                    //     return cxx.selectedCancelActivation
                    //         ? Column(
                    //             children: [
                    //               SizedBox(height: 20),
                    //               ElevatedButton(
                    //                 onPressed: () {},
                    //                 style: ButtonStyle(
                    //                   shape: MaterialStateProperty.all(
                    //                     RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(20),
                    //                     ),
                    //                   ),
                    //                   padding: MaterialStateProperty.all(
                    //                     EdgeInsets.symmetric(
                    //                       horizontal: 20,
                    //                       vertical: 20,
                    //                     ),
                    //                   ),
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(
                    //                     generalColor,
                    //                   ),
                    //                 ),
                    //                 child: textWidget(
                    //                   stringText: "ايقاف الصفحة المهنية",
                    //                   fontWeight: FontWeight.w900,
                    //                   color: Colors.white,
                    //                   fontSize: 18,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 10),
                    //               ElevatedButton(
                    //                 onPressed: () {},
                    //                 style: ButtonStyle(
                    //                   shape: MaterialStateProperty.all(
                    //                     RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(20),
                    //                     ),
                    //                   ),
                    //                   padding: MaterialStateProperty.all(
                    //                     EdgeInsets.symmetric(
                    //                       horizontal: 20,
                    //                       vertical: 20,
                    //                     ),
                    //                   ),
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(
                    //                     generalColor,
                    //                   ),
                    //                 ),
                    //                 child: textWidget(
                    //                   stringText: "ايقاف الحساب المهني بالكامل",
                    //                   fontWeight: FontWeight.w900,
                    //                   color: Colors.white,
                    //                   fontSize: 18,
                    //                 ),
                    //               ),
                    //             ],
                    //           )
                    //         : Container();
                    //   },
                    // ),
                    // #endregion
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
