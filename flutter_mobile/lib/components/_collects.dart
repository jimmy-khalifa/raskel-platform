import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_mobile/components/_collectsdetail.dart';
import 'package:google_fonts/google_fonts.dart';

class Collects extends StatelessWidget {
  const Collects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 0,
        child: Column(
          children: [
            ListTile(
              leading:const Icon(
                FeatherIcons.truck,
                color: Color(0xFF65C88D),
              ),
              title: Text(
                'Collectes',
                style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF65C88D),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color:const Color(0xFFdff4ec),
              indent: MediaQuery.of(context).size.width * 4 / 100,
              endIndent: MediaQuery.of(context).size.width * 4 / 100,
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CollectDetail()),
                );},
                    child: Card(
                      margin:const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        side:const BorderSide(color: Color(0xFF79D1B4)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 0,
                      child: ListTile(
                        leading:const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.truck,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Samedi jan 10.2022",
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle:const Text("Collecte des déchets en Plastique."),
                      ),
                    )),
                InkWell(
                    onTap: () {},
                    child: Card(
                      margin:const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          side:const BorderSide(color: Color(0xFF79D1B4)),
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 0,
                      child: ListTile(
                        leading:const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.gift,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Jeudi jan 29.2022",
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle:const Text("Collecte des déchets en verre."),
                      ),
                    ))
              ],
            )
          ],
        ));
  }
}
