import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '_maintenanceview.dart';
import '_headerdrawer.dart';
import '_operationsview.dart';
import '_dataview.dart';
import '_settingsview.dart';



class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(children: <Widget>[
         const HeaderDrawer(),
         const Padding(padding: EdgeInsets.only(top:40),),
          Column(
                children: [
                  
                  buildMenuItem(
                    text: "Opération",
                    icon:  FeatherIcons.activity, 
                    onClicked: () => selectedItem(context, 0),
                    
                  ),
                  buildMenuItem(
                    text: 'Profile',
                    icon: FeatherIcons.barChart2,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  buildMenuItem(
                    text: 'Maintenance',
                    icon: FeatherIcons.sliders,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  buildMenuItem(
                    text: 'Paramètre',
                    icon: FeatherIcons.settings,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const Divider(color: Color(0xFFDFF4EC)),
                  buildMenuItem(
                    
                    text: 'Déconnexion',
                    icon:FeatherIcons.logOut,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  
                ],
              ),
            
          ],
        ),
      
    );
  

  }

  

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color(0xFF65C88D);
    final hoverColor = Colors.black12;

    return ListTile( 
      leading: Icon(icon, color: color,),
      title: Text(text, style: GoogleFonts.tajawal(textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const OperationsView(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DataView(),
        ));
        break;
        case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>const MaintenanceView(),
        ));
        break;
        case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SettingsView(),
        ));
        break;
    }
  }
}
