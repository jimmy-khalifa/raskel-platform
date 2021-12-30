import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  final String largeText;
  // ignore: use_key_in_widget_constructors
  const CustomText(this.largeText);

  @override
  Widget build(BuildContext context) {
    return Text(
      largeText,
      style: GoogleFonts.tajawal(
          textStyle: const TextStyle(
        color: Color(0xFF393E41),
        fontWeight: FontWeight.w200,
        fontSize: 15.0,
      )),
      
    );
  }
}