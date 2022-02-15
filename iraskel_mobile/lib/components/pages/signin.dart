import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/signup.dart';
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

  oncompleted(data) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ConfirmPage()));
  }

  signupPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  late Future<String?> phoneNumber;

  @override
  void initState() {
    super.initState();
    phoneNumber = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('phone_number');
    });
  }
    final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String?>(
            future: phoneNumber,
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
             // if (snapshot.connectionState == ConnectionState.done) {
                return // snapshot.data != null
                    Card(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 25,
                      bottom: MediaQuery.of(context).size.height / 80),
                  elevation: 0,
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: CustomDecoration(
                      'assets/getstarted/back_login.png',
                      BoxFit.contain,
                    ).baseBackgroundDecoration(),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 4,
                          left: MediaQuery.of(context).size.width / 10,
                          right: MediaQuery.of(context).size.width / 10,
                          bottom: MediaQuery.of(context).size.height / 4),
                      child: SingleChildScrollView(
                        child:Form(
                          key: formKey,
                        //  padding: EdgeInsets.zero,
                        //reverse: true,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // <-- alignments
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height / 20),
                              child: BigTitle(
                                  '${LocalizationHelper.of(context)!.t_join}',
                                  36.0),
                            ),
                            PhoneField(setPhoneNumber, ),
                            const Spacing(40),
                           GraphqlButton(
                                '${LocalizationHelper.of(context)!.t_connect}',
                                false,
                                userPhone,
                                {
                                  "input": {"phone_number": snapshot.data}
                                },
                                oncompleted,
                                MediaQuery.of(context).size.width / 30,
                                MediaQuery.of(context).size.height / 80,formKey) ,
                            const Spacing(25),
                            Button(
                              'S"inscrire',
                              signupPressed,
                              MediaQuery.of(context).size.width / 30,
                              MediaQuery.of(context).size.height / 80,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                    ));
            //  } else {
              //  return const Text("data");
              //}
            }));
  }
}
