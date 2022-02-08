import "package:flutter/material.dart";
import 'package:iraskel_mobile/components/molecules/_simplerow.dart';

class RowInsideRow extends StatelessWidget {
  final String subtitle1;
  final String response1;
  final String subtitle2;
  final String response2;

  // ignore: use_key_in_widget_constructors
  const RowInsideRow(this.subtitle1,this.response1,this.subtitle2,this.response2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRow(subtitle1, response1),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
        CustomRow(subtitle2, response2),
        

      ],
      
    );
  }
}