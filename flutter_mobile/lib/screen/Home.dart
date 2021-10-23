import 'package:flutter/material.dart';
import 'package:flutter_mobile/screen/SelectView.dart';
import './DrawerView.dart';
import './HomePage.dart';
import '../components/calendar.dart';
import '../components/allNotifications.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    AllNotifications(),
    Calendar(),
    DrawerView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(splashColor: Color(0xFF393E41)),
          child: FloatingActionButton(
              backgroundColor: Color(0xFF65C88D),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectView()),
                );
              })),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home, color: Color(0xFF65C88D)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text("3",
                    style: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w900,
                    ))),
                child: Icon(FeatherIcons.bell, color: Color(0xFF65C88D)),
                badgeColor: Color(0xFFF07167),
                elevation: 0,
                padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
              ),
              /*Stack(children: [
                Icon(FeatherIcons.bell, color: Color(0xFF65C88D)),
                Positioned(
                    top: -1.0,
                    right: -1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ]),*/
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.calendar, color: Color(0xFF65C88D)),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.menu, color: Color(0xFF65C88D)),
              label: "Drawer"),
        ],
      ),
    );
  }
}
