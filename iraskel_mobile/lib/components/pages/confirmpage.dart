import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/mainpage.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../../auth_graphql_client.dart';

const verifyNumber = """
mutation(\$input: CodeInput!) {
  verify_phone_number(input: \$input) {
    success
    err
    
		
  }
}
""";
const tokenCreate = """
mutation TokenAuth(\$phone_number: String!, \$password: String!) {
    tokenAuth(phone_number: \$phone_number, password: \$password) {
        token
    
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
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String code = "";
  setCode(value) {
    setState(() {
      code = value;
    });
  }

  String phoneNumber = "";
  setPhoneNumber(value) {
    setState(() => {phoneNumber = value});
  }

  late final Box box = Hive.box('auth');
  void mutationTokenAuth() async {
    final MutationOptions options = MutationOptions(
      document: gql(tokenCreate),
      /* onCompleted: (data) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      },*/
      variables: {"phone_number": phoneNumber, "password": code},
    );
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).mutate(options);
    if (result.hasException) {
      // return Text(result.exception!.graphqlErrors[0].message);
      final snackBar = SnackBar(
        content: Text(result.exception!.graphqlErrors[0].message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //  print("erreur");
    } else {
      // ignore: non_constant_identifier_names, unused_local_variable
      final token_created = result.data?["tokenAuth"]["token"];
      box.put("token", token_created);
      // print(modified_prod['producer']['id']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }

  void initHiveState() async {
    late final Box box = Hive.box('auth');
    setPhoneNumber(box.get('phoneNumber'));
  }
 Future<void> sendmail () async {
   final Email sendEmail = Email(
      body: 'Password',
      subject: 'your password is $code',
      recipients: ['rim.horchani@ipalm.tn'],
      bcc: ['khaled.khalifa@ipalm.tn'],
     // isHTML: false,
    );
   await FlutterEmailSender.send(sendEmail);

 }
  @override
  void initState() {
    super.initState();
    initHiveState();
   
    
    // mutationTokenAuth();
  }


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                            child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // <-- alignments
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height /
                                                20),
                                    child: BigTitle(
                                        '${LocalizationHelper.of(context)!.t_confirmTitle}',
                                        36.0),
                                  ),
                                  const Spacing(40),
                                  CustomInput(
                                    '${LocalizationHelper.of(context)!.t_code}',
                                    setCode,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: GraphqlButton(
                                          '${LocalizationHelper.of(context)!.t_confirmButton}',
                                          false,
                                          verifyNumber, {
                                        "input": {
                                          "phone_number": phoneNumber,
                                          "code": code
                                        }
                                      }, (data) async {
                                        late final Box box = Hive.box('auth');
                                        box.put('isConfirmed', true);
                                        mutationTokenAuth();
                                        sendmail();
                                      },

                                          /*  return showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text(
                                                      '${LocalizationHelper.of(context)!.t_confirmation}'),
                                                  content: Text(
                                                      '${LocalizationHelper.of(context)!.t_registration}'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Annuler'),
                                                      child: Text(
                                                          '${LocalizationHelper.of(context)!.t_cancel}',
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFF65C88D))),
                                                    ),
                                                    GraphqlButtonWithoutKey(
                                                      '${LocalizationHelper.of(context)!.t_ok}',
                                                      false,
                                                      tokenCreate,
                                                      {
                                                        "phone_number":
                                                            phoneNumber,
                                                        "password": code
                                                      },
                                                      (data) async {
                                                       
                                                        late final Box box =
                                                            Hive.box('auth');
                                                        box.put(
                                                            'token',
                                                            data["tokenAuth"]
                                                                ["token"]);
                                                                
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const MainPage()));
                                                                      
                                                      
                                                      // ignore: non_constant_identifier_names
                                                  
                                         },
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          30,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          80,
                                                    )
                                                  ],
                                                  // content: ,
                                                ));*/
                                          formKey)),
                                ])))))));
  }
}
