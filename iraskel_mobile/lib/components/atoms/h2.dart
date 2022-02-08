import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H2Text extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final h2text;
  // ignore: prefer_typing_uninitialized_variables
  final align;
  const H2Text({Key? key, this.h2text, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2,
      child: Text(
        h2text,
        style: GoogleFonts.tajawal(
          textStyle: const TextStyle(
            color: Color(0xFF65C88D),
            fontWeight: FontWeight.w700,
            fontSize: 34.0,
            decoration: TextDecoration.none,
          ),
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
