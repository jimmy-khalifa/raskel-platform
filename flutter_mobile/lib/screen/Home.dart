import 'package:flutter/material.dart';
import './settingsView.dart';
import './dataView.dart';
import './maintenanceView.dart';
import 'operationsView.dart';
import './headerDrawer.dart';
import './MainView.dart';
import 'SelectView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    var currentPage = DrawerSections.MainView;
  @override
  Widget build(BuildContext context) {
    var container;

  if (currentPage == DrawerSections.operationsView) {
      container = operationsView();
    } else if (currentPage == DrawerSections.DataView) {
      container = DataView();
    } else if (currentPage == DrawerSections.MaintenanceView) {
      container = MaintenanceView();
    } else if (currentPage == DrawerSections.SettingsView) {
      container = SettingsView();
    } else if (currentPage == DrawerSections.MainView){
      container= MainView();
    } else if (currentPage == DrawerSections.SelectView){
      container = SelectView();
    }    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: container,
      endDrawer: Drawer(
          child: SingleChildScrollView(
              child: Container(
                  child: Column(
        children: [
          HeaderDrawer(),
          DrawerList(),
        ],
      )))),
    );
  }

  Widget DrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "العمليات", Icons.show_chart,
              currentPage == DrawerSections.operationsView ? true : false),
               menuItem(2, "البيانات", Icons.insert_chart_outlined,
              currentPage == DrawerSections.DataView ? true : false),
          menuItem(3, "الصيانة", Icons.tune,
              currentPage == DrawerSections.MaintenanceView ? true : false),
          menuItem(4, "الإعدادات",Icons.settings,
              currentPage == DrawerSections.SettingsView ? true : false),
          Divider(),
          menuItem(5, "خروج", Icons.logout,
              currentPage == DrawerSections.LogoutView ? true : false),
         
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
        color: selected ? Colors.grey[300] : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.operationsView;
              } else if (id == 2) {
                currentPage = DrawerSections.DataView;
              } else if (id == 3) {
                currentPage = DrawerSections.MaintenanceView;
              } else if (id == 4) {
                currentPage = DrawerSections.SettingsView;
              } else if (id == 5) {
                currentPage = DrawerSections.LogoutView;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                 Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
enum DrawerSections {
  MainView,
  operationsView,
  DataView,
  MaintenanceView,
  SettingsView,
  LogoutView,
  SelectView,
}
