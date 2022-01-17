import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';

class BacForm extends StatefulWidget {
  const BacForm({Key? key}) : super(key: key);

  @override
  _BacFormState createState() => _BacFormState();
}

class _BacFormState extends State<BacForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                margin: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 10),
                child: Column(children: [
                  const FormHeader(headerText: 'Propriété'),
                  Expanded(
                      child: SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: []))))
                ]))));
  }
}
