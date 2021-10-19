
import 'package:flutter/material.dart';
import './DrawerView.dart';
import './HomePage.dart';
import '../components/calendar.dart';
import '../components/notifications.dart';
import 'package:progress_dialog/progress_dialog.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Notifications(),
    Calendar(),
    DrawerView(),
  ];
  
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true, showLogs: true);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Color(0xFF393E41)),
        
        child:FloatingActionButton(
          backgroundColor: Color(0xFF65C88D),
        child: Icon(Icons.add),
        onPressed: (){
          pr.show();
        },
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Color(0xFF65C88D)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined,
                  color: Color(0xFF65C88D)),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.calendar_today_outlined, color: Color(0xFF65C88D)),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, color: Color(0xFF65C88D)),
              label: "Drawer"),
        ],
      ),
    );
  }
}