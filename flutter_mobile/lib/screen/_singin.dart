import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobile/screen/_signup.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:google_fonts/google_fonts.dart';

import '_home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      // ignore: avoid_print
      print("Validée!");
    } else {
      // ignore: avoid_print
      print("Non validée !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
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
                        "Connectez-Vous",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tajawal(
                            textStyle: const TextStyle(
                          color: Color(0xFF65C88D),
                          fontWeight: FontWeight.w700,
                          fontSize: 34.0,
                        )),
                      ),
                    ),
                    Form(
                      autovalidate: true,
                        key: formkey,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 10,
                                right: MediaQuery.of(context).size.width / 10),
                            child: Column(children: [
                              TextFormField(
                               validator: RequiredValidator(errorText: 'Nom required'),
                                cursorColor: const Color(0xFFDFF4EC),
                                decoration: const InputDecoration(
                                
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF65C88D)),
                                  ),
                                  
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFDFF4EC)),
                                  ),
                                  hintText: "Nom d'utilisateur",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                               TextFormField(
                                 validator: MultiValidator([  
    RequiredValidator(errorText: 'Mot de passe required'),  
    MinLengthValidator(8, errorText: 'Mot de passe doit contenir minimum 8 chiffres'),  
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Mot de passe doit contenir au moins un spécial caractère')  
 ]),
  
                                cursorColor: const Color(0xFFDFF4EC),
                                decoration: const InputDecoration(
                                  
                                  suffixIcon: Icon(
                                    FeatherIcons.eye,
                                    color: Color(0xFFDFF4EC),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF65C88D)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFDFF4EC)),
                                  ),
                                  hintText: "Mot de passe",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                          CheckboxListTile(
                              activeColor: const Color(0xFF65C88D),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              title: Text(" Rester connecter",
                                  style: GoogleFonts.tajawal(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF393E41)))),
                              controlAffinity: ListTileControlAffinity.leading),
                          TextButton(
                              onPressed: () {},
                              child: Text("Mot de passe Oublié?",
                                  style: GoogleFonts.tajawal(
                                      textStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF393E41),
                                  )))),
                          Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height / 180),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height /
                                              80,
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              15),
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      color: Color(0xFF65C88D)),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {
                                 if(formkey.currentState!.validate()) {
                                     Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                  );

                                 }
                                
                                },
                                child: Text(
                                  "Se Connecter",
                                  style: GoogleFonts.tajawal(
                                      textStyle: const TextStyle(
                                    color: Color(0xFF65C88D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0,
                                  )),
                                )),
                          ),
                          Center(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height /
                                              80,
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              15),
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
                                        builder: (context) => const SignUp()),
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
                          )
                        ])),
                  ],
                ))));
  }
}
