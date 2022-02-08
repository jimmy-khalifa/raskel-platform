import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            ListTile(
                leading: const Icon(
                  FeatherIcons.share2,
                  color: Color(0xFF65C88D),
                ),
                title: Text('Sociale',
                    style: GoogleFonts.tajawal(
                        textStyle: const TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    )))),
            Divider(
              height: 1,
              thickness: 1,
              color: const Color(0xFFdff4ec),
              indent: MediaQuery.of(context).size.width * 4 / 100,
              endIndent: MediaQuery.of(context).size.width * 4 / 100,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    side:const BorderSide(color: Color(0xFF79D1B4)),
                    borderRadius: BorderRadius.circular(15.0)),
                margin:const EdgeInsets.all(10),
                elevation: 0,
                child: Column(children: [
                  ListTile(
                    dense: false,
                    contentPadding:const EdgeInsets.all(15),
                    title: Text("Fete de l'Arbre",
                        style: GoogleFonts.tajawal(
                            textStyle:const TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    subtitle:const Text(
                        "A l'occasion de fete de l'arbre l'association GreenEarth a organisé une manifestation pour planter 100 arbres."),
                    trailing:const  Image(
                        image: AssetImage('assets/images/planting.png'),
                        //fit: BoxFit.fill,
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
                          icon:const Icon(FeatherIcons.heart,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.star,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.thumbsUp,
                              color: Color(0xFF65C88D))),
                      OutlinedButton(
                       
                          style: OutlinedButton.styleFrom(
                           side: const BorderSide(color: Color(0xFF65C88D)),
                                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

                           
                         ),    

                          onPressed: () {},
                          child: Row(
                            children:  [
                              const Text(
                                " @flen",
                                style: TextStyle(color: Color(0xFF79D1B4)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width/25),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    height: 30,
                                    width: 26,
                                  ))
                            ],
                          ),
                         // borderSide:const BorderSide(color: Color(0xFF65C88D))),
                      )],
                  ),
                ])),
            Card(
              shape: RoundedRectangleBorder(
                  side:const BorderSide(color: Color(0xFF79D1B4)),
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 0,
              margin:const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding:const EdgeInsets.all(15),
                    title: Text("Contre les sachets",
                        style: GoogleFonts.tajawal(
                            textStyle:const TextStyle(
                          color: Color(0xFF393E41),
                          fontWeight: FontWeight.w700,
                        ))),
                    isThreeLine: true,
                    subtitle:const Text(
                        "Le problème posé aujourd'hui par les sachets en plastique peut etre résolue avec la condcience collective."),
                    trailing:const Image(
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
                          icon: const Icon(FeatherIcons.heart,
                              color: Color(0xFF65C88D))),
                      IconButton(
                          onPressed: () {},
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon:const Icon(
                            FeatherIcons.star,
                            color: Color(0xFF65C88D),
                          )),
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.thumbsUp,
                              color: Color(0xFF65C88D))),
                      OutlinedButton(
                         // padding:
                           // const  EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                         // focusColor:const Color(0xFF65C88D),
                         style: OutlinedButton.styleFrom(
                           side: const BorderSide(color: Color(0xFF65C88D)),
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

                         ),
                          onPressed: () {},
                          child: Row(
                            children:  [
                              const Text(
                                " @flen",
                                style: TextStyle(color: Color(0xFF79D1B4)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/25),
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    height: 30,
                                    width: 26,
                                  ))
                            ],
                          ),
                         
                      )],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
