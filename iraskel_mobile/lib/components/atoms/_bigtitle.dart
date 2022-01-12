import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTitle extends   StatelessWidget {
 
  final String title;
  // ignore: use_key_in_widget_constructors
  const BigTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.tajawal(
          textStyle: const TextStyle(
        color: Color(0xFF65C88D),
        fontWeight: FontWeight.w700,
        fontSize: 36.0,
      )),
    );
  }
}
