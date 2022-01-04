import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onClicked;
  const MenuItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF65C88D),
      ),
      title: Text(
        text,
        style: GoogleFonts.tajawal(
            textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Color(0xFF65C88D))),
      ),
      hoverColor: Colors.black12,
      onTap: onClicked(),
    );
  }
}
