import 'package:flutter/material.dart';

class ConfirmationInfo extends StatefulWidget {
  const ConfirmationInfo({Key? key}) : super(key: key);

  @override
  _ConfirmationInfoState createState() => _ConfirmationInfoState();
}

class _ConfirmationInfoState extends State<ConfirmationInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return Card(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25,
              bottom: MediaQuery.of(context).size.height / 45),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            
          ));
    }));
  }
}
