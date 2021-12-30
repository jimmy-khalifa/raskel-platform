import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'localizations/app_localizations.dart';

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

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Language>(
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onChanged: (language) {
                  LocalizationHelper.ChangeLanguage(language!, context);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[Text(e.languageCode)],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        body: Card(
            child: Container(
                constraints: const BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 20),
                      child: Text(
                        '${LocalizationHelper.of(context)!.t_description}',
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
                        autovalidateMode: AutovalidateMode.always,
                        key: formkey,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 10,
                                right: MediaQuery.of(context).size.width / 10),
                            child: Column(children: [
                              TextFormField(
                                initialValue: "rim.horchani",
                                validator: RequiredValidator(
                                    errorText: 'Nom required'),
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
                                initialValue: "123456789**",
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Mot de passe required'),
                                  MinLengthValidator(8,
                                      errorText:
                                          'Mot de passe doit contenir minimum 8 chiffres'),
                                  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                      errorText:
                                          'Mot de passe doit contenir au moins un spécial caractère')
                                ]),
                                cursorColor: const Color(0xFFDFF4EC),
                                obscureText: !_isObscure,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? FeatherIcons.eye
                                          : FeatherIcons.eyeOff,
                                      color: const Color(0xFFDFF4EC),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF65C88D)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
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
                                onPressed: () {},
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
<<<<<<< HEAD
                          const Button("se connecter", SignIn)
=======
                        //  const Button("se connecter", )
>>>>>>> App commit all work
                        ])),
                  ],
                ))));
  }
}
