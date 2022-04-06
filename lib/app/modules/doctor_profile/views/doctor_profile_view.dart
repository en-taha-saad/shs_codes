import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/main.dart';

import '../doctor_model.dart';

class DoctorProfileView extends StatefulWidget {
  const DoctorProfileView({Key? key}) : super(key: key);

  @override
  _DoctorProfileViewState createState() => _DoctorProfileViewState();
}

class _DoctorProfileViewState extends State<DoctorProfileView> {
  // bool wait = true;

  Doctor doctor = Doctor();
  // List<University> universities = [];
  Future<Doctor> fetechDoctorProfile() async {
    var headers = {
      // 'Authorization': 'Bearer 53|Dool0k80Uw2cWBVF1r9f7zpDectqQ0omdsOpssFu',
      'Authorization': 'Bearer $savedToken',
      'Accept': 'application/json'
    };

    var request = http.Request(
      'GET',
      Uri.parse('$url/doctor_profile'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('@@@@@@@@@@@@@@@@@@@@@77777');
      var responseBody = await response.stream.bytesToString();
      print('@@@@@@@@@@@@@@@@@@@@@8888');
      var data = json.decode(responseBody);
      print('@@@@@@@@@@@@@@@@@@@@@9999');
      print('data = $data');
      doctor = Doctor.fromJson(data[0]);
      setState(() {});
      print('@@@@@@@@@@@@@@@@@@@@@00000');
      return doctor;
    } else {
      print('@@@@@@@@@@@@@@@@@@@@@88888');
      var responseBody = await response.stream.bytesToString();
      var data = json.decode(responseBody);
      return data;
    }
  }

  Future<Doctor>? fetechDoctorProfileVar;
  @override
  void initState() {
    fetechDoctorProfileVar = fetechDoctorProfile();
    /*
    print(jsonEncode({'json':jsonEncode(DoctorReg(
      doctor: DoctorR(registrationNo: "43513f",username: "username2"),
      doctorTitles: [
        DoctorTitles(id: 1,other: "kk"),DoctorTitles(id: 2,)
      ],
      doctorDescription: [
        DoctorDescription(languageCode: "ar",experiences: ""
            "ماعنده خبرة",),
        DoctorDescription(languageCode: "en",descriptions: ""
            "no khebra maa alasff")
      ],
      setting : Setting(showPhone: 0,showEmail: 0,showMessages: 0,
          showRecommendations: 0,showRatings: 1),
      doctorCertificates:[
        DoctorCertificates(certificateId: 1,
            otherCertificate: "طبببب",universityId: 1,otherUniversity: "يامعة "
                "برلين",graduationYear: 2005),
      ],
      trainingPrograms: [
        TrainingPrograms(name: "عنوان التدريب الثاني",from: "مقدم من الجهة الفلانية",date: "2020-07-30",countryId: 100,duration: "3 "
            "days"),
        TrainingPrograms(name: "عنوان التدريب",from: "مقدم "
            "من الجهة الفلانية",date: "2020-07-30",countryId: 106,duration:"3days"),
      ],
      memberships: [Memberships(id: 1,other: "درجة غير معرفة"),Memberships(id: 2)],
      treatments: [Treatments(name: "علاج اربعة"),Treatments(name: "علاج "
          "ثلاثة")],
      medicalSpecialties: [MedicalSpecialties(id: 2,),MedicalSpecialties(id: 3)],
    ).toJson())}));
    DoctorProvider().getDoctorProfile(
      onSuccess: (data) {
        setState(() {
          doctor = data;
          print(
              "datadatadatadatadatadata ${data.registrationNo} datadatadatadatadata");
          wait = false;
        });
      },
      onError: (error) {
        print("on error called $error");
      },
    );
    DoctorRegProvider().postDoctorReg(
      onSuccess: (data) {
        print("*************$data");
      },
      onError: (error) {
        print("error $error");
      },
    );
    */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FutureBuilder<Doctor>(
          future: fetechDoctorProfileVar,
          builder: (BuildContext context, AsyncSnapshot<Doctor> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(height: MediaQuery.of(context).size.height),
                    Stack(
                      children: [
                        // ignore: prefer_is_empty
                        doctor.coverImage?.length != 0
                            ? Image.network(
                                "$imageUrl/${doctor.coverImage?[0].imageUrl}",
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                placeholderImageIMG,
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3.8,
                          width: MediaQuery.of(context).size.width,
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
                          // ignore: prefer_is_empty
                          child: doctor.profileImage?.length != 0
                              ? Image.network(
                                  "$imageUrl/${doctor.profileImage?[0].imageUrl}",
                                  fit: BoxFit.cover,
                                )
                              : doctor.patient?.patientImage == null
                                  ? Image.asset(
                                      defaultAvatarIMG,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "$imageUrl/${doctor.patient?.patientImage?.imageUrl}",
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),
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
                          SizedBox(height: 45),
                          textWidget(
                            stringText: (doctor.patient!.sex == "male"
                                    ? "الدكتور "
                                    : "الدكتورة ") +
                                "${doctor.patient!.firstName} ${doctor.patient!.secondName}",
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 70),
                          Row(
                            children: [
                              textWidget(
                                stringText: "رقم التسجيل في النقابة : ",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textWidget(
                                stringText: doctor.registrationNo ?? '',
                                fontSize: 17,
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              textWidget(
                                stringText: "الرقم المهني : ",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textWidget(
                                stringText: doctor.professionalId ?? '',
                                fontSize: 17,
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          textWidget(
                            stringText: "الأختصاصات العلاجية",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 6.0),
                          textWidget(
                            stringText: doctor.medicalSpecialties!
                                .map((v) =>
                                    v.id! != 1 ? v.name : v.extraInfo!.other)
                                .toList()
                                .join("\n"),
                            fontSize: 17,
                          ),
                          doctor.treatments!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 25),
                                    textWidget(
                                      stringText: "الخدمات العلاجية",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10),
                                    textWidget(
                                      stringText: doctor.treatments!
                                          .map((v) => v.name)
                                          .toList()
                                          .join("\n"),
                                      fontSize: 17,
                                    ),
                                  ],
                                )
                              : Container(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              textWidget(
                                stringText: "الشهادات",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 10),
                              textWidget(
                                stringText: doctor.doctorCertificates!
                                    .map(
                                      (v) =>
                                          (v.certificate!.id! == 1
                                              ? v.otherCertificate!
                                              : v.certificate!.name!) +
                                          " " +
                                          (v.university!.id!.toString() == '1'
                                              ? v.otherUniversity
                                              : v.university!.name!)! +
                                          " " +
                                          v.graduationYear.toString(),
                                    )
                                    .toList()
                                    .join("\n"),
                                fontSize: 17,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              textWidget(
                                stringText: "مواقع العمل",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          doctor.clinics!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        textWidget(
                                          stringText: doctor.clinics!
                                              .map((v) => v.name)
                                              .toList()
                                              .join("\n"),
                                          fontSize: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        textWidget(
                                            stringText: doctor.clinics!
                                                .map((v) => v.about)
                                                .toList()
                                                .join("\n"),
                                            fontSize: 17,
                                            color: Colors.red),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              textWidget(
                                stringText: "الخبرات",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 20),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          doctor.doctorDescription![0].experiences != null ||
                                  doctor.doctorDescription![1].experiences !=
                                      null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    textWidget(
                                      stringText: doctor.doctorDescription!
                                          .map((v) => v.experiences)
                                          .where((element) => element != null)
                                          .toList()
                                          .join("\n\n"),
                                      fontSize: 17,
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              textWidget(
                                stringText: "الدورات التدريبية",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 20),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          doctor.trainingPrograms!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    textWidget(
                                      stringText: doctor.trainingPrograms!
                                          .map((v) =>
                                              v.name! +
                                              " " +
                                              v.from! +
                                              " " +
                                              v.date!.substring(0, 4) +
                                              " " +
                                              v.country!.name!.toString())
                                          .toList()
                                          .join("\n"),
                                      fontSize: 17,
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              textWidget(
                                stringText: "العضويات",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 20),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          doctor.memberships!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    textWidget(
                                      stringText: doctor.memberships!
                                          .map((v) => v.id! == 1
                                              ? v.extraInfo!.other!
                                              : v.name!)
                                          .toList()
                                          .join("\n"),
                                      fontSize: 17,
                                    ),
                                  ],
                                )
                              : Container(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              textWidget(
                                stringText: "للتواصل",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              doctor.emails!.isNotEmpty
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        textWidget(
                                          stringText:
                                              "الايميل المهني:${doctor.setting!.showEmail == 1 ? doctor.emails![0].email : " مخفي"}",
                                          fontSize: 17,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              doctor.phones!.isNotEmpty
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        textWidget(
                                          stringText:
                                              "الهاتف المهني:${doctor.setting!.showPhone == 1 ? doctor.phones![0].phone : " مخفي"}",
                                          fontSize: 17,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(height: 10),
                              textWidget(
                                stringText: "أرسل رسالة على الحساب المهني",
                                fontSize: 17,
                                textDecoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              textWidget(
                                stringText: "الصور المهنية",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 20),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          doctor.otherImages!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      SizedBox(height: 10),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4 +
                                                40) *
                                            doctor.otherImages!.length,
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                doctor.otherImages!.length,
                                            itemBuilder: (BuildContext context,
                                                int index1) {
                                              return Column(
                                                children: [
                                                  Image.network(
                                                    "$imageUrl/${doctor.otherImages![index1].imageUrl!}",
                                                    fit: BoxFit.cover,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            20,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  textWidget(
                                                    stringText: doctor
                                                            .otherImages![
                                                                index1]
                                                            .imageDescriptions!
                                                            .isNotEmpty
                                                        ? doctor
                                                            .otherImages![
                                                                index1]
                                                            .imageDescriptions![
                                                                0]
                                                            .description
                                                        : '',
                                                    fontSize: 17,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                    ])
                              : Container(),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              textWidget(
                                stringText: "التوصيات",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 20),
                              textWidget(
                                stringText: "إخفاء",
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      placeholderImageIMG,
                                      fit: BoxFit.cover,
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.width / 6,
                                    ),
                                  ),
                                  textWidget(
                                    stringText: "الدكتور احمد حسن",
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.75,
                                child: textWidget(
                                    stringText:
                                        "الدكتور ${doctor.patient!.firstName ?? ''} من أفضل "
                                        "الأطباء"
                                        " في "
                                        "العراق"
                                        " في علاج الأمراض الصدرية"),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
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
