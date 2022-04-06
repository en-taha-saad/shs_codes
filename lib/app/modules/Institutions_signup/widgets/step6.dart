import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/methods/size_config.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/global/widgets/textfieldform.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';
import 'package:shs108private/app/modules/Institutions_signup/models/saved_data_in_mobile_model.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/widgets/dropdown_formfield.dart';
import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';
// import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
// import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(children: [
              GetBuilder(
                builder: (InstitutionsSignupController c) {
                  return Column(
                    children: c.listOfStaff.where((element) => !c.isNotDoctor.contains(element.staffId)).map(
                      (staff) {
                        print('staffController.text = ${c.staffController}');
                        return ShowListWidget2(
                          height: SizeConfig().heightSize(context, 40),
                          children2: [
                            SizedBox(height: 10),
                            textWidget(
                              stringText: 'الطبيب : '
                                  '${c.staffNames[staff.staffId]}',
                              fontSize: 20,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                textWidget(
                                  stringText: 'الخدمات ',
                                  fontSize: 20,
                                ),
                                GetBuilder(
                                  builder:(InstitutionsSignupController cx)
                                  {
                                    print("******${cx.selectedStaffServices[
                                    staff.staffId
                                        .toString()]}");
                                    return Container(
                                                width: SizeConfig()
                                                    .widthSize(context, 58),
                                                height: SizeConfig()
                                                    .heightSize(context, 9),
                                                child:
                                                    MultiSelectDropDownFormField(
                                                  onChange: (ser) => cx
                                                      .onChangedSelectedServices2(
                                                          ser, staff),
                                                  selectedItems:
                                                      cx.selectedStaffServices[
                                                              staff.staffId
                                                                  .toString()] ??
                                                          [],
                                                  items: cx.services,
                                                  //             onFind: (filter)=>c.onFindServicesList
                                                  // (filter),

                                                  onFind: c.services.isEmpty
                                                      ? (filter) =>
                                                          c.onFindServicesList(
                                                              filter)
                                                      : null,
                                                ),
                                              );
                                            }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder(
                              builder: (InstitutionsSignupController c) {
                                print(
                                    "staff.serviceFees! =${staff.serviceFees!.length}");
                                return Column(
                                  children:
                                  // staff.serviceFees!.map(
                                  //   (service) {
                                  //     return Container(
                                  //       alignment: Alignment.centerRight,
                                  //       child: Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           textWidget(
                                  //               stringText: c
                                  //                       .selectedStaffServices[
                                  //                           staff.staffId
                                  //                               .toString()]
                                  //                       ?.where((element) =>
                                  //                           element.id ==
                                  //                           service.serviceId)
                                  //                       .first
                                  //                       .name ??
                                  //                   '',
                                  //               // service.serviceId.toString(),
                                  //               fontSize: 18,
                                  //               color: Colors.black),
                                  //           SizedBox(
                                  //             height: 10,
                                  //           ),
                                  //           GetBuilder(
                                  //             builder:
                                  //                 (InstitutionsSignupController
                                  //                     c) {
                                  //               return Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceBetween,
                                  //                 children: [
                                  //                   CustomDialogTextField(
                                  //                     width: SizeConfig()
                                  //                         .widthSize(
                                  //                             context, 40),
                                  //                     hintText: 'سعر الخدمة',
                                  //                     initialValue: service
                                  //                                 .price
                                  //                                 .toString() ==
                                  //                             '0'
                                  //                         ? ''
                                  //                         : service.price
                                  //                             .toString(),
                                  //                     name:
                                  //                         'price${service.serviceId}',
                                  //                     validator:
                                  //                         FormBuilderValidators
                                  //                             .compose([
                                  //                       FormBuilderValidators
                                  //                           .required(
                                  //                         context,
                                  //                         errorText:
                                  //                             textfieldErrorText,
                                  //                       ),
                                  //                     ]),
                                  //                     onChanged: (string) =>
                                  //                         c.onChangePrice(
                                  //                             string,
                                  //                             service,
                                  //                             staff),
                                  //                     autovalidateMode:
                                  //                         AutovalidateMode
                                  //                             .onUserInteraction,
                                  //                     keyboardType:
                                  //                         TextInputType.number,
                                  //                   ),
                                  //                   Container(
                                  //                     width: SizeConfig()
                                  //                         .widthSize(
                                  //                             context, 30),
                                  //                     height: SizeConfig()
                                  //                         .heightSize(
                                  //                             context, 7),
                                  //                     child: DropdownSearch<
                                  //                         GetDataModel?>(
                                  //                       dropdownSearchDecoration:
                                  //                           InputDecoration(
                                  //                         filled: true,
                                  //                         errorStyle: style(
                                  //                           fontSize: 12,
                                  //                           color: Colors.red,
                                  //                         ),
                                  //                         contentPadding:
                                  //                             EdgeInsets.all(
                                  //                                 10),
                                  //                         isDense: false,
                                  //                         border:
                                  //                             OutlineInputBorder(
                                  //                           borderSide:
                                  //                               BorderSide.none,
                                  //                         ),
                                  //                       ),
                                  //                       maxHeight: 500,
                                  //                       items: c.currencyMap,
                                  //                       onChanged: (currency) =>
                                  //                           c.onChangedSelectedCurrency(
                                  //                               currency,
                                  //                               service,
                                  //                               staff),
                                  //                       selectedItem:
                                  //                          GetDataModel(
                                  //                         id: service.currency ==
                                  //                                 "IQD"
                                  //                             ? 1
                                  //                             : 2,
                                  //                         name:
                                  //                             service.currency ==
                                  //                                     "IQD"
                                  //                                 ? 'دينار'
                                  //                                 : 'دولار',
                                  //                       ),
                                  //                       popupBarrierColor:
                                  //                           Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5),
                                  //                       showAsSuffixIcons: true,
                                  //                       itemAsString: (u) {
                                  //                         return (u?.name).toString();
                                  //                       },
                                  //                       showSearchBox: true,
                                  //                       autoValidateMode:
                                  //                           AutovalidateMode
                                  //                               .onUserInteraction,
                                  //                       validator:
                                  //                           FormBuilderValidators
                                  //                               .compose([
                                  //                         FormBuilderValidators
                                  //                             .required(
                                  //                           context,
                                  //                           errorText:
                                  //                               dropdownErrorText,
                                  //                         ),
                                  //                       ]),
                                  //                       mode: Mode.DIALOG,
                                  //                       showClearButton: false,
                                  //                       popupSafeArea:
                                  //                           PopupSafeArea(
                                  //                         top: true,
                                  //                         bottom: true,
                                  //                       ),
                                  //                       clearButtonSplashRadius:
                                  //                           20,
                                  //                       popupItemBuilder:
                                  //                           (__, model, _) {
                                  //                         return Directionality(
                                  //                           textDirection:
                                  //                               TextDirection
                                  //                                   .rtl,
                                  //                           child: Container(
                                  //                             padding:
                                  //                                 EdgeInsets
                                  //                                     .all(15),
                                  //                             child: Center(
                                  //                               child:
                                  //                                   textWidget(
                                  //                                 stringText:
                                  //                                     model?.name ??
                                  //                                         '',
                                  //                                 fontSize: 20,
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                         );
                                  //                       },
                                  //                       dropdownBuilder: (__,
                                  //                           GetDataModel?
                                  //                               model) {
                                  //                         if (model == null) {
                                  //                           return Container();
                                  //                         }
                                  //                         return Directionality(
                                  //                           textDirection:
                                  //                               TextDirection
                                  //                                   .rtl,
                                  //                           child: Container(
                                  //                             child: Center(
                                  //                               child:
                                  //                                   textWidget(
                                  //                                 stringText:
                                  //                                     model
                                  //                                         .name,
                                  //                                 fontSize: 17,
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                         );
                                  //                       },
                                  //                       emptyBuilder:
                                  //                           (_, item) {
                                  //                         return Center(
                                  //                           child: textWidget(
                                  //                             stringText:
                                  //                                 "لا يوجد $item",
                                  //                             fontSize: 30,
                                  //                           ),
                                  //                         );
                                  //                       },
                                  //                       searchFieldProps:
                                  //                           TextFieldProps(
                                  //                         textDirection:
                                  //                             TextDirection.rtl,
                                  //                         decoration:
                                  //                             InputDecoration(
                                  //                           border:
                                  //                               OutlineInputBorder(),
                                  //                           contentPadding:
                                  //                               EdgeInsets
                                  //                                   .fromLTRB(
                                  //                                       12,
                                  //                                       12,
                                  //                                       8,
                                  //                                       0),
                                  //                           hintText:
                                  //                               "ابحث هنا",
                                  //                           hintStyle: style(),
                                  //                           hintTextDirection:
                                  //                               TextDirection
                                  //                                   .rtl,
                                  //                         ),
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               );
                                  //             },
                                  //           ),
                                  //
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // ).toList(),
                                  servicesList(staff,context,c)
                                );
                              },
                            ),
                            //
                            GetBuilder(
                              builder: (InstitutionsSignupController cx) {
                                return cx.servicePriceSelectedOther?GetBuilder(
                                  builder: (InstitutionsSignupController c) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: CustomDialogTextFieldTextContainer(
                                            fontSize: 18,
                                            stringText: 'خدمة جديدة',
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig().widthSize(context, 64),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomDialogTextField(
                                                width: SizeConfig().widthSize(context, 50),
                                                hintText: 'أدخل خدمة اخرى',
                                                initialValue: c.servicePriceController,
                                                name: 'other_price_services',
                                                validator: FormBuilderValidators.compose([
                                                  FormBuilderValidators.maxLength(
                                                    context,
                                                    100,
                                                    errorText: 'يجب ان لا يزيد الإسم عن 100 حرف',
                                                  ),
                                                ]),
                                                autovalidateMode:
                                                AutovalidateMode.onUserInteraction,
                                                onChanged: c.onChangedServicePriceController,
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(bottom: 10,left: 0),
                                                  width: SizeConfig().widthSize(context, 13),
                                                  height: 50,
                                                  child:  TextButton(
                                                      onPressed: ()=>c
                                                          .onChangedOtherServices(c.servicePriceController,staff),
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            color: generalColor.withOpacity(0.1),
                                                            borderRadius: BorderRadius.circular(7)
                                                        ),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: generalColor,
                                                          size: 30,
                                                        ),
                                                      )
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                        textWidget(stringText: c.stepError,
                                            color: Colors.red)
                                      ],
                                    );
                                  },
                                ):Container();
                              },
                            ),
                            GetBuilder(
                              builder: (InstitutionsSignupController c) {
                                return AddCardWidgetWithoutDialog(
                                  height: SizeConfig().heightSize(context, 10),
                                  onPressedAddCard: c.openServicePriceText,
                                  stringText: 'أضف خدمة جديدة',
                                );
                              },
                            ),
                            SizedBox(height: 20),
                          ],
                          stringText: ' اسم الطبيب '
                              // ' ${certificate.otherCertificate != '' ? certificate.otherCertificate : certificate.certificateInforms?.name}'

                              '${c.staffNames[staff.staffId]}',
                          // c.removeCertificate(certificate),
                        );
                      },
                    ).toList(),
                  );
                },
              ),

            ])));
  }
  List<Widget> servicesList(Staffs staff,context,InstitutionsSignupController
  c){
    List<Widget> services=[];
    String price='';
    if(c.selectedStaffServices[staff.staffId.toString()]!=null){
      for (int i = 0;
          i < c.selectedStaffServices[staff.staffId.toString()]!.length;
          i++) {
        // print("2-staff.staffId"+ staff.staffId.toString());
        // print("3-selectedStaffServices[staff.staffId.toString()"
        //     "]${selectedStaffServices[
        // staff.staffId
        //     .toString()]}");
        // print("4-${selectedStaffServices[
        // staff.staffId
        //     .toString()]![i]
        //     .name} 44444 ${
        //     selectedStaffServices[
        //     staff.staffId
        //         .toString()]![i].other}");
        ServiceFees service = staff.serviceFees![i];
        services.add(Container(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                      stringText:
                          c.selectedStaffServices[staff.staffId.toString()]![i]
                                      .id ==
                                  null
                              ? c
                                  .selectedStaffServices[
                                      staff.staffId.toString()]![i]
                                  .other
                              : c
                                  .selectedStaffServices[
                                      staff.staffId.toString()]![i]
                                  .name,
                      // service.serviceId.toString(),
                      fontSize: 18,
                      color: Colors.black),
                  service.other!=''?TextButton(
                      onPressed: () => c.removeService2(staff, i)
                      // onPressed: () {}
                      ,
                      child: Container(
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      )):Container()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder(
                builder: (InstitutionsSignupController c) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder(
                        builder: (InstitutionsSignupController cx) {
                          return CustomDialogTextField(
                            width: SizeConfig().widthSize(context, 40),
                            hintText: 'سعر الخدمة',
                            key: Key('price${staff.staffId}_${service
                                .serviceId??service.other}'),
                            // initialValue: price== '0' ?'': price,
                            initialValue: cx.listOfStaff
                                        .where((element) =>
                                            element.staffId == staff.staffId)
                                        .first
                                        .serviceFees![i]
                                        .price
                                        .toString() ==
                                    '0'
                                ? ''
                                : service.price.toString(),
                            name: 'price${staff.staffId}_${service
                                .serviceId??service.other}',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                context,
                                errorText: textfieldErrorText,
                              ),
                            ]),
                            onChanged: (string) =>
                                cx.onChangePrice(string, i, staff),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                          );
                        },
                      ),
                      Container(
                        width: SizeConfig().widthSize(context, 30),
                        height: SizeConfig().heightSize(context, 7),
                        child: DropdownSearch<GetDataModel?>(
                          dropdownSearchDecoration: InputDecoration(
                            filled: true,
                            errorStyle: style(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            isDense: false,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          maxHeight: 500,
                          items: c.currencyMap,
                          onChanged: (currency) =>
                              c.onChangedSelectedCurrency(currency, i, staff),
                          selectedItem: GetDataModel(
                            id: service.currency == "IQD" ? 1 : 2,
                            name: service.currency == "IQD" ? 'دينار' : 'دولار',
                          ),
                          popupBarrierColor: Colors.grey.withOpacity(0.5),
                          showAsSuffixIcons: true,
                          itemAsString: (u) {
                            return (u?.name).toString();
                          },
                          showSearchBox: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              context,
                              errorText: dropdownErrorText,
                            ),
                          ]),
                          mode: Mode.DIALOG,
                          showClearButton: false,
                          popupSafeArea: PopupSafeAreaProps(
                            top: true,
                            bottom: true,
                          ),
                          clearButtonSplashRadius: 20,
                          popupItemBuilder: (__, model, _) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: textWidget(
                                    stringText: model?.name ?? '',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          },
                          dropdownBuilder: (__, GetDataModel? model) {
                            if (model == null) {
                              return Container();
                            }
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                child: Center(
                                  child: textWidget(
                                    stringText: model.name,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            );
                          },
                          emptyBuilder: (_, item) {
                            return Center(
                              child: textWidget(
                                stringText: "لا يوجد $item",
                                fontSize: 30,
                              ),
                            );
                          },
                          searchFieldProps: TextFieldProps(
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                              hintText: "ابحث هنا",
                              hintStyle: style(),
                              hintTextDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
      }
    }
    return services;
  }
}

