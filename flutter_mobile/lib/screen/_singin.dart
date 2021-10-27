import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Text(
            "Connectez-Vous",
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
                textStyle: const TextStyle(
              color: Color(0xFF65C88D),
              fontWeight: FontWeight.w700,
              fontSize: 34.0,
            )),
          ),
        ]),
        Column(children: [
          const TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              hintText: "Nom d'Utilisateur",
            ),
          ),
          const TextField(
            decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          hintText: "Mot de passe",
            ),
          ),
          CheckboxListTile(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
              title: const Text(" Rester connecter"),
              controlAffinity: ListTileControlAffinity.leading
              ),
              TextButton(onPressed: (){}, 
              child: const Text(
                "Mot de passe Oublié?"
              )),
              Center(

              )
        ]),
      ],
    )));
  }
}
