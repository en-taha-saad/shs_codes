import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/stepper.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/profile/providers/user_provider.dart';
import 'package:shs108private/app/modules/profile/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../reservation_per_date_model.dart';
import '../reserve_model.dart';

class ClinicsReservationController extends GetxController {
  GlobalKey<FormBuilderState> formKeyReservation =
      GlobalKey<FormBuilderState>();

  //#region stepper

  List<FAStepstate> stepsState = [
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
    FAStepstate.editing,
  ];

  alertBar(alert, {Color color = Colors.black38}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      titleText: Center(
        child: textWidget(
          textAlign: TextAlign.center,
          stringText: alert,
          color: Colors.white,
          fontSize: 15,
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
  }

  @override
  onInit() {
    loadInstitutionInfo();
    super.onInit();
  }

  @override
  void onClose() {}

  var backgroundColor = MaterialStateProperty.all(Colors.blue);
  var backgroundColor2 = MaterialStateProperty.all(Colors.grey);

  var registerButtonColor = Colors.grey;

  int currentstep = 0;

  ScrollController scrollController = ScrollController();

  onStepTapped(index) {
    currentstep = index;
    update();
  }

  onStepback() {
    if (currentstep == 0) {
      backgroundColor2 = MaterialStateProperty.all(Colors.grey);
    } else {
      backgroundColor = MaterialStateProperty.all(Colors.blue);
      currentstep--;
      update();
    }
  }

  // onStepContinue() {
  //   if(currentstep<4) {
  //     backgroundColor2 = MaterialStateProperty.all(Colors.blue);
  //     currentstep++;
  //   }
  //   else{
  //     backgroundColor2 = MaterialStateProperty.all(Colors.grey);
  //   }
  //   update();
  // }
  onStepContinue() {
    switch (currentstep) {
      case 0:
        if (step1Validate()) {
          stepsState[0] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[0] = FAStepstate.editing;
        }
        break;
      case 1:
        if (step2Validate()) {
          stepsState[1] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[1] = FAStepstate.editing;
        }
        break;
      case 2:
        if (step3Validate()) {
          stepsState[2] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[2] = FAStepstate.editing;
        }
        break;
      case 3:
        if (step4Validate()) {
          stepsState[3] = FAStepstate.complete;
          currentstep++;
        } else {
          stepsState[3] = FAStepstate.editing;
        }
        break;
      case 4:
        if (step5Validate()) {
          stepsState[4] = FAStepstate.complete;
        } else {
          stepsState[4] = FAStepstate.editing;
        }
        break;
    }
    update();
  }

  bool step1Validate() {
    if (selectedRelated == null && character == 1) {
      formKeyReservation.currentState?.saveAndValidate();
      alertBar("يرجى تحديد فرد العائلة");
      return false;
    }
    return true;
  }

  bool step2Validate() {
    if (selectedStaff == null) {
      alertBar("يرجى تحديد الطبيب");
      return false;
    }
    return true;
  }

  bool step3Validate() {
    if (selectedService == null) {
      alertBar("يرجى تحديد الخدمة");
      return false;
    }
    return true;
  }

  bool step4Validate() {
    if (selectedDay == null) {
      alertBar("يرجى تحديد يوم الحجز");
      return false;
    }
    return true;
  }

  bool step5Validate() {
    if (selectedDate == null) {
      alertBar("يرجى تحديد وقت الحجز");
      return false;
    }
    pinReverse();
    return true;
  }

  //#endregion

  //#region step1

  int character = 0;

  List<ChildProfileRelateds>? relateds;
  List<GetDataModel> relatedList = [];
  GetDataModel? selectedRelated;
  Future getChilds() async {
    relateds = (await fetchChildProfile())!;
    update();
  }

  var reservationRadioList = ["حجز شخصي", "حجز لافراد العائلة"];

  onChangedReservationRadio(String? val) {
    if (relatedList.isEmpty) {
      print("************$relateds");
      getChilds().then((value) {
        relateds!.forEach((e) => relatedList.add(GetDataModel(
            name: "${e.firstName} ${e.secondName} ${e.surName}", id: e.id)));
      });
      print("***22*******$relatedList");
    } else {
      print("***22*******$relatedList");
    }
    character = reservationRadioList.indexOf(val!);
    print(character);
    update();
  }

  onChangedSelectedRelated(related) {
    selectedRelated = related;
    // print("selectedRegion ${selectedRelated!.name}");
    update();
  }

  //#endregion

  //#region Step2

  int? selectedStaff;
  List<String> staffList = [];
  List<int> staffIdList = [];
  List<String> staffImageList = [];

  selectStaff(selection) {
    selectedStaff = staffIdList[staffList.indexOf(selection)];
    // oneStaffService = selectedStaffServices[selectedStaff.toString()]!;
    fillServices();
    // fillDates();
    print("selectedStaff************${selectedStaff}");
    update();
  }

  //#endregion

  //#region Step3

  int? selectedService;
  List<String> oneStaffServiceNames = [];
  List<int> oneStaffServicePrices = [];
  Map<String, List<ServiceFees>> selectedStaffServices = {};
  fillServices() {
    print("09090909090$selectedStaffServices");
    oneStaffServiceNames = selectedStaffServices[selectedStaff.toString()]!
        .map((e) => (e.other != null ? e.other! : e.service!.name) ?? '')
        .toList();
    oneStaffServicePrices = selectedStaffServices[selectedStaff.toString()]!
        .map((e) => e.price ?? 0)
        .toList();
    update();
  }

  //#endregion

  //#region Step4

  String notesDuration = '';
  DateTime? selectedDay;
  int? selectedDayIndex;
  DateTime focusedDay = DateTime.now();

  onDaySelected(selectedDay2, focusedDay2) {
    if (!isSameDay(selectedDay, selectedDay2)) {
      selectedDay = selectedDay2;
      focusedDay = focusedDay2;
      selectedDayIndex = selectedDay2.weekday - 1;
      // fillDates();
      print("selectedDayIndex$selectedDayIndex");
      print("selectedDay$selectedDay");
    }
    fillSelectedDates();
    removeDatesReserved();
    update();
  }

  List<String> daysCons = [
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
    "SA",
    "SU",
  ];

  Map<String, List<AvailableSchedules>> selectedStaffSchedules = {};
  Map<String, List<int>> selectedStaffDays = {};

  //#endregion

  //#region Step5

  Map<String, int> selectedStaffSlot = {};
  List<String> availableDates = [];
  Map<String, List<Map<int, String>>> selectedStaffDates = {};

  String formatDate(String date) {
    TimeOfDay? dateInput = TimeOfDay(
        hour: int.parse(date.split(":")[0]),
        minute: int.parse(date.split(":")[1]));
    String dateOut = '';
    if (dateInput.hour == 12) {
      dateOut =
          "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour} "
          "مساءاً ";
    } else if (dateInput.hour == 00) {
      dateOut =
          "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${12} "
          "صباحاً ";
    } else {
      if (dateInput.hour > 12) {
        dateOut =
            "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour - 12} "
            "مساءاً ";
      } else {
        dateOut =
            "${dateInput.minute < 10 ? "0" : ""}${dateInput.minute} : ${dateInput.hour} "
            "صباحاً ";
      }
    }
    return dateOut;
  }

  // fillDates(){
  //   final startTime = TimeOfDay(hour: 9, minute: 0);
  //   final endTime = TimeOfDay(hour: 22, minute: 0);
  //   final step = Duration(minutes: 30);
  //
  //   final times = getTimes(startTime, endTime, step)
  //       .map((tod) => tod.format( context))
  //       .toList();
  //
  //   print(times);
  // }
  Iterable<String> getTimes(
      TimeOfDay startTime, TimeOfDay endTime, int step) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;

    do {
      // yield TimeOfDay(hour: hour, minute: minute).toString();
      yield "$hour:${minute < 10 ? '0' : ''}$minute:00";
      // yield formatDate(TimeOfDay(hour: hour, minute: minute));
      minute += step;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }

  onChangedSelectedDate(date) {
    selectedDate = date;
    print("selectedDate ${selectedDate!.name}");
    update();
  }

  List<GetDataModel> listOfDates = [];
  GetDataModel? selectedDate;

  onChangedSelectedDates(date) {
    selectedDate = date;
    update();
  }

  fillSelectedDates() {
    selectedDate = null;
    TimeOfDay startTime = TimeOfDay(
        hour: int.parse(institutions!.staffsInfo!
            .where((element) => element.staffId == selectedStaff)
            .first
            .availableSchedules!
            .where((element2) =>
                element2.recurringWeekDay == daysCons[selectedDay!.weekday - 1])
            .first
            .startDate!
            .substring(11, 13)),
        minute: int.parse(institutions!.staffsInfo!
            .where((element) => element.staffId == selectedStaff)
            .first
            .availableSchedules!
            .where((element2) =>
                element2.recurringWeekDay == daysCons[selectedDay!.weekday - 1])
            .first
            .startDate!
            .substring(14, 16)));

    TimeOfDay endTime = TimeOfDay(
        hour: int.parse(institutions!.staffsInfo!
            .where((element) => element.staffId == selectedStaff)
            .first
            .availableSchedules!
            .where((element2) =>
                element2.recurringWeekDay == daysCons[selectedDay!.weekday - 1])
            .first
            .endDate!
            .substring(11, 13)),
        minute: int.parse(institutions!.staffsInfo!
            .where((element) => element.staffId == selectedStaff)
            .first
            .availableSchedules!
            .where((element2) =>
                element2.recurringWeekDay == daysCons[selectedDay!.weekday - 1])
            .first
            .endDate!
            .substring(14, 16)));
    listOfDates = [];
    availableDates = getTimes(
            startTime, endTime, selectedStaffSlot[selectedStaff.toString()]!)
        .toList();
    print(availableDates);
    // availableDates.forEach((element) { listOfDates.add(GetDataModel(name:
    // formatDate(element.substring(0,5)) , id: availableDates.indexOf(element)+1));});
    update();
  }

  List<ReservationPerDate> reservationPerDate = [];

  removeDatesReserved() {
    fetchReserved().then((value) {
      print('heeeeeellllllooooooo$reservationPerDate');
      reservationPerDate.forEach((e) {
        print('heeeeeellllllooooooo2222222${e.reservationTime}');
        availableDates.remove(e.reservationTime);
      });
      availableDates.forEach((element) {
        listOfDates.add(GetDataModel(
            name: formatDate(element.substring(0, 5)),
            id: availableDates.indexOf(element) + 1));
      });
      update();
    });
  }

  Future fetchReserved() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$url/reservations_per_date?institution_id=1&staff_id=$selectedStaff'
            '&reservation_date=${selectedDay.toString().substring(0, 10)}'));
// ('$url/reservations_per_date?institution_id=1&staff_id=$selectedStaff'
//         '&reservation_date'
//         '=${selectedDay.toString().substring(0,10)}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());
      print(data);
      reservationPerDate = ReservationPerDate.fromJsonList(data);
      print(reservationPerDate.map((e) => e.reservationTime));
      // reservationPerDate.add();
      update();
      // print("hjhsjhdsjhdjs${await response.stream.bytesToString()}");
    } else {
      print(response.reasonPhrase);
    }
  }

  //#endregion

  //#region requests

  fillData() {
    staffIdList = institutions!.staffsInfo!.map((e) => e.staffId!).toList();
    staffList = institutions!.staffsInfo!
        .map((e) => "${e.staffInfo!.firstName} "
            "${e.staffInfo!.secondName} ${e.staffInfo!.sureName}")
        .toList();
    staffImageList = institutions!.staffsInfo!
        .map((e) =>
            e.staffInfo!.image != null ? e.staffInfo!.image!.imageUrl! : '')
        .toList();
    institutions!.staffsInfo!.forEach((e) {
      selectedStaffServices.addAll({e.staffId.toString(): e.serviceFees!});
      selectedStaffSchedules
          .addAll({e.staffId.toString(): e.availableSchedules!});
      selectedStaffSlot.addAll({
        e.staffId.toString(): int.parse(
            e.availableSchedules!.first.slotTime == "01:00:00"
                ? '60'
                : e.availableSchedules!.first.slotTime!.substring(3, 5))
      });
    });
    print(selectedStaffSchedules.length);
    selectedStaffSchedules.forEach((key, value) {
      selectedStaffDays.addAll({
        key: value.map((e) => daysCons.indexOf(e.recurringWeekDay!)).toList()
      });
      selectedStaffDates.addAll({
        key: value
            .map((e) => {daysCons.indexOf(e.recurringWeekDay!): e.startDate!})
            .toList()
      });
    });
    notesDuration =
        institutions!.reservationSetting!.reserveOnlineDuration!.name;
    update();
  }

  /// var institutionData;
  // bringInfo() async {
  //   var request = http.Request('GET', Uri.parse('https://shs-iq.com/api/api/institution/39'));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     var data= await response.stream.bytesToString();
  //     institutionData = jsonDecode(data);
  //     print("data = $data");
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }
  //

  Reserve? institutions;
  //
  // Future loadInstitutionInfo() async {
  //   var request = http.Request('GET', Uri.parse('$url/institution/39'));
  //
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(await response.stream.bytesToString());
  //     institutions= Institutions.fromJson(data);
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }

  Future<Reserve>? loadInstitutionInfo() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('$url/institution_doctors?institution_id=1'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('response.statusCode = ${response.statusCode}');
      print('response.reasonPhrase = ${response.reasonPhrase}');
      var data = jsonDecode(await response.stream.bytesToString());
      Reserve? dataMap = Reserve.fromJson(data);
      institutions = dataMap;
      update();
      fillData();
      return dataMap;
    } else {
      print('response.statusCode = ${response.statusCode}');
      print('response.reasonPhrase = ${response.reasonPhrase}');
      var data = jsonDecode(await response.stream.bytesToString());
      print('data = $data');
      update();
      return data;
    }
  }

  pinReverse() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $savedToken'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('$url/add_reservation'));
    print("selectedDate!.nameselectedDate!.nameselectedDate!"
        ".nameselectedDate!.nameselectedDate!.nameselectedDate!"
        ".name${availableDates[selectedDate!.id! - 1]}");
    request.fields.addAll({
      'personal': character == 0 ? '1' : '0',
      'service_id':
          selectedStaffServices[selectedStaff.toString()]!.first.id.toString(),
      'staff_id': '$selectedStaff',
      'institution_id': '1',
      'reservation_date': selectedDay.toString().substring(0, 10),
      'reservation_time': availableDates[selectedDate!.id! - 1]
    });

    if (character == 1) {
      request.fields.addAll({
        'reserved_to': selectedRelated!.name,
      });
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      alertBar("تم تثبيت الحجز بإنتظار الموافقة",
          color: Colors.green.withOpacity(0.5));
      Future.delayed(
          Duration(seconds: 2), () => Get.offAllNamed(Routes.DOCTOR_DASHBOARD));
    } else {
      print(response.reasonPhrase);
    }
  }
  //#endregion
}
