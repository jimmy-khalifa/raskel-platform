import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 0,
              child: Column(children: [
                ListTile(
                  leading: const Icon(
                    FeatherIcons.truck,
                    color: Color(0xFF65C88D),
                  ),
                  title: Text(
                    "Prochain Collecte",
                    style: GoogleFonts.tajawal(
                        textStyle: const TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    )),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: const Color(0xFFdff4ec),
                  indent: MediaQuery.of(context).size.width * 4 / 100,
                  endIndent: MediaQuery.of(context).size.width * 4 / 100,
                ),
                Column(
                  children: const [
                    ListTile(
                      title: Text("Samedi 10 Janvier 2022 "),
                      leading: Icon(
                        FeatherIcons.calendar,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        FeatherIcons.user,
                      ),
                      title: Text("Foulen El Foulani"),
                    ),
                    ListTile(
                      title: Text("Déchets en plastiques"),
                    ),
                    ListTile(
                      leading: Icon(
                        FeatherIcons.dollarSign,
                      ),
                      title: Text("1 Sac Volume 30 ml"),
                    ),
                  ],
                )
              ]),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      FeatherIcons.calendar,
                      color: Color(0xFF65C88D),
                    ),
                    title: Text(
                      "Calendrier",
                      style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                        color: Color(0xFF65C88D),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      )),
                    ),
                  ),
                  TableCalendar(
                    locale: 'fr_FR',
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekVisible: true,
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                    },
                   
                    calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                            color: const Color(0xFF65C88D),
                            borderRadius: BorderRadius.circular(5.0)),
                        selectedTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        defaultDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        weekendDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        todayDecoration: BoxDecoration(
                            color: const Color(0xFFdff4ec),
                            borderRadius: BorderRadius.circular(5.0))),
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },
                    headerStyle: HeaderStyle(
                        formatButtonVisible: true,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                            color: const Color(0xFFdff4ec),
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                 
                ],
              ),
            ),
          ])),
      
    );
  }
}
