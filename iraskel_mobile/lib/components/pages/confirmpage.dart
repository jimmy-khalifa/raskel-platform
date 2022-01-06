import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/mainpage.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const verifyNumber = """
mutation(\$input: CodeInput!) {
  verify_phone_number(input: \$input) {
    success
    err
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

class ConfirmPage extends StatefulWidget {
  //final  Map<String,dynamic> user;
  // ignore: use_key_in_widget_constructors
  const ConfirmPage();

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  late String code = "";
   setCode(value) {
    setState(() => {code = value});
  }
  oncompleted(data) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isConfirmed', data["verify_phone_number"]["user"]["is_confirmed"]);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
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
    return 
    
     Scaffold(
        body: FutureBuilder<String?>(
          future: phoneNumber,
          builder: (BuildContext context, AsyncSnapshot<String?> phone){
        
        return
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
                child: SingleChildScrollView(
                    //reverse: true,
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // <-- alignments
                        children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 4),
                        child:  BigTitle('${LocalizationHelper.of(context)!.t_confirmTitle}'),
                      ),
                      const Spacing(40),
                      CustomInput('${LocalizationHelper.of(context)!.t_code}',setCode),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: GraphqlButton('${LocalizationHelper.of(context)!.t_confirmButton}', false, verifyNumber, {
                            "input": {
                              "phone_number":phone.data ,
                              "code": code
                            }
                          },oncompleted,))
                    ]))));})

        //ComfirmTemplate('assets/getstarted/back_login.png', BoxFit.contain, 'Confirmez', 'Confirmer', 40, 'Code')
        );
  }
}
