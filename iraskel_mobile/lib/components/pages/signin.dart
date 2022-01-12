import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/mainpage.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'confirmpage.dart';

const userPhone = """
mutation(\$input: PhoneInput!) {
  user_phone(input: \$input) {
    
    err{
			code
			message
		}
		user{
			username
			phone_number
			first_name
			last_name
			email
			is_active
			is_confirmed
			is_verified
			
		}
		
		
  }
}

""";

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  late String phone = "";
  setPhoneNumber(value) {
    setState(() => {phone = value});
 
  }

  

  oncompleted(data) async{
   
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
  }

  late Future<String?> phoneNumber;

  @override
  void initState() {
    super.initState();
    phoneNumber = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('phone_number');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder<String?>(
         future: phoneNumber,
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
      return // snapshot.data != null
          Card(
        margin: const EdgeInsets.only(top: 25, bottom: 10),
        elevation: 0,
        child: Container(
          decoration: CustomDecoration(
            'assets/getstarted/back_login.png',
            BoxFit.contain,
          ).baseBackgroundDecoration(),
          child: Container(
            margin:
                const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              reverse: true,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                // <-- alignments
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 20),
                    child: BigTitle(
                      '${LocalizationHelper.of(context)!.t_join}',
                    ),
                  ),
                  PhoneField(setPhoneNumber),
                  const Spacing(40),
                  //  Button('Se connecter', onpressedSignIn)
                  GraphqlButton(
                      'se connecter',
                      false,
                      userPhone,
                      {
                        "input": {"phone_number": snapshot.data}
                      },
                      oncompleted)
                ],
              ),
            ),
          ),
        ),
      );
      //: Text("vous devez signup");
    }));
  }
}
