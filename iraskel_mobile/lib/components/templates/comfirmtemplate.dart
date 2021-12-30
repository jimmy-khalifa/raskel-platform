import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';


class ComfirmTemplate extends StatefulWidget {
  final String imageSrc;
  // ignore: prefer_typing_uninitialized_variables
  final fitType;
  final String title;
  final String txt;
  
  final num int;
  final String hinttext;
  // ignore: use_key_in_widget_constructors
  const ComfirmTemplate(this.imageSrc,this.fitType,this.title,this.txt,this.int,this.hinttext);

  @override
  _ComfirmTemplateState createState() => _ComfirmTemplateState();
}

class _ComfirmTemplateState extends State<ComfirmTemplate> {
  @override
  void initState() {
    super.initState();
  }
  onpressed() {
   
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 25,
        bottom: MediaQuery.of(context).size.height / 80 ),
        elevation: 0,
                     
        child: Container(
          constraints: const BoxConstraints.expand(),
      decoration: CustomDecoration(widget.imageSrc, widget.fitType)
          .baseBackgroundDecoration(),
      child: SingleChildScrollView(
        //reverse: true,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround, 
          mainAxisAlignment: MainAxisAlignment.center,// <-- alignments
          children: [
            Container(
              padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 4) ,
              child: BigTitle(widget.title),

            ),
             Spacing(widget.int),
          //  CustomInput(widget.hinttext),
            Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Button(widget.txt, onpressed),

                )
            ]))));
            
  }
}