import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HeaderDrawer extends StatefulWidget {
    const HeaderDrawer({Key? key}) : super(key: key);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 200,
      padding:const EdgeInsets.only(top: 20.0),
      child: ListTile(
        title: Column(children: [ 
          Image.asset('assets/images/profile.png',height: 120,),
          const Spacer(),
         Text('ElFouleni Foulen', style: GoogleFonts.tajawal(textStyle: const TextStyle(
                    color: Color(0xFF393E41),
                    fontWeight: FontWeight.w300,
                    fontSize: 30.0,
                  ))),
        ]))
          
      
    );
  }
}
