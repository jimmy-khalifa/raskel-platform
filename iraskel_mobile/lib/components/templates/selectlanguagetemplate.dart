import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_dropdownlanguage.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/pages/_getstarted.dart';

class SelectLanguageTemplate extends StatefulWidget {
  final String imageSrc;
  // ignore: prefer_typing_uninitialized_variables
  final fitType;
  final String title;
  final String txt;
  // ignore: prefer_typing_uninitialized_variables
  final orientation;

  // ignore: use_key_in_widget_constructors
  const SelectLanguageTemplate(
      this.imageSrc, this.fitType, this.title, this.txt, this.orientation);

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
      MaterialPageRoute(
          builder: (context) => const GetStarted()), //SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: widget.orientation == Orientation.portrait
            ? EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45)
            : EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: widget.orientation == Orientation.portrait
            ? Container(
                constraints: const BoxConstraints.expand(),
                decoration: CustomDecoration(widget.imageSrc, widget.fitType)
                    .baseBackgroundDecoration(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: BigTitle(widget.title, 36.0),
                      ),
                      const DropdownLanguageSelect(),
                      Button(widget.txt, onpressed),
                    ]))
            : Container(
                constraints: const BoxConstraints.expand(),
                decoration: CustomDecoration(widget.imageSrc, widget.fitType)
                    .baseBackgroundDecoration(),
                child:
                    //reverse: true,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      BigTitle(widget.title, 36.0),
                      const DropdownLanguageSelect(),
                      Button(widget.txt,
                          onpressed), //,MediaQuery.of(context).size.width /80,MediaQuery.of(context).size.height / 80),
                    ])));
  }
}
