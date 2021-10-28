import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobile/screen/_singin.dart';

import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  Object? _valueChoose;
  List listItem = ["Rdayef", "Degueche", "Mahres","Sfax"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color(0xFFDFF4EC)),
        child: Card(
            child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/getstarted/back_login.png'),
                        fit: BoxFit.contain)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 20),
                      child: Text(
                        "Joindre",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                            textStyle: const TextStyle(
                          color: Color(0xFF65C88D),
                          fontWeight: FontWeight.w700,
                          fontSize: 34.0,
                        )),
                      ),
                    ),
                    Column(children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width / 10),
                        child: Column(children: [
                          const TextField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                              ),
                              hintText: "Nom d'Utilisateur",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          const TextField(
                            cursorColor: Color(0xFFDFF4EC),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Color(0xFFDFF4EC)),
                              ),
                              hintText: "Prénom",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          const TextField(
                            cursorColor: Color(0xFFDFF4EC),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                              ),
                              hintText: "Nom",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          const TextField(
                            cursorColor: Color(0xFFDFF4EC),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                FeatherIcons.eye,
                                color: Color(0xFFDFF4EC),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Color(0xFFDFF4EC)),
                              ),
                              hintText: "Mot de passe",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          const TextField(
                            cursorColor: Color(0xFFDFF4EC),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                              ),
                              hintText: "CIN",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          const TextField(
                            cursorColor: Color(0xFFDFF4EC),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF65C88D)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                              ),
                              hintText: "Téléphone",
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          InputDecorator(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color(0xFF65C88D)),
                                      borderRadius: BorderRadius.circular(5.0)),
                                      enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                              ),
                                  contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height/100)),
                                  child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: const Text("Municipalité"),
                                icon: const Icon(
                                  FeatherIcons.chevronDown,
                                  color: Color(0xFFDFF4EC),
                                ),
                                iconSize: 36,
                                isExpanded: true,
                                value: _valueChoose,
                                onChanged: (newvalue) => setState(() {
                                  _valueChoose = newvalue;
                                }),
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                           ) )),
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: OutlinedButton(
                          
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height /80,horizontal: MediaQuery.of(context).size.width /15),
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFF65C88D)),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: Text(
                              "Rejoindre",
                              style: GoogleFonts.tajawal(
                                  textStyle: const TextStyle(
                                color: Color(0xFF65C88D),
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                              )),
                            )),
                      ),
                    ]),
                  ],
                ))));
  }
}
