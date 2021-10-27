import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class CollectDetail extends StatefulWidget {
  const CollectDetail({Key? key}) : super(key: key);

  @override
  _CollectDetailState createState() => _CollectDetailState();
}

class _CollectDetailState extends State<CollectDetail> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 30),
        itemCount: 3,
        itemBuilder: (context,index){

          return
             Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/pngwing.png',height:MediaQuery.of(context).size.height /4,width:MediaQuery.of(context).size.width, fit: BoxFit.cover,),
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
                Padding(padding:const EdgeInsets.only(top:10,bottom: 10,left: 10),
                child:
                Image.asset('assets/images/secondprofile.png',
                      height: 120, fit: BoxFit.contain),
                ), 
                 const SizedBox(
                   height: 20,
                   width: 50,

                 ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('ElFouleni Foulen',style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF393e41),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),),
                      Text("Municipalité Rdayef",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xF2393E41),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                )),),
                      Text("XNG44567",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xF2393E41),
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0,
                )),),
                    ],
              )]),
              
              Divider(
                height: 1,
                thickness: 1,
                color: const Color(0xFFdff4ec),
                indent: MediaQuery.of(context).size.width * 4 / 100,
                endIndent: MediaQuery.of(context).size.width * 4 / 100,
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DECHETS EN PLASTIQUES",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF0f5257),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
                        ),
                        Text(
                          "10/01/2022",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF276368),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
                        ),
                        Text("1 Sac En Plastique 30L",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF393e41),
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0,
                )),),
                        Text("Demande N 25213",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF494d50),
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                )),),
                        Text("Le 01/02/2022",style: GoogleFonts.tajawal(
                    textStyle:const TextStyle(
                  color: Color(0xFF494d50),
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                )),)
                      ])),
            
          ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.mapPin, color: Color(0xFF65C88D))),
                           IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.messageSquare, color: Color(0xFF65C88D))),
                           IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.settings, color: Color(0xFF65C88D))),
                          IconButton(
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon:const Icon(FeatherIcons.xCircle, color: Color(0xFF65C88D))),
                          
                          ],)]),
      
         
      );}),);
    
  }
}
