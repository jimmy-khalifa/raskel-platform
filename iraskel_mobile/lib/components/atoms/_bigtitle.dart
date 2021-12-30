import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigTitle extends StatefulWidget {
  final String title;
  // ignore: use_key_in_widget_constructors
  const BigTitle(this.title);

  @override
  _BigTitleState createState() => _BigTitleState();
}

class _BigTitleState extends State<BigTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: GoogleFonts.tajawal(
          textStyle: const TextStyle(
        color: Color(0xFF65C88D),
        fontWeight: FontWeight.w700,
        fontSize: 36.0,
      )),
    );
  }
}
