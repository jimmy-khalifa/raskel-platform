import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_mobile/screen/_mapview.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectDetail extends StatefulWidget {
  const CollectDetail({Key? key}) : super(key: key);

  @override
  _CollectDetailState createState() => _CollectDetailState();
}

class _CollectDetailState extends State<CollectDetail> {
  int currentIndex = 0;
  List collectList = [
    {
      "name": 'ElFouleni Foulen',
      "image": "assets/images/pngwing.png",
      "icon": "assets/images/secondprofile.png",
      "municipality": "Municipalité Rdayef",
      "code": "XNG44567",
      "title": "DECHETS EN PLASTIQUES",
      "date": "10/01/2022",
      "sacName": "1 Sac En Plastique 30L",
      "demand": "Demande N 25213",
      "dateDemand": "Le 01/02/2022"
    },
    {
      "name": 'Foulen Fouleni',
      'image': 'assets/images/verre.png',
      "icon": "assets/images/secondprofile.png",
      "municipality": "Municipalité Rdayef",
      "code": "XNG44567",
      "title": "DECHETS EN VERRE",
      "date": "10/01/2022",
      "sacName": "1 Sac En Verre 30L",
      "demand": "Demande N 25213",
      "dateDemand": "Le 01/02/2022"
    },
    {
      'name': 'ELFlen Fouleni',
      'image': 'assets/images/waste.png',
      "icon": "assets/images/secondprofile.png",
      "municipality": "Municipalité Rdayef",
      "code": "XNG44567",
      "title": "DECHETS EN BIOMASSE",
      "date": "10/01/2022",
      "sacName": "1 Sac En biomasse 30L",
      "demand": "Demande N 25213",
      "dateDemand": "Le 01/02/2022"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
            itemCount: 3,
            itemBuilder: (context, index) {
              return UserWidget(
                name: collectList[index]['name'],
                imageURL: collectList[index]['image'],
                icon: collectList[index]['icon'],
                municipality: collectList[index]['municipality'],
                code: collectList[index]['code'],
                title: collectList[index]['title'],
                date: collectList[index]['date'],
                sacName: collectList[index]['sacName'],
                demand: collectList[index]['demand'],
                dateDemand: collectList[index]['dateDemand'],
              );
            }));
  }
}

class UserWidget extends StatelessWidget {
  final String name;
  final String imageURL;
  final String icon;
  final String municipality;
  final String code;
  final String title;
  final String date;
  final String sacName;
  final String demand;
  final String dateDemand;

  const UserWidget({
    required this.name,
    required this.imageURL,
    required this.icon,
    required this.municipality,
    required this.code,
    required this.title,
    required this.date,
    required this.sacName,
    required this.demand,
    required this.dateDemand,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          imageURL,
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        ListTile(
          leading: const Icon(
            FeatherIcons.truck,
            color: Color(0xFF65C88D),
          ),
          title: Text(
            "Collecte",
            style: GoogleFonts.tajawal(
                textStyle: const TextStyle(
              color: Color(0xFF65C88D),
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            )),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: const Color(0xFFdff4ec),
          indent: MediaQuery.of(context).size.width * 4 / 100,
          endIndent: MediaQuery.of(context).size.width * 4 / 100,
        ),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 40,
                bottom: MediaQuery.of(context).size.height / 40,
                left: MediaQuery.of(context).size.width / 25),
            child: Image.asset(icon,
                height: 120, fit: BoxFit.contain),
          ),
          const SizedBox(
            height: 20,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF393e41),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
              ),
              Text(
                municipality,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xF2393E41),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                )),
              ),
              Text(
                code,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xF2393E41),
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0,
                )),
              ),
            ],
          )
        ]),
        Divider(
          height: 1,
          thickness: 1,
          color: const Color(0xFFdff4ec),
          indent: MediaQuery.of(context).size.width * 4 / 100,
          endIndent: MediaQuery.of(context).size.width * 4 / 100,
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF0f5257),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
              ),
              Text(
                date,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF276368),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
              ),
              Text(
               sacName,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF393e41),
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                )),
              ),
              Text(
               demand,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF494d50),
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                )),
              ),
              Text(
               dateDemand,
                style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                  color: Color(0xFF494d50),
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                )),
              )
            ])),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapView()),
                  );
                },
                icon:
                    const Icon(FeatherIcons.mapPin, color: Color(0xFF65C88D))),
            IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {},
                icon: const Icon(FeatherIcons.messageSquare,
                    color: Color(0xFF65C88D))),
            IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {},
                icon: const Icon(FeatherIcons.settings,
                    color: Color(0xFF65C88D))),
            IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {},
                icon:
                    const Icon(FeatherIcons.xCircle, color: Color(0xFF65C88D))),
          ],
        )
      ]),
    );
  }
}
