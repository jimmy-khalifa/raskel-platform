import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String txt;
  final page;

  // ignore: use_key_in_widget_constructors
  const Button(this.txt, this.page);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height /
                                              80,
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              9),
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      color: Color(0xFF65C88D)),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => widget.page),
                                  );
                                 
                                },
                                child: Text(
                                  widget.txt,
                                  style: GoogleFonts.tajawal(
                                      textStyle: const TextStyle(
                                    color: Color(0xFF65C88D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                  )),
                                )
      )
      
    );
  }
}