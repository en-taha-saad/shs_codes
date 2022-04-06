import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/public_institution_profile/controllers/publi_institution_profile_map.dart';
import 'package:shs108private/app/modules/public_institution_profile/controllers/public_institution_profile_controller.dart';
import 'package:flutter/material.dart' as text_direction;
import 'package:shs108private/app/modules/public_institution_profile/controllers/public_institution_profile_provider.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class PublicInstitutionProfileView
    extends GetView<PublicInstitutionProfileController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: text_direction.TextDirection.rtl,
      child: Scaffold(
        body: FutureBuilder(
          future: controller.getPublicInstituionsVar,
          builder: (
            BuildContext context,
            AsyncSnapshot<InstitutionsProfile> snapshot,
          ) {
            if (snapshot.hasData) {
              InstitutionsProfile? institut = snapshot.data;
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(height: MediaQuery.of(context).size.height),
                    Stack(
                      children: [
                        // isCover == true
                        //     ? Image.network(
                        //         // "$imageUrl/$coverImage",
                        //         "$coverImage",
                        //         height:
                        //             MediaQuery.of(context).size.height / 3.8,
                        //         width: MediaQuery.of(context).size.width,
                        //         fit: BoxFit.cover,
                        //       )
                        //     :
                        Image.asset(
                          // "assets/general_for_two_apps/shared/placeholder_image.jpg",
                          "${Get.arguments}",
                          height: MediaQuery.of(context).size.height / 3.8,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3.8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black38,
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 7.5,
                            horizontal: 20.0,
                          ),
                          child: Container(),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 12 - 5,
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 170,
                      left: 15,
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.height / 6 + 10,
                          height: MediaQuery.of(context).size.height / 6 + 10,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 174,
                      left: 20,
                      child: ClipOval(
                        child: Container(
                          color: Colors.lightBlue,
                          width: MediaQuery.of(context).size.height / 6,
                          height: MediaQuery.of(context).size.height / 6,
                          child: isProfile == false
                              ? Image.asset(
                                  "assets/general_for_two_apps/shared/placeholder_image.jpg",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "$imageUrl/$profileImage",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    institut?.reservationSetting?.reserveOnline != null
                        ? institut?.reservationSetting?.reserveOnline == 1
                            ? Positioned(
                                top: 360,
                                left: 30.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(20),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(generalColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.CLINICS_RESERVATION);
                                  },
                                  child: textWidget(
                                    stringText: 'حجز اونلاين',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              )
                            : Container()
                        : Container(),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6 + 10,
                        right: 20,
                        left: 20,
                        bottom: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 35.0),
                          SizedBox(
                            width: 250,
                            child: textWidget(
                              stringText: institut?.name ?? '',
                              fontSize: 18,
                              color: Colors.white,
                              textAlign: TextAlign.right,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Row(
                            children: [
                              textWidget(
                                stringText: "رمز SHS : ",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textWidget(
                                stringText: '',
                                fontSize: 17,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              textWidget(
                                stringText: "رقم التسجيل في النقابة : ",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textWidget(
                                stringText: institut?.registrationNo ?? '',
                                fontSize: 17,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          // ignore: prefer_is_empty
                          institut?.phones?.length != 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "ارقام الهاتف",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 6.0),
                                    textWidget(
                                      stringText: institut?.phones
                                              ?.map((e) => e.phone)
                                              .toList()
                                              .join('\n') ??
                                          '',
                                      fontSize: 17,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 20),
                          // ignore: prefer_is_empty
                          institut?.medicalSpecialties?.length != 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "الأختصاصات العلاجية",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 6.0),
                                    textWidget(
                                      stringText: institut?.medicalSpecialties
                                              ?.map((e) {
                                                if (e.name == 'اخرى') {
                                                  return e.extraInfo?.other ??
                                                      '';
                                                } else {
                                                  return e.name ?? '';
                                                }
                                              })
                                              .toList()
                                              .join('\n') ??
                                          '',
                                      fontSize: 17,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                )
                              : Container(),
                          // ignore: prefer_is_empty
                          institut?.institutionTreatments?.length != 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "الخدمات العلاجية",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textWidget(
                                      stringText: institut
                                              ?.institutionTreatments
                                              ?.map((e) => e.name)
                                              .toList()
                                              .join('\n') ??
                                          '',
                                      fontSize: 17,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                )
                              : Container(),

                          institut?.address != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "العنوان",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 5),
                                    textWidget(
                                      stringText:
                                          // ignore: prefer_if_null_operators
                                          '${institut?.address?.country?.name != null ? institut?.address?.country?.name : ''} ${institut?.address?.governorate != null ? ' - ${institut?.address?.governorate?.name}' : ''} ${institut?.address?.city != null ? ' - ${institut?.address?.city?.name}' : ''} ${institut?.address?.region != null ? ' - ${institut?.address?.region?.name}' : ''} ${institut?.address?.nearBy != null || institut?.address?.nearBy != '' ? ' - ${institut?.address?.nearBy}' : ''}',
                                      fontSize: 17,
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width,
                                      child: PublicProfileMarkersPage(),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                )
                              : Container(),
                          // SfMaps(
                          //   layers: [
                          //     // ${institut?.address?.location?.latitude}
                          //     // ${institut?.address?.location?.longitude}
                          //     MapTileLayer(
                          //       urlTemplate:
                          //           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          //       controller: MapTileLayerController(),
                          //       initialFocalLatLng: MapLatLng(
                          //         (institut?.address?.location?.latitude)!,
                          //         (institut?.address?.location?.longitude)!,
                          //       ),
                          //       initialZoomLevel: 15,
                          //       tooltipSettings: MapTooltipSettings(
                          //         color: Colors.red,
                          //       ),
                          //       zoomPanBehavior: MapZoomPanBehavior(
                          //         enablePinching: true,
                          //         enableDoubleTapZooming: true,
                          //         enablePanning: true,
                          //         focalLatLng: MapLatLng(
                          //           (institut?.address?.location?.latitude)!,
                          //           (institut?.address?.location?.longitude)!,
                          //         ),
                          //         showToolbar: true,
                          //         zoomLevel: 15,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // ignore: prefer_is_empty
                          days.length != 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "اوقات الدوام",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // ignore: prefer_is_empty
                                    days.length != 0
                                        ? Column(
                                            children: days
                                                .map<Widget>((e) => Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          textWidget(
                                                            stringText:
                                                                '${e.day}',
                                                            fontSize: 17,
                                                          ),
                                                          textWidget(
                                                            stringText:
                                                                '${e.startTime} - ${e.endTime}',
                                                            fontSize: 17,
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                .toList(),
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
                          // ignore: prefer_is_empty
                          institut?.staffs?.length != 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWidget(
                                      stringText: "كادر العيادة",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children:
                                          institut?.staffs?.map((oneStaff) {
                                        List<DayTime> staffDays = [];
                                        oneStaff.availableSchedules
                                            ?.forEach((e) {
                                          if (e.recurringWeekDay == 'SA') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'السبت',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'SU') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الأحد',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'MO') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الأثنين',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'TU') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الثلاثاء',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'WE') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الأربعاء',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'TH') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الخميس',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                          if (e.recurringWeekDay == 'FR') {
                                            staffDays.add(
                                              DayTime(
                                                day: 'الجمعة',
                                                startTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.startDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                                endTime: '${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[0]} ${DateFormat.jm().format(
                                                      DateFormat("hh:mm").parse(
                                                          (e.endDate?.split(
                                                              ' ')[1])!),
                                                    ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
                                              ),
                                            );
                                          }
                                        });
                                        print(
                                          'oneStaff.staffInfo?.image?.imageUrl = ${oneStaff.staffInfo?.image?.imageUrl}',
                                        );
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 15,
                                          ),
                                          margin: EdgeInsets.only(
                                            bottom: 15,
                                            top: 15,
                                            left: 15,
                                            right: 15,
                                          ),
                                          // height: double.infinity,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 90,
                                                    height: 90,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 20.0,
                                                    ),
                                                    child: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "$imageUrl/${oneStaff.staffInfo?.image?.imageUrl}",
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Image.network(
                                                          '$imageUrl/${oneStaff.staffInfo?.image?.imageUrl}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        placeholder:
                                                            (context, url) =>
                                                                Image.asset(
                                                          "assets/general_for_two_apps/shared/placeholder_image.jpg",
                                                          fit: BoxFit.cover,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                            url, error) {
                                                          debugPrint(
                                                              'error: $error');
                                                          return Image.asset(
                                                            "assets/general_for_two_apps/shared/placeholder_image.jpg",
                                                            fit: BoxFit.cover,
                                                          );
                                                          // return Center(child: Icon(Icons.error));
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      textWidget(
                                                        stringText:
                                                            '${oneStaff.staffInfo?.firstName} ${oneStaff.staffInfo?.secondName} ${oneStaff.staffInfo?.sureName}',
                                                        fontSize: 18,
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      textWidget(
                                                        stringText:
                                                            '${oneStaff.staffInfo?.enFirstName} ${oneStaff.staffInfo?.enSecondName}',
                                                        fontSize: 17,
                                                      ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          shape:
                                                              MaterialStateProperty
                                                                  .all(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10,
                                                              ),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      generalColor),
                                                          padding:
                                                              MaterialStateProperty
                                                                  .all(EdgeInsets
                                                                      .symmetric(
                                                            vertical: 5,
                                                            horizontal: 7,
                                                          )),
                                                        ),
                                                        onPressed: () {
                                                          Get.toNamed(
                                                            Routes
                                                                .PUBLIC_DOCTOR_PROFILE,
                                                            arguments: oneStaff
                                                                .staffInfo
                                                                ?.patientableId,
                                                          );
                                                        },
                                                        child: textWidget(
                                                          stringText:
                                                              'زيارة الصفحة الشخصية',
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          backgroundColor:
                                                              generalColor,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    textWidget(
                                                      stringText:
                                                          'الخدمات المتاحة',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: oneStaff
                                                                .serviceFees
                                                                ?.map<Widget>(
                                                                    (x) =>
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(
                                                                            top:
                                                                                10.0,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              textWidget(
                                                                                stringText: '${x.service?.name == 'اخرى' ? x.other : x.service?.name}',
                                                                                fontSize: 17,
                                                                              ),
                                                                              SizedBox(width: 20),
                                                                              textWidget(
                                                                                stringText: '${x.price} ${x.currency == 'USD' ? 'دولار' : 'دينار'}',
                                                                                fontSize: 17,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ))
                                                                .toList()
                                                            as List<Widget>,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // ignore: prefer_is_empty
                                              staffDays.length != 0
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 20.0,
                                                          ),
                                                          child: textWidget(
                                                            stringText:
                                                                'اوقات الدوام',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            children: staffDays
                                                                .map((y) {
                                                              return Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      10.0,
                                                                  horizontal:
                                                                      30.0,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    textWidget(
                                                                      stringText:
                                                                          '${y.day}',
                                                                      fontSize:
                                                                          17,
                                                                    ),
                                                                    textWidget(
                                                                      stringText:
                                                                          '${y.startTime} - ${y.endTime}',
                                                                      fontSize:
                                                                          17,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        );
                                      }).toList() as List<Widget>,
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: textWidget(
                  stringText: 'حدث خطأ ما يرجى إعادة المحاولة',
                  fontSize: 20,
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
