import 'package:flutter/material.dart';
import 'package:flutter_mobile/screen/_selectview.dart';
import '_drawerview.dart';
import '_homepage.dart';
import '../components/_calendar.dart';
import '../components/_allnotifications.dart';
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
    const HomePage(),
    const AllNotifications(),
     const Calendar(),
    const DrawerView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(splashColor: const Color(0xFF393E41)),
          child: FloatingActionButton(
              backgroundColor: const Color(0xFF65C88D),
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectView()),
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
         const BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home, color: Color(0xFF65C88D)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text("3",
                    style: GoogleFonts.tajawal(
                        textStyle: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w900,
                    ))),
                child: const Icon(FeatherIcons.bell, color: Color(0xFF65C88D)),
                badgeColor: const Color(0xFFF07167),
                elevation: 0,
                padding: const EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
              ),
             
              label: "Notifications"),
         const BottomNavigationBarItem(
              icon: Icon(FeatherIcons.calendar, color: Color(0xFF65C88D)),
              label: "Calendar"),
          const BottomNavigationBarItem(
              icon: Icon(FeatherIcons.menu, color: Color(0xFF65C88D)),
              label: "Drawer"),
        ],
      ),
    );
  }
}
