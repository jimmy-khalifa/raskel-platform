import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartDescription extends StatelessWidget {
  final descriptionText;
  const StartDescription({Key? key, this.descriptionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            descriptionText,
            style: GoogleFonts.tajawal(
                textStyle: const TextStyle(
              color: Color(0XFF474C4E),
              fontWeight: FontWeight.w300,
              fontSize: 18.0,
            )),
          )),
    );
  }
}
