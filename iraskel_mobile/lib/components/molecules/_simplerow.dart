import "package:flutter/material.dart";
import 'package:iraskel_mobile/components/atoms/_text.dart';

class CustomRow extends StatelessWidget {
  
  final String subtitle;
  final String response;
    // ignore: use_key_in_widget_constructors
    const CustomRow(this.subtitle,this.response);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       CustomText(subtitle, FontWeight.w700,15),
       const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
       CustomText(response, FontWeight.w200,15)
      ],
      
    );
  }
}