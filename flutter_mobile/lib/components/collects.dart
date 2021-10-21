import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class Collects extends StatelessWidget {
  const Collects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                FeatherIcons.truck,
                color: Color(0xFF65C88D),
              ),
              title:  Text(
                'Collectes',style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF65C88D),fontWeight:FontWeight.w900, )),
              ),
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF79D1B4)),
                        borderRadius: BorderRadius.circular(8.0)),
                      

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.truck,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Samedi jan 10.2022",style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF393E41),fontWeight:FontWeight.w700, ))),
                        subtitle: Text("Collecte des déchets en Plastique."),
                      ),
                    )),
                InkWell(
                    onTap: () {},
                    child: Card(
                          shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF79D1B4)),
                        borderRadius: BorderRadius.circular(8.0)),
                      
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.gift,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Jeudi jan 29.2022",style:GoogleFonts.tajawal(textStyle: TextStyle(color: Color(0xFF393E41),fontWeight:FontWeight.w700, ))),
                        subtitle: Text("Collecte des déchets en verre."),
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
