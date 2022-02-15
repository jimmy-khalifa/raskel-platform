import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTitle extends   StatelessWidget {
 
  final String title;
  final double size;
  // ignore: use_key_in_widget_constructors
  const BigTitle(this.title,this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.tajawal(
          textStyle:  TextStyle(
        color: const Color(0xFF65C88D),
        fontWeight: FontWeight.w700,
        fontSize: size,
      )),
    );
  }
}
