import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  final String urlImage;
  final String? username;
  // ignore: use_key_in_widget_constructors
  const ProfileWidget(this.urlImage, this.username);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        child: ListTile(
            title: Column(children: [
          Image.asset(
            urlImage,
            height: 120,
          ),
          const Spacer(),
          Text(username!,
              style: GoogleFonts.tajawal(
                  textStyle: const TextStyle(
                color: Color(0xFF393E41),
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
              ))),
        ])));
  }
}
