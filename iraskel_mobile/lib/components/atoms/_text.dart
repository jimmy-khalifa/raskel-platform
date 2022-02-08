import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  final String largeText;
  final dynamic fontweight;
  // ignore: use_key_in_widget_constructors
  const CustomText(this.largeText,this.fontweight);

  @override
  Widget build(BuildContext context) {
    return Text(
      largeText,
      style: GoogleFonts.tajawal(
          textStyle:  TextStyle(
        color: const Color(0xFF393E41),
        fontWeight: fontweight,
        fontSize: 15.0,
      )),
      
    );
  }
}