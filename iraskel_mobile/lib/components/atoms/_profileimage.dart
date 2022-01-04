import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        child: ListTile(
            title: Column(children: [
          Image.asset(
            'assets/images/profile.png',
            height: 120,
          ),
          const Spacer(),
          Text('ElFouleni Foulen',
              style: GoogleFonts.tajawal(
                  textStyle: const TextStyle(
                color: Color(0xFF393E41),
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
              ))),
        ])));
  }
}
