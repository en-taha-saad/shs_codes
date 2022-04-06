import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/modules/institution_profile/models/aainstitutions_profile_model.dart';
import 'package:shs108private/app/modules/private-clinics/views/private_clinics_view.dart';

class DayTime {
  String? day;
  String? startTime;
  String? endTime;

  DayTime({this.day, this.startTime, this.endTime});
}

bool? isCover = false;
bool? isProfile = false;
String? profileImage;
String? coverImage;
List<DayTime> days = [];
String? sa;
String? su;
String? mo;
String? tu;
String? we;
String? th;
String? fr;

Future<InstitutionsProfile>? getPublicInstituions() async {
  days = [];
  profileImage = '';
  coverImage = '';
  isCover = false;
  isProfile = false;
  var headers = {'Accept': 'application/json'};

  var request =
      http.Request('GET', Uri.parse('$url/institution/$publicInstitutionId'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print('response.statusCode = ${response.statusCode}');
    print('response.reasonPhrase = ${response.reasonPhrase}');
    var data = jsonDecode(await response.stream.bytesToString());
    // print('Data = $data');
    InstitutionsProfile? dataMap = InstitutionsProfile.fromJson(data);
    publiclatitudeVar = dataMap.address?.location?.latitude;
    publiclongitudeVar = dataMap.address?.location?.longitude;
    dataMap.availableSchedules?.forEach((e) {
      if (e.recurringWeekDay == 'SA') {
        sa = 'السبت';
        days.add(
          DayTime(
            day: sa,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'SU') {
        su = 'الأحد';
        days.add(
          DayTime(
            day: su,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'MO') {
        mo = 'الأثنين';
        days.add(
          DayTime(
            day: mo,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'TU') {
        tu = 'الثلاثاء';
        days.add(
          DayTime(
            day: tu,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'WE') {
        we = 'الأربعاء';
        days.add(
          DayTime(
            day: we,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'TH') {
        th = 'الخميس';
        days.add(
          DayTime(
            day: th,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
      if (e.recurringWeekDay == 'FR') {
        fr = 'الجمعة';
        days.add(
          DayTime(
            day: fr,
            startTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.startDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
            endTime: '${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[0]} ${DateFormat.jm().format(
                  DateFormat("hh:mm").parse((e.endDate?.split(' ')[1])!),
                ).split(' ')[1] == 'AM' ? 'صباحا' : 'مساءا'}',
          ),
        );
      }
    });

    dataMap.profileImage?.forEach((e) {
      if (e.isProfile == 1) {
        isProfile = true;
        profileImage = e.imageUrl;
      }
      if (e.isCover == 1) {
        isCover = true;
        // coverImage = e.imageUrl;
      }

      print('isCover = ${e.isCover}');
      print('isCover = ${e.isProfile}');
    });
    return dataMap;
  } else {
    print('response.statusCode = ${response.statusCode}');
    print('response.reasonPhrase = ${response.reasonPhrase}');
    var data = jsonDecode(await response.stream.bytesToString());
    print('data = $data');
    return data;
  }
}
