import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String txt;
  // ignore: prefer_typing_uninitialized_variables
  final onpressed;
  // ignore: prefer_typing_uninitialized_variables
  // final vertical;
  // ignore: prefer_typing_uninitialized_variables
  // final horizontal;
  // ignore: use_key_in_widget_constructors
  const Button(this.txt, this.onpressed); //,this.horizontal,this.vertical);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(100, 50),
          maximumSize: const Size(150, 150),
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF65C88D)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onPressed: () {
          onpressed();
        },
        child: Text(
          txt,
          style: GoogleFonts.tajawal(
              textStyle: const TextStyle(
            color: Color(0xFF65C88D),
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          )),
        ));
  }
}
