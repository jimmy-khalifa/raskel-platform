import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 0,
        margin:const EdgeInsets.all(5),
        child: Column(
          children: [
            ListTile(
                leading:const Icon(
                  FeatherIcons.bell,
                  color: Color(0xFF65C88D),
                ),
                title: Text('Notifications',
                    style: GoogleFonts.tajawal(
                        textStyle:const TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    )))),
            Divider(
              height: 1,
              thickness: 1,
              color:const Color(0xFFdff4ec),
              indent: MediaQuery.of(context).size.width * 4 / 100,
              endIndent: MediaQuery.of(context).size.width * 4 / 100,
            ),
            Column(
              children: [
                Card(
                  margin:const EdgeInsets.all(10),
                  color:const Color(0xFFF7FFFB),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading:const CircleAvatar(
                      backgroundColor: Color(0xFFDFF4EC),
                      radius: 20,
                      child: Icon(
                        FeatherIcons.truck,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Collecte",
                        style: GoogleFonts.tajawal(
                            textStyle:const TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    subtitle:const Text("Demande de collecte accepté et traité"),
                  ),
                ),
                Card(
                  color:const Color(0xFFF7FFFB),
                  margin:const EdgeInsets.all(10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    leading:const CircleAvatar(
                      backgroundColor: Color(0xFFDFF4EC),
                      radius: 20,
                      child: Icon(
                        FeatherIcons.gift,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Récompense",
                        style: GoogleFonts.tajawal(
                            textStyle:const TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    subtitle:
                    const
                        Text("Vous avez reçu une récompense de 200 points"),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
