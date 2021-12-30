import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/templates/comfirmtemplate.dart';


class ConfirmPage extends StatefulWidget {
  const ConfirmPage({ Key? key }) : super(key: key);

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ComfirmTemplate('assets/getstarted/back_login.png', BoxFit.contain, 'Confirmez', 'Confirmer', 40, 'Code')
    );
  }
}
