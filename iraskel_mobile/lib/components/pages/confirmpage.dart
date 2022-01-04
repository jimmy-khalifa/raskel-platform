import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';

const verifyNumber = """
mutation(\$input: CodeInput!) {
  verify_phone_number(input: \$input) {
    success
    err
  }
}
""";

class ConfirmPage extends StatefulWidget {
  final  Map<String,dynamic> user;
  const ConfirmPage(this.user);

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
    @override
  void initState() {
    super.initState();
  }
  late String code = "";
   setCode(value) {
    setState(() => {code = value});
  }
  oncompleted(data){
    print(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: BigTitle('Confirmez'),
                      ),
                      Spacing(40),
                      CustomInput('Code',setCode),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: GraphqlButton('Confimer', false, verifyNumber, {
                            "input": {
                              "phone_number": widget.user["phone_number"],
                              "code": code
                            }
                          },oncompleted))
                    ]))))

        //ComfirmTemplate('assets/getstarted/back_login.png', BoxFit.contain, 'Confirmez', 'Confirmer', 40, 'Code')
        );
  }
}
