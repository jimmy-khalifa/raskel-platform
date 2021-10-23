import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            ListTile(
                leading: Icon(
                  FeatherIcons.share2,
                  color: Color(0xFF65C88D),
                ),
                title: Text('Sociale',
                    style: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    )))),
            Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFdff4ec),
              indent: MediaQuery.of(context).size.width * 4 / 100,
              endIndent: MediaQuery.of(context).size.width * 4 / 100,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF79D1B4)),
                    borderRadius: BorderRadius.circular(15.0)),
                margin: EdgeInsets.all(10),
                elevation: 0,
                child: Column(children: [
                  ListTile(
                    dense: false,
                    contentPadding: EdgeInsets.all(15),
                    title: Text("Fete de l'Arbre",
                        style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    subtitle: Text(
                        "A l'occasion de fete de l'arbre l'association GreenEarth a organisé une manifestation pour planter 100 arbres."),
                    trailing: Container(
                      child: Image(
                        image: AssetImage('assets/images/planting.png'),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(FeatherIcons.heart,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(FeatherIcons.star,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(FeatherIcons.thumbsUp,
                              color: Color(0xFF65C88D))),
                      OutlineButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          focusColor: Color(0xFF65C88D),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                " @flen",
                                style: TextStyle(color: Color(0xFF79D1B4)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    height: 30,
                                    width: 26,
                                  ))
                            ],
                          ),
                          borderSide: BorderSide(color: Color(0xFF65C88D))),
                    ],
                  ),
                ])),
            Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF79D1B4)),
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 0,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text("Contre les sachets",
                        style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    isThreeLine: true,
                    subtitle: Text(
                        "Le problème posé aujourd'hui par les sachets en plastique peut etre résolue avec la condcience collective."),
                    trailing: Image(
                      image: AssetImage('assets/images/select.png'),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(FeatherIcons.heart,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          onPressed: () {},
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            FeatherIcons.star,
                            color: Color(0xFF65C88D),
                          )),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(FeatherIcons.thumbsUp,
                              color: Color(0xFF65C88D))),
                      OutlineButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          focusColor: Color(0xFF65C88D),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                " @flen",
                                style: TextStyle(color: Color(0xFF79D1B4)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    height: 30,
                                    width: 26,
                                  ))
                            ],
                          ),
                          borderSide: BorderSide(color: Color(0xFF65C88D))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
