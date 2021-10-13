import 'package:flutter/material.dart';
import './maintenanceView.dart';
import 'headerDrawer.dart';
import 'operationsView.dart';
import 'dataView.dart';
import 'maintenanceView.dart';
import 'settingsView.dart';



class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(children: <Widget>[
          HeaderDrawer(),
          Container(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: "العمليات",
                    icon:  Icons.show_chart,
                    onClicked: () => selectedItem(context, 0),
                    
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'البيانات',
                    icon: Icons.insert_chart_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'الصيانة',
                    icon: Icons.tune,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'الإعدادات',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'خروج',
                    icon:Icons.logout,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  

  }

  

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black12;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 20)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => operationsView(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DataView(),
        ));
        break;
        case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MaintenanceView(),
        ));
        break;
        case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsView(),
        ));
        break;
    }
  }
}
