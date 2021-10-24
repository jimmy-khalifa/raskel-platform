import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticipateWidget extends StatelessWidget {
  const ParticipateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height / 7 - 30),
              // ),
              Center(
                  child: Image.asset(
                'assets/getstarted/participate.png',
                fit: BoxFit.scaleDown,
              )),
              Center(
                heightFactor: 2,
                child: Text(
                  'Participer',
                  style: GoogleFonts.tajawal(
                      textStyle: const TextStyle(
                    color: Color(0xFF65C88D),
                    fontWeight: FontWeight.w700,
                    fontSize: 34.0,
                  )),
                ),
              ),
              Center(
                heightFactor: 1,
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      'Participez par le trie de vos déchets dans les bacs désignés. Raskel vous permet de suivre le cycle de vie de vos déchets. ',
                      style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                        color: Color(0XFF474C4E),
                        fontWeight: FontWeight.w300,
                        fontSize: 18.0,
                      )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
