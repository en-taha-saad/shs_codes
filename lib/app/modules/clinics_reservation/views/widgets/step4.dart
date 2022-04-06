// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/clinics_reservation/controllers/clinics_reservation_controller.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month, kToday.day+90);

class Step4 extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<Step4> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  // List<int> dayss =[DateTime.sunday];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GetBuilder(
          builder: (ClinicsReservationController c) {
          return Column(
            children: [
              textWidget(
                stringText: "ملاحظة ( حجز الموعد للعيادة يفتح "
                    "${c.notesDuration})",
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              TableCalendar(
                  locale: 'ar',
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: generalColor,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: const Color(0x6D9FA8DA),
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                  ),
                  daysOfWeekHeight: 30,
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  focusedDay: c.focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(c.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) =>c.onDaySelected(selectedDay, focusedDay),
                  onPageChanged: (focusedDay) {
                    c.focusedDay = focusedDay;
                  },
                enabledDayPredicate: (day) {
                  if(c.selectedStaffDays.isNotEmpty&&c.selectedStaff!=null){
                  return (c.selectedStaffDays[c.selectedStaff.toString()]!
                      .contains(day.weekday - 1)) ;
                }
                return true;
                },
              ),
            ],
          );
        }
      ),
    );
  }
}