import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
                leading: Icon(
                  FeatherIcons.bell,
                  color: Color(0xFF65C88D),
                ),
                title: Text('all Notifications',style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF65C88D),fontWeight:FontWeight.w900,))
                  )),
            Column(
              children: [
                Card(
                  color: Color(0xFFF7FFFB),
                  child: ListTile(
                    leading:  CircleAvatar(
                      backgroundColor: Color(0xFFDFF4EC),
                      radius: 20,
                      child: Icon(
                        FeatherIcons.truck,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Collecte",style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF393E41),fontWeight:FontWeight.w700, ))),
                    subtitle: Text("Demande de collecte accepté et traité"),
                  ),
                ),
                Card(
                  color: Color(0xFFF7FFFB),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFDFF4EC),
                      radius: 20,
                      child: Icon(
                        FeatherIcons.gift,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Récompense",style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF393E41),fontWeight:FontWeight.w700, ))),
                    subtitle:
                        Text("Vous avez reçu une récompense de 200 points"),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
