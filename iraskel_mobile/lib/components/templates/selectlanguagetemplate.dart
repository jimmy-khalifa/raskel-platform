import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_dropdownlanguage.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/pages/signup.dart';

class SelectLanguageTemplate extends StatefulWidget {
  final String imageSrc;
  // ignore: prefer_typing_uninitialized_variables
  final fitType;
  final String title;
  final String txt;
  
  // ignore: use_key_in_widget_constructors
  const SelectLanguageTemplate(
      this.imageSrc, this.fitType, this.title, this.txt);

  @override
  _SelectLanguageTemplateState createState() => _SelectLanguageTemplateState();
}

class _SelectLanguageTemplateState extends State<SelectLanguageTemplate> {
  @override
  void initState() {
    super.initState();
  }
  onpressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
   
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 25,
            bottom: MediaQuery.of(context).size.height / 80),
        elevation: 0,
        child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: CustomDecoration(widget.imageSrc, widget.fitType)
                .baseBackgroundDecoration(),
            child: SingleChildScrollView(
                //reverse: true,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      BigTitle(widget.title),
                      const DropdownLanguageSelect(),
                     Button(widget.txt, onpressed) ,
                     
                     
                    ]))));
  }
}