import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/signup.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String phoneNumber = "";
  late String errorMessage = "";
  setPhoneNumber(value) {
    setState(() => {phoneNumber = value});
    late final Box box = Hive.box('auth');
    box.put('phoneNumber', value);
  }

  setErrorMessage(value) {
    setState(() {
      errorMessage = value;
    });
  }

  oncompleted(data) async {
    if (data['user_phone']["user"] != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ConfirmPage()));
    } else {
      setErrorMessage(data['user_phone']['err']['message']);
    }
  }

  signupPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*        body: FutureBuilder<String?>(
            future: phoneNumber,
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              // if (snapshot.connectionState == ConnectionState.done) {
           return // snapshot.data != null
*/
        body: Card(
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
                  child: Form(
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
                              bottom: MediaQuery.of(context).size.height / 20),
                          child: BigTitle(
                              '${LocalizationHelper.of(context)!.t_join}',
                              36.0),
                        ),
                        PhoneField(
                          setPhoneNumber,
                        ),
                        Text(
                          errorMessage,
                          style: GoogleFonts.tajawal(
                              textStyle: const TextStyle(
                            color: Color(0xFFF07167),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          )),
                        ),
                        const Spacing(20),
                        GraphqlButton(
                            '${LocalizationHelper.of(context)!.t_connect}',
                            false,
                            userPhone,
                            {
                              "input": {"phone_number": phoneNumber}
                            },
                            oncompleted,
                            formKey),
                        const Spacing(60),
                        Button(
                          'S"inscrire',
                          signupPressed,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
        //  } else {
        //  return const Text("data");
        //}
        );
  }
}
